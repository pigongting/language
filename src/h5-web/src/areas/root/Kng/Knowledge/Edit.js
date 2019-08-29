/* 开源-组件 */
import React, { Fragment } from 'react';
import { connect } from 'react-redux';
import { Form, Button, Input, Radio, Checkbox, Cascader, Select, Spin } from 'antd';
import debounce from 'lodash/debounce';
import clone from 'clone';
/* 自研-组件 */
import BaseForm from '@/components/BaseForm';
import BaseFormFieldGroup from '@/components/BaseForm/FieldGroup';
/* 自研-工具 */
import Enums from '@/Enums';
import { handleFormReset } from '@/utilities/common';
import { search2form, form2search, handleParams } from '@/utilities/util';
/* 数据 */
import { store, history, addAsyncModel } from '@/store';
import { namespacePrefix, Edit } from './Model';
/* 相对路径-组件 */
import FormBrowserSupport from './BrowserSupport/index';
import FormMultipleCascader from './MultipleCascader/index';
import FormMultipleSelect from './MultipleSelect/index';
/* 相对路径-样式 */
/* 异步数据模型 */
addAsyncModel(Edit);
/* 命名空间(全局唯一) */
const namespace = `${namespacePrefix}Edit`;
/* 变量(方便使用) */
const { dispatch } = store;

class EditComponent extends React.Component {

  constructor(props) {
    super(props);

    // 同步地址拦到redux
    this.keep = handleParams.url(dispatch, namespace);

    this.rGetAllKnowledge = debounce(this.rGetAllKnowledge, 800);
  }

  componentDidMount() {
    // 知识点
    this.rGetEx();
    // 浏览器
    this.rGetAllBrowser();
    // 语言
    this.rGetAllLanguage();
    // 分类
    this.rGetTreeCategory();
  }

  componentWillUnmount() {
    dispatch({ type: namespace + '/clean' });
  }

  // 表单提交
  handleSubmit = e => {
    e.preventDefault();
    this.props.form.validateFields((err, values) => {
      if (!err) {
        const { entity } = this.props.pagedata;

        const callback = () => {
          history.goBack();
        };

        // 复制值
        const valuesClone = clone(values);

        // 移除undefined项
        valuesClone.categoryIds = valuesClone.categoryIds.filter(item => item);
        valuesClone.knowledgeIds = valuesClone.knowledgeIds.filter(item => item);
        // 移除第一项
        valuesClone.knowledgeBrowserVersion.forEach(item => { delete item[0]; });

        dispatch({
          type: `${namespace}/rPut`,
          payload: Object.assign({}, entity, valuesClone),
          callback,
        });
      }
    });
  };

  // 知识点
  rGetEx = () => {
    dispatch({ type: namespace + '/rGetEx', payload: { id: this.keep.id } });
  }

  // 浏览器
  rGetAllBrowser = () => {
    dispatch({ type: namespace + '/rGetAllBrowser' });
  }

  // 语言
  rGetAllLanguage = () => {
    dispatch({ type: namespace + '/rGetAllLanguage' });
  }

  // 分类
  rGetTreeCategory = () => {
    dispatch({ type: namespace + '/rGetTreeCategory' });
  }

  // 知识点
  rGetAllKnowledge = (value) => {
    dispatch({ type: `${namespace}/rGetAllKnowledge`, payload: { name: value } });
  }

  // 验证分类-重复
  handleVerifyCategory = (rule, value, callback) => {
    const valueJoin = value;

    for (let i = 0; i < valueJoin.length; i++) {
      const item = valueJoin[i];
      if (item === undefined) { continue; }

      const join = valueJoin.join(',');
      const reg = new RegExp(item, 'g');
      const match = join.match(reg);

      if (match.length > 1) {
        callback('不能选择重复的分类');
        return;
      }
    }

    // Note: 必须总是返回一个 callback，否则 validateFieldsAndScroll 无法响应
    callback();
  }

