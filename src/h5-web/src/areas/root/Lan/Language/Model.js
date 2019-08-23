/* 接口 */
import { rGetAllLanLanguages } from '@/netapi/lan/Language/Languages';
import { rPostLanLanguage, rPutLanLanguage, rGetLanLanguage, rDeleteLanLanguages } from '@/netapi/lan/Language/Language';
/* 开源 */
/* 自研 */
import { rGetAll, rDelete, rPutState, rPost, rPut, rGet } from '@/utilities/common';
/* 命名空间(全局唯一) */
const namespacePrefix = 'lan/language';
/* 初始数据 */
// 列表
const ListState = {
  keep: {},
  pagination: {},
};
// 新建
const NewState = {
  entity: {
    code: '',
    name: 'Test',
    state: 1,
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
      rGetAll: rGetAll.bind(this, rGetAllLanLanguages),
      rDelete: rDelete.bind(this, namespacePrefix + 'List', rDeleteLanLanguages),
      rPutState: rPutState.bind(this, namespacePrefix + 'List', rGetLanLanguage, rPutLanLanguage),
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
      rPost: rPost.bind(this, rPostLanLanguage),
    },

    reducers: {
      clean(state, action) { return NewState; },
    },
  },
  Edit: {
    namespace: `${namespacePrefix}Edit`,
  
    state: EditState,
  
    effects: {
      rGet: rGet.bind(this, rGetLanLanguage),
      rPut: rPut.bind(this, rPutLanLanguage),
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
