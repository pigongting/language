/* 开源-组件 */
import React, { Fragment } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { Form, Input, Button, Modal } from 'antd';
/* 开源-工具 */
/* 自研-组件 */
import BaseTable from '@/components/BaseTable';
import BaseTableStateBar from '@/components/BaseTable/StateBar';
import BaseTableActions from '@/components/BaseTable/Actions';
/* 自研-工具 */
import Enums from '@/Enums';
import { handleParams, search2form, form2search, syncVarIterator } from '@/utilities/util';
import { handleSearchTable, handleDeleteTable } from '@/utilities/common';
/* 数据 */
import { store, history, addAsyncModel } from '@/store';
import { namespacePrefix, List } from './Model';
/* 相对路径-组件 */
import New from './New';
import Edit from './Edit';
/* 相对路径-样式 */
/* 异步数据模型 */
addAsyncModel(List);
/* 命名空间(全局唯一) */
const namespace = `${namespacePrefix}List`;
/* 变量(方便使用) */
const { dispatch } = store;

class ListComponent extends React.Component {

  constructor(props) {
    super(props);

    // 同步地址拦到redux
    this.keep = handleParams.url(dispatch, namespace);

    this.state = {
      visibleNew: false,
      visibleEdit: false,
    };
  }

  componentDidMount() {
    // 重载页面数据
    this.reload();
  }

  componentWillUnmount() {
    dispatch({ type: namespace + '/clean' });
  }

  // 重载页面数据
  reload = (params, reset) => {
    dispatch({ type: namespace + '/rGetAll', payload: this.handleReloadParams(params, reset) });
  }

  // 处理重载参数
  handleReloadParams = (params, reset) => {
    const payload = handleParams.page.call(this, params, reset);
    return handleParams.merge(payload);
  }

  // 新建
  handleNew = () => {
    this.setState({ visibleNew: true });
  }

  // 编辑
  handleEdit = (id) => {
    this.editId = id;
    this.setState({ visibleEdit: true });
  }

  // 启用/禁用
  handleState = (id, index) => {
    dispatch({ type: namespace + '/rPutState', payload: { id }, index });
  }

  // 删除
  handleDelete = (id, index) => {
    handleDeleteTable(() => {
      dispatch({ type: namespace + '/rDelete', payload: { ids: id }, index });
    });
  }

  render() {
    const { getFieldDecorator } = this.props.form;
    const { loading, keep, pagination } = this.props.pagedata;
    const { visibleNew } = this.state;

    // 操作项
    const operations = [
      <Button size="small" type="primary" onClick={this.handleNew}>新建</Button>,
    ];

    // 状态
    const states = getFieldDecorator('state', {
      initialValue: keep.state,
    })(<BaseTableStateBar data={Enums.Common.enableState} onChangeSatae={handleSearchTable.bind(this)} />);

    // 过滤项
    const filter = getFieldDecorator('name', {
      initialValue: keep.name,
    })(<Input.Search size="small" placeholder="搜索名称" autoComplete="off" allowClear onSearch={handleSearchTable.bind(this)} />);

    // 过滤项-高级
    const filters = [
      {
        label: '名称',
        render: getFieldDecorator('name', {
          initialValue: keep.name,
        })(<Input size="small" placeholder="请输入搜索关键字" autoComplete="off" />)
      },
    ];

    // 字段
    const columns = [
      {
        title: 'ID',
        dataIndex: 'id',
        align: 'center',
        fixed: 'left',
        width: 50,
      },
      {
        title: '名称',
        dataIndex: 'name',
        width: 197,
      },
      {
        title: '编码',
        dataIndex: 'code',
        width: 197,
      },
      {
        title: '父ID',
        dataIndex: 'parentId',
        width: 197,
      },
      {
        title: '层级',
        dataIndex: 'level',
        width: 197,
      },
      {
        title: '路径',
        dataIndex: 'path',
        width: 197,
      },
      {
        title: '优先级',
        dataIndex: 'priority',
        width: 197,
      },
      {
        title: '描述',
        dataIndex: 'description',
        width: 197,
      },
      {
        title: '状态',
        dataIndex: 'state',
        render: (text, record, index) => Enums.Common.enableState[text],
        width: 41,
      },
      {
        title: '',
        dataIndex: '',
      },
      {
        title: '操作',
        dataIndex: '',
        fixed: 'right',
        width: 100,
        render: (text, record, index) => <BaseTableActions
          actions={[
            <span onClick={this.handleEdit.bind(this, record.id)}>编辑</span>,
            <span onClick={this.handleState.bind(this, record.id, index)}>{record.state === 1 ? '禁用' : '启用'}</span>,
            <span onClick={this.handleDelete.bind(this, record.id, index)}>删除</span>,
          ]}
        />,
      },
    ];

    return (
      <Form onSubmit={handleSearchTable.bind(this)} colon={false}>
        <BaseTable
          operation={{ states, filter, filters, operations }}
          table={{ columns: columns, pagination, loading: loading.rGetAll }}
          parent={this}
        />
        <New visible={this.state.visibleNew} parent={this} />
        <Edit visible={this.state.visibleEdit} parent={this} />
      </Form>
    );
  }
}

function mapStateToProps(state, ownProps) {
  return {
    pagedata: Object.assign({ ...state[namespace] }, {
      loading: {
        rGetAll: state.loading.effects[`${namespace}/rGetAll`],
      }
    })
  };
}

export default connect(mapStateToProps)(Form.create()(ListComponent));
