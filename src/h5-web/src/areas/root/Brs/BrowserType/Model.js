/* 接口 */
import { rGetAllBrsBrowserTypes } from '@/netapi/brs/BrowserType/BrowserTypes';
import { rGetBrsBrowserType, rPostBrsBrowserType, rPutBrsBrowserType, rDeleteBrsBrowserTypes } from '@/netapi/brs/BrowserType/BrowserType';
/* 开源 */
/* 自研 */
import { rGetAll, rDelete, rPutState, rPost, rPut, rGet } from '@/utilities/common';
/* 命名空间(全局唯一) */
const namespacePrefix = 'brs/browsertype';
/* 初始数据 */
// 列表
const ListState = {
  keep: {},
  pagination: {},
};
// 新建
const NewState = {
  entity: {
    state: 1,
    // 临时
    code: '',
    name: 'Test',
    description: 'Server-Test',
    ext1: '',
    ext2: '',
    ext3: '',
    ext4: '',
  },
};
// 编辑
const EditState = {
  entity: {},
};

export default {
  namespacePrefix,
  List: {
    namespace: `${namespacePrefix}List`,
  
    state: ListState,
  
    effects: {
      rGetAll: rGetAll.bind(this, rGetAllBrsBrowserTypes),
      rDelete: rDelete.bind(this, namespacePrefix + 'List', rDeleteBrsBrowserTypes),
      rPutState: rPutState.bind(this, namespacePrefix + 'List', rGetBrsBrowserType, rPutBrsBrowserType),
    },

    reducers: {
      clean(state, action) { return ListState; },
      save(state, action) {
        return {
          ...state,
          keep: action.payload.keep || state.keep,
          pagination: action.payload.pagination || state.pagination,
        };
      }
    },
  },
  New: {
    namespace: `${namespacePrefix}New`,
  
    state: NewState,
  
    effects: {
      rPost: rPost.bind(this, rPostBrsBrowserType),
    },

    reducers: {
      clean(state, action) { return NewState; },
    },
  },
  Edit: {
    namespace: `${namespacePrefix}Edit`,
  
    state: EditState,
  
    effects: {
      rGet: rGet.bind(this, rGetBrsBrowserType),
      rPut: rPut.bind(this, rPutBrsBrowserType),
    },

    reducers: {
      clean(state, action) { return EditState; },
      save(state, action) {
        return {
          ...state,
          entity: action.payload.entity || state.entity,
        };
      }
    },
  },
};
