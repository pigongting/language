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
    visibleEdit: false,
  }, () => {
    this.props.form.resetFields();
  });
}




// effects

/**
 * 查询多条-分页
 */
export function* rGetAll(getAllMethod, { payload }, { call, put, select }) {
  const response = yield call(getAllMethod, payload);
  if (response === undefined) { return; }

  yield put({ type: 'save', payload: { keep: payload, pagination: response }});
}

/**
 * 删除多条
 */
export function* rDelete(namespace, deleteMethod, { payload, index }, { call, put, select }) {
  const response = yield call(deleteMethod, payload);
  if (response === undefined) { return; }

  // 获取本地数据
  const pagination = yield select(state => state[namespace].pagination);

  // 删除本地数据
  pagination.entities.splice(index, 1);

  // 更新本地数据
  yield put({ type: 'save', payload: { pagination }});
}

/**
 * 启用禁用
 */
export function* rPutState(namespace, getMethod, putMethod, { payload, index }, { call, put, select }) {
  // 获取原始数据
  const response = yield call(getMethod, payload);
  if (response === undefined) { return; }

  // 修改状态
  const stateOld = response.state;
  const stateNew = (stateOld === 1) ? 2 : 1;

  // 修改远程状态
  const responsePut = yield call(putMethod, Object.assign(response, { state: stateNew } ));
  if (responsePut === undefined) { return; }

  // 获取本地状态
  const pagination = yield select(state => state[namespace].pagination);

  // 修改本地状态
  pagination.entities[index]['state'] = stateNew;

  // 更新本地状态
  yield put({ type: 'save', payload: { pagination }});
}

/**
 * 新建单条
 */
export function* rPost(postMethod, { payload, callback }, { call, put, select }) {
  const response = yield call(postMethod, payload);
  if (response === undefined) { return; }
  callback && callback();
}

/**
 * 获取单条
 */
export function* rGet(getMethod, { payload }, { call, put, select }) {
  const response = yield call(getMethod, payload);
  if (response === undefined) { return; }

  yield put({ type: 'save', payload: { entity: response }});
}

/**
 * 编辑单条
 */
export function* rPut(putMethod, { payload, callback }, { call, put, select }) {
  const response = yield call(putMethod, payload);
  if (response === undefined) { return; }
  callback && callback();
}


