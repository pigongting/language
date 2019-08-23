/* 接口 */
import { rGetAllKngKnowledges } from '@/netapi/kng/Knowledge/Knowledges';
import { rGetAllKngKnowledgeCategorysTree } from '@/netapi/kng/KnowledgeCategory/KnowledgeCategorys';
/* 开源 */
/* 自研 */
import { DEFAULT_TREE } from '@/Constant';
/* 命名空间(全局唯一) */
const namespacePrefix = 'kng/knowledge';
/* 初始数据 */
const ListState = {
  keep: {},
  pagination: {},
  typeSearchTree: DEFAULT_TREE,
};

export default {
  namespacePrefix,
  List: {
    namespace: `${namespacePrefix}List`,
  
    state: ListState,
  
    effects: {
      *rGetAll({ payload }, { call, put, select }) {
        const response = yield call(rGetAllKngKnowledges, payload);
        if (response === undefined) { return; }

        yield put({ type: 'save', payload: { keep: payload, pagination: response }});
      },
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
};
