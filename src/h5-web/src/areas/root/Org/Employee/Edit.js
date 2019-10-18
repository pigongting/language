/* 开源-组件 */
import React, { Fragment } from 'react';
import { connect } from 'react-redux';
import { Form, Button, Input, Cascader, Select, Spin, Radio } from 'antd';
/* 开源-工具 */
/* 自研-组件 */
import BaseForm from '@/components/BaseForm';
import BaseFormFieldGroup from '@/components/BaseForm/FieldGroup';
/* 自研-工具 */
import Enums from '@/Enums';
import { handleFormReset } from '@/utilities/common';
import { handleParams, search2form, form2search } from '@/utilities/util';
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

        // 格式转换
        form2search.numberString(values, 'positionId');

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
    dispatch({
      type: namespace + '/rGet',
      payload: {
        id: this.keep.id
      },
      callback: this.rGetAllPosition
    });
  }

  // 获取岗位列表
  rGetAllPosition = (id) => {
    dispatch({
      type: namespace + '/rGetAllPosition',
      payload: {
        dids: id,
      },
    });
  }

  render() {
    const { getFieldDecorator } = this.props.form;
    const { loading, entity, positionData } = this.props.pagedata;

    // 操作
    const actions = [
      <Button size="small" onClick={handleFormReset.bind(this)}>重置</Button>,
      <Button size="small" type="primary" htmlType="submit" loading={loading.rPut}>提交</Button>,
    ];

    // 字段
    const fieldGroup = [
      {
        title: '基本信息',
        fields: [
          <Form.Item label="所属部门">{entity.departmentName}</Form.Item>,
          <Form.Item label="真实姓名">
            {getFieldDecorator('trueName', {
              initialValue: entity.trueName,
              rules: [{ required: true, message: '请选择所属部门' }],
            })(<Input size="small" placeholder="请输入真实姓名" autoComplete="off" />)}
          </Form.Item>,
          <Form.Item label="岗位">
            {getFieldDecorator('positionId', {
              initialValue: search2form.numberString(entity.positionId),
              rules: [{ required: true, message: '请选择岗位' }],
            })(
              <Select
                size="small"
                placeholder="请选择岗位"
                notFoundContent={loading.rGetAllPosition ? <Spin size="small" /> : '请先选择部门'}
              >
                {positionData.map(item => (
                  <Select.Option key={item.value} value={item.value}>{item.label}</Select.Option>
                ))}
              </Select>
            )}
          </Form.Item>,
          <Form.Item label="账号">
            {getFieldDecorator('account', {
              initialValue: entity.account,
              rules: [{ required: true, message: '请选择所属部门' }],
            })(<Input size="small" placeholder="请输入账号" autoComplete="off" />)}
          </Form.Item>,
          <Form.Item label="密码">
            {getFieldDecorator('password', {
              initialValue: entity.password,
              rules: [{ required: true, message: '请选择所属部门' }],
            })(<Input size="small" type="password" placeholder="请输入密码" autoComplete="off" />)}
          </Form.Item>,
          <Form.Item label="手机号">
            {getFieldDecorator('phone', {
              initialValue: entity.phone,
              rules: [{ required: true, message: '请选择所属部门' }],
            })(<Input size="small" placeholder="请输入手机号" autoComplete="off" />)}
          </Form.Item>,
          <Form.Item label="状态">
            {getFieldDecorator('state', {
              initialValue: entity.state,
              rules: [{ required: true, message: '请选择所属部门' }],
            })(
              <Radio.Group>
                {Object.keys(Enums.Common.enableState).filter(key => key !== '0' && key !== '100').map(key => {
                  return (<Radio key={key} value={Number(key)}>{Enums.Common.enableState[key]}</Radio>);
                })}
              </Radio.Group>
            )}
          </Form.Item>,
        ],
      },
      {
        title: '选填信息',
        fields: [
          <Form.Item label="性别">
            {getFieldDecorator('gender', {
              initialValue: entity.gender,
              rules: [{ required: true, message: '请选择所属部门' }],
            })(
              <Radio.Group>
                {Object.keys(Enums.Common.gender).filter(key => key !== '0').map(key => {
                  return (<Radio key={key} value={Number(key)}>{Enums.Common.gender[key]}</Radio>);
                })}
              </Radio.Group>
            )}
          </Form.Item>,
          <Form.Item label="昵称">
            {getFieldDecorator('nickName', {
              initialValue: entity.nickName,
            })(<Input size="small" placeholder="请输入昵称" autoComplete="off" />)}
          </Form.Item>,
          <Form.Item label="证件类型">
            {getFieldDecorator('certificateType', {
              initialValue: entity.certificateType,
              rules: [{ required: true, message: '请选择证件类型' }],
            })(
              <Select
                size="small"
                placeholder="请选择证件类型"
              >
                {Object.keys(Enums.Common.certificateType).map(key => (
                  <Select.Option key={key} value={Number(key)}>{Enums.Common.certificateType[key]}</Select.Option>
                ))}
              </Select>
            )}
          </Form.Item>,
          <Form.Item label="证件号码">
            {getFieldDecorator('certificateNo', {
              initialValue: entity.certificateNo,
            })(<Input size="small" placeholder="请输入证件号码" autoComplete="off" />)}
          </Form.Item>,
          <Form.Item label="安全邮箱">
            {getFieldDecorator('secEmail', {
              initialValue: entity.secEmail,
            })(<Input size="small" placeholder="请输入安全邮箱" autoComplete="off" />)}
          </Form.Item>,
          <Form.Item label="描述">
            {getFieldDecorator('description', {
              initialValue: entity.description,
            })(<Input size="small" placeholder="请输入描述" autoComplete="off" />)}
          </Form.Item>,
        ],
      },
      {
        title: '说明',
        fields: [
          <Form.Item label="导入步骤">
            <ul>
              <li>第一步，请先下载EXCEL文档模版，调整模板请到"后端应用中心-客户-基本信息字段设置"调整导入字段后保存。</li>
              <li>第二步，下载后，填写内容，注意，要填写的内容在下边的说明中有详细的说明，请一定要确定你的Excel文档的格式是模板中的格式，而没有被修改掉。</li>
              <li>第三步，选择客户经理，默认情况下，客户经理是客户导入者本人。</li>
              <li>第四步，可以选择被导入的客户的状态，如果不进行选择，默认情况下导入的客户是无效客户。</li>
              <li>第五步，点击右键的提交，进入客户的导入。</li>
              <li>第六步，如果以上步骤和Excel文件正确的话，则会被正确的导入，也会出现提示。如果有问题，则根据提示下载Excel并对错误之处进行修改。</li>
            </ul>
          </Form.Item>
        ],
      },
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
        rGetAllPosition: state.loading.effects[`${namespace}/rGetAllPosition`],
      }
    })
  };
}

export default connect(mapStateToProps)(Form.create()(EditComponent));