  // 验证知识点-重复
  handleVerifyKnowledge = (rule, value, callback) => {
    const valueJoin = value;

    for (let i = 0; i < valueJoin.length; i++) {
      const item = valueJoin[i];
      if (item === undefined) { continue; }

      const join = valueJoin.join(',');
      const reg = new RegExp(item, 'g');
      const match = join.match(reg);

      if (match.length > 1) {
        callback('不能选择重复的知识点');
        return;
      }
    }

    // Note: 必须总是返回一个 callback，否则 validateFieldsAndScroll 无法响应
    callback();
  }

  render() {
    const { getFieldDecorator } = this.props.form;
    const { loading, entity, browser, language, category, knowledge } = this.props.pagedata;

    // 字段
    const fieldGroup = [
      {
        title: '基本信息',
        fields: [
          {
            label: '名称',
            render: getFieldDecorator('name', {
              initialValue: entity.name,
              rules: [{ required: true, message: '请输入名称' }],
            })(<Input size="small" placeholder="请输入名称" autoComplete="new-password" />)
          },
          {
            label: '编码',
            render: getFieldDecorator('code', {
              initialValue: entity.code,
              rules: [{ required: true, message: '请输入名称' }],
            })(<Input size="small" placeholder="请输入编码" autoComplete="new-password" />)
          },
          {
            label: '状态',
            render: getFieldDecorator('state', {
              initialValue: entity.state,
              rules: [{ required: true, message: '请选择状态' }],
            })(
              <Radio.Group>
                {Object.keys(Enums.Common.enableState).filter(key => key !== '0' && key !== '100').map(key => {
                  return (<Radio key={key} value={Number(key)}>{Enums.Common.enableState[key]}</Radio>);
                })}
              </Radio.Group>
            )
          },
        ],
      },
      {
        title: '关联信息',
        fields: [
          {
            label: '关联语言',
            render: getFieldDecorator('languageIds', {
              initialValue: entity.languageIds,
            })(
              <Checkbox.Group>
                {language.map(item => {
                  return (<Checkbox key={item.id} value={item.id}>{item.name}</Checkbox>);
                })}
              </Checkbox.Group>
            )
          },
          {
            label: '关联分类',
            render: getFieldDecorator('categoryIds', {
              initialValue: entity.categoryIds,
              rules: [{ validator: this.handleVerifyCategory }]
            })(<FormMultipleCascader data={category} placeholder="请选择关联分类" />)
          },
          {
            label: '浏览器兼容性',
            render: getFieldDecorator('knowledgeBrowserVersion', {
              initialValue: entity.knowledgeBrowserVersion,
            })(<FormBrowserSupport columnSource={browser} />)
          },
          {
            label: '关联知识点',
            render: getFieldDecorator('knowledgeIds', {
              initialValue: entity.knowledgeIds,
              rules: [{ validator: this.handleVerifyKnowledge }]
            })(
              <FormMultipleSelect
                data={knowledge}
                placeholder="请搜索并选择知识点"
                loading={loading.rGetAllKnowledge}
                search={this.rGetAllKnowledge}
              />
            )
          },
        ],
      },
      {
        title: '详细信息',
        fields: [
          {
            label: '描述',
            render: getFieldDecorator('description', {
              initialValue: entity.description,
            })(<Input.TextArea rows={4} placeholder="请输入描述" autoComplete="new-password" />)
          },
          {
            label: '知识',
            render: getFieldDecorator('name', {
              initialValue: entity.name,
            })(<Input size="small" placeholder="请输入名称" autoComplete="new-password" />)
          },
        ],
      },
    ];

    // 操作
    const actions = [
      <Button size="small" onClick={handleFormReset.bind(this)}>重置</Button>,
      <Button size="small" type="primary" htmlType="submit" loading={loading.rPut}>提交</Button>,
    ];

    return (
      <Form onSubmit={this.handleSubmit} colon={false}>
        <BaseForm actions={actions}>
          <BaseFormFieldGroup fieldGroup={fieldGroup}/>
        </BaseForm>
      </Form>
    );
  }
}

function mapStateToProps(state, ownProps) {
  return {
    pagedata: Object.assign({ ...state[namespace] }, {
      loading: {
        rPut: state.loading.effects[`${namespace}/rPut`],
        rGetAllKnowledge: state.loading.effects[`${namespace}/rGetAllKnowledge`],
      }
    })
  };
}

export default connect(mapStateToProps)(Form.create()(EditComponent));
