/* 接口 */
import { rGetAllBrsBrowsers } from '@/netapi/brs/Browser/Browsers';
import { rPostBrsBrowser, rPutBrsBrowser, rGetBrsBrowser, rDeleteBrsBrowsers } from '@/netapi/brs/Browser/Browser';
/* 开源 */
/* 自研 */
import { rGetAll, rDelete, rPutState, rPost, rPut, rGet } from '@/utilities/common';
/* 命名空间(全局唯一) */
const namespacePrefix = 'brs/browser';
/* 初始数据 */
// 列表
const ListState = {
  keep: {},
  pagination: {},
};
// 新建
const NewState = {
  entity: {
    browserTypeId: 1,
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
      rGetAll: rGetAll.bind(this, rGetAllBrsBrowsers),
      rDelete: rDelete.bind(this, namespacePrefix + 'List', rDeleteBrsBrowsers),
      rPutState: rPutState.bind(this, namespacePrefix + 'List', rGetBrsBrowser, rPutBrsBrowser),
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
      rPost: rPost.bind(this, rPostBrsBrowser),
    },

    reducers: {
      clean(state, action) { return NewState; },
    },
  },
  Edit: {
    namespace: `${namespacePrefix}Edit`,
  
    state: EditState,
  
    effects: {
      rGet: rGet.bind(this, rGetBrsBrowser),
      rPut: rPut.bind(this, rPutBrsBrowser),
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
