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
import BaseTableTypeSearch from '@/components/BaseTable/TypeSearch';
import FormTypeSearchTree from '@/components/Form/TypeSearchTree';
/* 自研-工具 */
import Enums from '@/Enums';
import { handleParams, search2form, form2search, syncVarIterator, getTreeOrgFrame } from '@/utilities/util';
import { handleSearchTable, handleResetTable, handleChangeTable, handleDeleteTable, handleFoldTree } from '@/utilities/common';
/* 数据 */
import { store, history, addAsyncModel } from '@/store';
import { namespacePrefix, List } from './Model';
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
      treeOrgFrame: getTreeOrgFrame(),
      folded: false,
    }
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
    dispatch({
      type: namespace + '/rGetAll',
      payload: this.handleReloadParams(params, reset),
    });
  }

  // 处理重载参数
  handleReloadParams = (params, reset) => {
    const payload = handleParams.page.call(this, params, reset);

    if (payload) {
      form2search.cascader(payload, 'parentid');
    }

    return handleParams.merge(payload);
  }

  // 导出
  handleExport = () => {
    dispatch({
      type: namespace + '/rExport',
      payload: this.handleReloadParams(),
    });
  }

  // 新建
  handleNew = () => {
    history.push('/org/employee/new');
  }

  // 启用/禁用
  handleState = (id, index) => {
    dispatch({
      type: namespace + '/rPutState',
      payload: { id },
      index,
    });
  }

  // 删除
  handleDelete = (id, index) => {
    handleDeleteTable(() => {
      dispatch({
        type: namespace + '/rDelete',
        payload: { ids: id },
        index,
      });
    });
  }

  render() {
    const { getFieldDecorator } = this.props.form;
    const { treeOrgFrame, folded } = this.state;
    const { loading, keep, pagination } = this.props.pagedata;

    // 操作项
    const operations = [
      <Button size="small" type="primary" onClick={this.handleNew}>新建</Button>,
      <Button size="small" onClick={this.handleExport}>导出</Button>,
    ];

    // 状态
    const states = getFieldDecorator('state', {
      initialValue: keep.state,
    })(<BaseTableStateBar data={Enums.Common.enableState} onChangeSatae={handleSearchTable.bind(this)} />);

    // 过滤项
    const filter = getFieldDecorator('account', {
      initialValue: keep.account,
    })(<Input.Search size="small" placeholder="搜索账号" autoComplete="new-password" allowClear onSearch={handleSearchTable.bind(this)} />);

    // 过滤项-高级
    const filters = [
      <Form.Item label="账号">
        {getFieldDecorator('account', {
          initialValue: keep.account,
        })(<Input size="small" placeholder="请输入搜索关键字" autoComplete="new-password" />)}
      </Form.Item>,
      <Form.Item label="真实姓名">
        {getFieldDecorator('truename', {
          initialValue: keep.truename,
        })(<Input size="small" placeholder="请输入搜索关键字" autoComplete="new-password" />)}
      </Form.Item>,
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
        title: '真实姓名',
        dataIndex: 'trueName',
        fixed: 'left',
        width: 197,
      },
      {
        title: '部门',
        dataIndex: 'departmentName',
        width: 377,
      },
      {
        title: '岗位',
        dataIndex: 'positionName',
        width: 89,
      },
      {
        title: '手机',
        dataIndex: 'phone',
        width: 100,
      },
      {
        title: '用户名',
        dataIndex: 'account',
        width: 100,
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
            <Link to={'/org/employee/edit?id=' + record.id}>编辑</Link>,
            <Link to={'/org/employee/setting?id=' + record.id}>配置</Link>,
            <span onClick={this.handleState.bind(this, record.id, index)}>{record.state === 1 ? '禁用' : '启用'}</span>,
            <span onClick={this.handleDelete.bind(this, record.id, index)}>删除</span>,
          ]}
        />,
      },
    ];

    // 类型搜索
    const typeSearch = getFieldDecorator('parentid', {
      initialValue: search2form.stringArray(keep.parentid),
    })(
      <FormTypeSearchTree
        treeData={treeOrgFrame}
        onSelect={handleSearchTable.bind(this)}
        expandedKeys={search2form.stringArray(syncVarIterator.getter(treeOrgFrame, 'tree.0.value'))}
      />
    );

    return (
      <Form onSubmit={handleSearchTable.bind(this)} colon={false}>
        <BaseTableTypeSearch component={typeSearch} folded={folded}>
          <BaseTable
            operation={{ folded: folded, states, filter, filters, operations }}
            table={{ columns: columns, pagination, loading: loading.rGetAll }}
            handle={{
              resetTable: handleResetTable.bind(this),
              changeTable: handleChangeTable.bind(this),
              foldTree: handleFoldTree.bind(this),
            }}
          />
        </BaseTableTypeSearch>
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
