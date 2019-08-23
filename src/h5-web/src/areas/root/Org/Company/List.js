/* 开源-组件 */
import React, { Fragment } from 'react';
import { connect } from 'react-redux';
import { Form, Input, Button } from 'antd';
/* 开源-工具 */
/* 自研-组件 */
import BaseTable from '@/components/BaseTable';
import BaseTableStateBar from '@/components/BaseTable/StateBar';
import BaseTableActions from '@/components/BaseTable/Actions';
/* 自研-工具 */
import Enums from '@/Enums';
import { handleParams, search2form, form2search } from '@/utilities/utility';
import { handleSearchTable, handleResetTable, handleChangeTable } from '@/utilities/common';
/* 数据 */
import { store, history, addAsyncModel } from '@/store';
import { namespacePrefix, Workplace } from './Model';
/* 相对路径-样式 */
import styles from './Workplace.less';
/* 异步数据模型 */
addAsyncModel(Workplace);
/* 命名空间(全局唯一) */
const namespace = `${namespacePrefix}Workplace`;
/* 变量(方便使用) */
const { dispatch } = store;

class WorkplaceComponent extends React.Component {

  constructor(props) {
    super(props);

    // 同步地址拦到redux
    this.keep = handleParams.url(dispatch, namespace);
  }

  componentDidMount() {
    // 重载页面数据
    this.reload();
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

    // if (payload) {
    //   form2search.timeRange(payload, 'accepttime', 'accepttimestart', 'accepttimeend');
    //   form2search.timeRange(payload, 'createin', 'createinstart', 'createinend');
    //   form2search.timeRange(payload, 'finishtime', 'finishtimestart', 'finishtimeend');
    //   form2search.ids(payload, 'pids');
    // }

    return handleParams.merge(payload);
  }

  handleExport = () => {
    console.log('导出');
  }

  render() {
    const { getFieldDecorator } = this.props.form;
    const { loading, keep, pagination } = this.props.pagedata;

    // 操作项
    const operations = [
      <Button size="small" type="primary" onClick={this.handleExport}>新建</Button>,
      <Button size="small" onClick={this.handleExport}>导入模版</Button>,
      <Button size="small" onClick={this.handleExport}>导入</Button>,
      <Button size="small" onClick={this.handleExport}>导出</Button>,
    ];

    // 状态
    const states = getFieldDecorator('state', {
      initialValue: keep.state,
    })(<BaseTableStateBar data={Enums.Common.enableState} onChangeSatae={handleSearchTable.bind(this)} />);

    // 过滤项
    const filter = getFieldDecorator('na', {
      initialValue: keep.na,
    })(<Input.Search size="small" placeholder="搜索名称" autoComplete="new-password" allowClear style={{ width: 111 }} />);

    // 过滤项-高级
    const filters = [
      <Form.Item label="账号">
        {getFieldDecorator('no', {
          initialValue: keep.no,
        })(<Input size="small" placeholder="请输入搜索关键字" autoComplete="new-password" />)}
      </Form.Item>,
    ];

    // 动作
    const actions = [
      <span>编辑</span>,
      <span>删除</span>,
      <span>上报</span>,
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
        fixed: 'left',
        width: 113,
      },
      {
        title: '简称',
        dataIndex: 'shortName',
        width: 77,
      },
      {
        title: '编码',
        dataIndex: 'code',
        width: 41,
      },
      {
        title: '范围',
        dataIndex: 'scope',
        render: (text, record, index) => text.split(',').map(key => Enums.Org.type[key]).join('，'),
        width: 125,
      },
      {
        title: '状态',
        dataIndex: 'state',
        render: (text, record, index) => Enums.Common.enableState[text],
        width: 41,
      },
      {
        title: '描述',
        dataIndex: 'description',
        width: 300,
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
        render: () => <BaseTableActions actions={actions} />,
      },
    ];

    return (
      <Form onSubmit={handleSearchTable.bind(this)}>
        <BaseTable
          title="部门划分"
          operation={{ states, filter, filters, operations }}
          table={{ columns: columns, pagination, loading: loading.rGetAll, className: styles.customTableContent }}
          handle={{
            resetTable: handleResetTable.bind(this),
            changeTable: handleChangeTable.bind(this),
          }}
        />
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

export default connect(mapStateToProps)(Form.create()(WorkplaceComponent));
