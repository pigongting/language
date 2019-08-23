/* 开源-组件 */
import React, { Fragment } from 'react';
import { connect } from 'react-redux';
import { Form, Button, Input, Cascader, Select, Radio, Checkbox, Row, Col } from 'antd';
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
import { namespacePrefix, Setting } from './Model';
/* 相对路径-样式 */
/* 异步数据模型 */
addAsyncModel(Setting);
/* 命名空间(全局唯一) */
const namespace = `${namespacePrefix}Setting`;
/* 变量(方便使用) */
const { dispatch } = store;

class SettingComponent extends React.Component {

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
        const dutyItems = values.duty.map(item => {
          return {
            employeeId: entity.id,
            departmentPositionDutyId: item,
          };
        });

        const dutyextItems = values.dutyext.map(item => {
          return {
            employeeId: entity.id,
            departmentPositionDutyId: item,
          };
        });

        const callback = () => {
          history.goBack();
        };

        dispatch({
          type: `${namespace}/rPut`,
          payload: {
            id: entity.id,
            items: dutyItems.concat(dutyextItems),
          },
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
      callback: this.rGetAllHrsEmployeeDuties
    });
  }

  // 获取员工已设置的职责
  rGetAllHrsEmployeeDuties = (id, entity) => {
    dispatch({
      type: namespace + '/rGetAllHrsEmployeeDuties',
      payload: {
        eid: id,
      },
      entity,
    });
  }

  render() {
    const { getFieldDecorator } = this.props.form;
    const { loading, entity, duty } = this.props.pagedata;

    // 操作
    const actions = [
      <Button size="small" onClick={handleFormReset.bind(this)}>重置</Button>,
      <Button size="small" type="primary" htmlType="submit" loading={loading.rPost}>提交</Button>,
    ];

    // 字段
    const fieldGroup = [
      {
        title: '员工信息',
        fields: [
          <Form.Item label="真实姓名">{entity.trueName}</Form.Item>,
          <Form.Item label="所属部门">{entity.departmentName}</Form.Item>,
        ],
      },
      {
        title: '设置职责',
        fields: [
          <Form.Item label="岗位职责">
            {getFieldDecorator('duty', {
              initialValue: duty.main.checked,
            })(
              <Checkbox.Group style={{ display: 'block', lineHeight: '24px' }}>
                <Row>
                  {duty.main.options.map((item) => (
                    <Col key={item.id} span={8}>
                      <Checkbox value={item.id}>{item.description}</Checkbox>
                    </Col>
                  ))}
                </Row>
              </Checkbox.Group>
            )}
          </Form.Item>,
          <Form.Item label="扩展职责">
            {getFieldDecorator('dutyext', {
              initialValue: duty.ext.checked,
            })(
              <Checkbox.Group style={{ display: 'block', lineHeight: '24px' }}>
                <Row>
                  {duty.ext.options.map((item) => (
                    <Col key={item.id} span={8}>
                      <Checkbox value={item.id} disabled={item.disabled}>{item.description}</Checkbox>
                    </Col>
                  ))}
                </Row>
              </Checkbox.Group>
            )}
          </Form.Item>,
        ],
      },
    ];

    return (
      <Form onSubmit={this.handleSubmit}>
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
        rGet: state.loading.effects[`${namespace}/rGet`],
        rPut: state.loading.effects[`${namespace}/rPut`],
        rGetAllHrsEmployeeDuties: state.loading.effects[`${namespace}/rGetAllHrsEmployeeDuties`],
      }
    })
  };
}

export default connect(mapStateToProps)(Form.create()(SettingComponent));
