/* 开源-组件 */
import React, { Fragment } from 'react';
import { connect } from 'react-redux';
import { Modal, Form, Button, Input, Cascader, Select, Spin, Radio } from 'antd';
/* 开源-工具 */
import debounce from 'lodash/debounce';
/* 自研-组件 */
import BaseFormFieldGroup from '@/components/BaseForm/FieldGroup';
/* 自研-工具 */
import Enums from '@/Enums';
import { handleFormReset, handleModalVisible } from '@/utilities/common';
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

  constructor(props) {
    super(props);
    // 防抖
    this.rGetAllCompany = debounce(this.rGetAllCompany, 800);
  }

  componentWillReceiveProps(nextProps) {
    if (this.props.visible !== nextProps.visible && nextProps.visible === true) {
      // 获取区域列表
      this.rGetAllArea();
    }
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
        form2search.cascader(values, 'adminAreaId');

        const callback = () => {
          this.props.parent.reload();
          handleModalVisible.call(this);
        };

        dispatch({
          type: `${namespace}/rPost`,
          payload: Object.assign({}, entity, values),
          callback,
        });
      }
    });
  };

  // 获取公司列表
  rGetAllCompany = (value) => {
    dispatch({
      type: namespace + '/rGetAllCompany',
      payload: {
        name: value,
        pagesize: 10,
      },
    });
  }

  // 获取区域列表
  rGetAllArea = () => {
    dispatch({
      type: namespace + '/rGetAllArea',
      payload: {
        levels: 2
      },
    });
  }

  // 获取城市列表
  rGetAllAreaCity = (selectedOptions) => {
    dispatch({
      type: namespace + '/rGetAllAreaCity',
      payload: selectedOptions,
    });
  }

  render() {
    const { visible } = this.props;
    const { getFieldDecorator } = this.props.form;
    const { entity, compayData, areaData, loading } = this.props.pagedata;

    // 字段
    const fieldGroup = [
      {
        title: '基本信息',
        fields: [
          <Form.Item label="所属公司">
            {getFieldDecorator('parentId', {
              initialValue: entity.parentId,
              rules: [{ required: true, message: '请搜索并选择所属公司' }],
            })(
              <Select
                placeholder="请搜索并选择所属公司"
                notFoundContent={loading.rGetAllCompany && <Spin size="small" />}
                onSearch={this.rGetAllCompany}
                filterOption={false}
                showSearch
                size="small"
              >
                {compayData.map(item => (
                  <Select.Option key={item.value} value={item.value} disabled={item.disabled}>{item.label}</Select.Option>
                ))}
              </Select>
            )}
          </Form.Item>,
          <Form.Item label="所在地区">
            {getFieldDecorator('adminAreaId', {
              initialValue: entity.adminAreaId,
              rules: [{ required: true, message: '请选择所在地区' }],
            })(
              <Cascader
                size="small"
                options={areaData.tree}
                loadData={this.rGetAllAreaCity.bind(this)}
                placeholder="请选择所在地区"
              />
            )}
          </Form.Item>,
          <Form.Item label="项目名称">
            {getFieldDecorator('name', {
              initialValue: entity.name,
              rules: [{ required: true, message: '请输入项目名称' }],
            })(<Input size="small" placeholder="请输入项目名称" autoComplete="off" />)}
          </Form.Item>,
          <Form.Item label="项目简称">
            {getFieldDecorator('shortName', {
              initialValue: entity.shortName,
              rules: [{ required: true, message: '请输入项目简称' }],
            })(<Input size="small" placeholder="请输入项目简称" autoComplete="off" />)}
          </Form.Item>,
          <Form.Item label="项目编号">
            {getFieldDecorator('no', {
              initialValue: entity.no,
              rules: [{ required: true, message: '请输入项目编号' }],
            })(<Input size="small" placeholder="请输入项目编号" autoComplete="off" />)}
          </Form.Item>,
          <Form.Item label="详细地址">
            {getFieldDecorator('address', {
              initialValue: entity.address,
              rules: [{ required: true, message: '请输入详细地址' }],
            })(<Input size="small" placeholder="请输入详细地址" autoComplete="off" />)}
          </Form.Item>,
          <Form.Item label="状态">
            {getFieldDecorator('state', {
              initialValue: entity.state,
              rules: [{ required: true, message: '请选择状态' }],
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
          <Form.Item label="描述">
            {getFieldDecorator('description', {
              initialValue: entity.description,
            })(<Input.TextArea rows={4} placeholder="请输入描述" autoComplete="off" />)}
          </Form.Item>,
        ],
      }
    ];

    return (
      <Modal title="新建物业项目" className="modalForm" width={674} footer={null} visible={visible} onCancel={handleModalVisible.bind(this)}>
        <Form onSubmit={this.handleSubmit} colon={false} layout="inline">
          <BaseFormFieldGroup fieldGroup={fieldGroup}/>
          <div className="modalFormFooter">
            <Button onClick={handleFormReset.bind(this)}>重置</Button>
            <Button type="primary" htmlType="submit" loading={loading.rPost}>提交</Button>
          </div>
        </Form>
      </Modal>
    );
  }
}

function mapStateToProps(state, ownProps) {
  return {
    pagedata: Object.assign({ ...state[namespace] }, {
      loading: {
        rPost: state.loading.effects[`${namespace}/rPost`],
        rGetAllCompany: state.loading.effects[`${namespace}/rGetAllCompany`],
      }
    })
  };
}

export default connect(mapStateToProps)(Form.create()(NewComponent));
