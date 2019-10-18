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
import { search2form, form2search } from '@/utilities/util';
/* 数据 */
import { store, history, addAsyncModel } from '@/store';
import { namespacePrefix, New } from './Model';
/* 相对路径-样式 */
/* 异步数据模型 */
addAsyncModel(New);
/* 命名空间(全局唯一) */
const namespace = `${namespacePrefix}New`;
/* 变量(方便使用) */
const { dispatch } = store;

class NewComponent extends React.Component {

  componentDidMount() {
    // 获取部门列表
    this.rGetAllDepartment();
  }

  componentWillUnmount() {
    dispatch({ type: namespace + '/clean' });
  }

  // 表单提交
  handleSubmit = e => {
    e.preventDefault();
    this.props.form.validateFields((err, values) => {
      if (!err) {
        const { entity, departmentData } = this.props.pagedata;

        // 格式转换
        form2search.cascader(values, 'departmentId');
        form2search.sourceId(values, 'departmentId', departmentData.mapping);
        form2search.numberString(values, 'positionId');

        const callback = () => {
          history.goBack();
        };

        dispatch({
          type: `${namespace}/rPost`,
          payload: Object.assign({}, entity, values),
          callback,
        });
      }
    });
  };

  // 获取部门列表
  rGetAllDepartment = () => {
    dispatch({
      type: namespace + '/rGetAllDepartment',
      payload: {},
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

  // 重置岗位
  resetPositionData = () => {
    this.props.form.resetFields(['positionId']);

    dispatch({
      type: namespace + '/save',
      payload: {
        positionData: [],
      },
    });
  }

  // 选择了所属部门后
  handleChangeDepartment = (value, option) => {
    if (value.length === 0) { return; }
    const lastItem = option[option.length - 1];
    const departmentId = lastItem.origin.sourceId;
    
    // 重置岗位
    this.resetPositionData();

    // 请求新岗位
    this.rGetAllPosition(departmentId);
  }

  render() {
    const { getFieldDecorator } = this.props.form;
    const { loading, entity, departmentData, positionData } = this.props.pagedata;

    // 操作
    const actions = [
      <Button size="small" onClick={handleFormReset.bind(this)}>重置</Button>,
      <Button size="small" type="primary" htmlType="submit" loading={loading.rPost}>提交</Button>,
    ];

    // 字段
    const fieldGroup = [
      {
        title: '基本信息',
        fields: [
          <Form.Item label="所属部门">
            {getFieldDecorator('departmentId', {
              initialValue: entity.departmentId,
              rules: [{ required: true, message: '请选择所属部门' }],
            })(
              <Cascader
                size="small"
                options={departmentData.tree}
                placeholder="请选择所属部门"
                onChange={this.handleChangeDepartment}
              />
            )}
          </Form.Item>,
          <Form.Item label="真实姓名">
            {getFieldDecorator('trueName', {
              initialValue: entity.trueName,
              rules: [{ required: true, message: '请选择所属部门' }],
            })(<Input size="small" placeholder="请输入真实姓名" autoComplete="off" />)}
          </Form.Item>,
          <Form.Item label="岗位">
            {getFieldDecorator('positionId', {
              initialValue: entity.positionId,
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
      }
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
        rPost: state.loading.effects[`${namespace}/rPost`],
        rGetAllPosition: state.loading.effects[`${namespace}/rGetAllPosition`],
      }
    })
  };
}

export default connect(mapStateToProps)(Form.create()(NewComponent));
