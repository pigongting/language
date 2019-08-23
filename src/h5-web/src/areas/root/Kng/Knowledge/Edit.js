/* 开源-组件 */
import React, { Fragment } from 'react';
import { connect } from 'react-redux';
import { Form, Button, Input, Radio } from 'antd';
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
  }

  componentDidMount() {
    // 获取旧信息
    this.rGet();
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

        dispatch({
          type: `${namespace}/rPut`,
          payload: Object.assign({}, entity, values),
          callback,
        });
      }
    });
  };

  // 获取旧信息
  rGet = () => {
    dispatch({ type: namespace + '/rGet', payload: { id: this.keep.id } });
  }

  render() {
    const { getFieldDecorator } = this.props.form;
    const { entity, loading } = this.props.pagedata;

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
              rules: [{ required: true, message: '请输入编码' }],
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
        title: '选填信息',
        fields: [
          {
            label: '描述',
            render: getFieldDecorator('description', {
              initialValue: entity.description,
            })(<Input.TextArea rows={4} placeholder="请输入描述" autoComplete="new-password" />)
          },
        ],
      }
    ];

    // 操作
    const actions = [
      <Button size="small" onClick={handleFormReset.bind(this)}>重置</Button>,
      <Button size="small" type="primary" htmlType="submit" loading={loading.rPut}>提交</Button>,
    ];

    return (
      <Form onSubmit={this.handleSubmit} colon={false} layout="inline">
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
      }
    })
  };
}

export default connect(mapStateToProps)(Form.create()(EditComponent));
