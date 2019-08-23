import { Modal } from 'antd';

/* 表格筛选 */
export function handleSearchTable(e) {
  e && e.preventDefault && e.preventDefault();

  this.props.form.validateFields((err, fieldsValue) => {
    if (err) return;
    this.reload(true);
  });
}

/* 表格重置 */
export function handleResetTable() {
  this.props.form.resetFields();
  this.reload(undefined, true);
}

/* 折叠筛选树 */
export function handleFoldTree() {
  this.setState({
    folded: !this.state.folded,
  });
}

/*
 * 表格变化
 * 包括：切换分页、表格内筛选、表格内排序
 */
export function handleChangeTable(pagination, filtersArg, sorter) {
  const filters = Object.keys(filtersArg).reduce((obj, key) => {
    const newObj = { ...obj };
    newObj[key] = Object.keys(filtersArg[key]).map(key => obj[key]).join(',');
    return newObj;
  }, {});

  const params = {
    pageindex: pagination.current,
    pagesize: pagination.pageSize,
    ...filters,
  };
  
  if (sorter.field) {
    params.sorter = `${sorter.field}_${sorter.order}`;
  }

  this.reload(params);
};

/**
 * 删除提示
 */
export function handleDeleteTable(onOk) {
  Modal.confirm({
    title: '你确定要删除此记录?',
    content: '删除后将无法恢复',
    okText: '确定',
    okType: 'danger',
    cancelText: '取消',
    onOk: onOk,
  });
}

/**
 * 重置表单
 */
export function handleFormReset() {
  this.props.form.resetFields();
};

/**
 * 关闭弹窗
 */
export function handleModalVisible() {
  this.props.parent.setState({
    visibleNew: false,
  }, () => {
    this.props.form.resetFields();
  });
}
