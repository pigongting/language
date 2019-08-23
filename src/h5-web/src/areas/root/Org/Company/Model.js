/* 接口 */
import { rGetAllOrgDepartmentDivision } from '@/netapi/org/DepartmentDivision';
/* 开源 */
/* 自研 */
/* 命名空间(全局唯一) */
const namespacePrefix = 'org/company';
/* 初始数据 */
const ListState = {
  keep: {},
  pagination: {},
};

export default {
  namespacePrefix,
  List: {
    namespace: `${namespacePrefix}List`,
  
    state: ListState,
  
    effects: {
      *rGetAll({ payload }, { call, put, select }) {
        const response = yield call(rGetAllOrgDepartmentDivision, payload);
        if (response === undefined) { return; }

        yield put({ type: 'save', payload: { keep: payload, pagination: response }});
      },
    },

    reducers: {
      clean(state, action) { return ProjectNonComplainState; },
      save(state, action) {
        return {
          ...state,
          keep: action.payload.keep || state.keep,
          pagination: action.payload.pagination || state.pagination,
        };
      }
    },
  },
};
