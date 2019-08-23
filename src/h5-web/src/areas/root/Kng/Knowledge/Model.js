/* 接口 */
import { rGetAllKngKnowledges } from '@/netapi/kng/Knowledge/Knowledges';
import { rPostKngKnowledge, rPutKngKnowledge, rGetKngKnowledge, rDeleteKngKnowledges } from '@/netapi/kng/Knowledge/Knowledge';
import { rGetAllKngKnowledgeCategorysTree } from '@/netapi/kng/KnowledgeCategory/KnowledgeCategorys';
/* 开源 */
/* 自研 */
import { DEFAULT_TREE } from '@/Constant';
import { rGetAll, rDelete, rPutState, rPost, rPut, rGet } from '@/utilities/common';
/* 命名空间(全局唯一) */
const namespacePrefix = 'kng/knowledge';
/* 初始数据 */
// 列表
const ListState = {
  keep: {},
  pagination: {},
  typeSearchTree: DEFAULT_TREE,
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
    ext4: ''
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
      rGetAll: rGetAll.bind(this, rGetAllKngKnowledges),
      rDelete: rDelete.bind(this, namespacePrefix + 'List', rDeleteKngKnowledges),
      rPutState: rPutState.bind(this, namespacePrefix + 'List', rGetKngKnowledge, rPutKngKnowledge),
      *rGetTypeSearchTree({ payload }, { call, put, select }) {
        const response = yield call(rGetAllKngKnowledgeCategorysTree, payload);
        if (response === undefined) { return; }

        yield put({ type: 'save', payload: { typeSearchTree: response }});
      },
    },

    reducers: {
      clean(state, action) { return ListState; },
      save(state, action) {
        return {
          ...state,
          keep: action.payload.keep || state.keep,
          pagination: action.payload.pagination || state.pagination,
          typeSearchTree: action.payload.typeSearchTree || state.typeSearchTree,
        };
      }
    },
  },
  New: {
    namespace: `${namespacePrefix}New`,
  
    state: NewState,
  
    effects: {
      rPost: rPost.bind(this, rPostKngKnowledge),
    },

    reducers: {
      clean(state, action) { return NewState; },
    },
  },
  Edit: {
    namespace: `${namespacePrefix}Edit`,
  
    state: EditState,
  
    effects: {
      rGet: rGet.bind(this, rGetKngKnowledge),
      rPut: rPut.bind(this, rPutKngKnowledge),
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
