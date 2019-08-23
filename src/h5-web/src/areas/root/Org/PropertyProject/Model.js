/* 接口 */
import { rGetAllPbfPropertyProjects } from '@/netapi/org/PropertyProjects';
import { rPostOrgEmployee, rPutOrgEmployee, rDeleteOrgEmployee } from '@/netapi/org/Employee';
import { rGetOrgEmployeeExt } from '@/netapi/org/EmployeeExt';
import { rGetAllOrgEmployeesExt } from '@/netapi/org/EmployeesExt';
import { rGetAllOrgEmployeesExtExport } from '@/netapi/org/EmployeesExtExport';
import { rGetAllSecOrgFramesTree } from '@/netapi/sec/SecOrgFrames';
import { rGetAllOrgPositions } from '@/netapi/org/Positions';
import { rGetAllHrsEmployeeDuties, rPutHrsEmployeeDuties } from '@/netapi/hrs/EmployeeDuties';
import { rGetAllHrsDepartmentPositionDuties } from '@/netapi/hrs/DepartmentPositionDuties';
import { rGetAllIfsAdminAreas } from '@/netapi/ifs/AdminAreas';
import { rGetAllIfsAdminAreaCities } from '@/netapi/ifs/AdminAreaCities';
import { rGetAllOrgCompanies } from '@/netapi/org/Companies';
import { rPostPbfCmnProject } from '@/netapi/pbf/CmnProject';
/* 开源 */
/* 自研 */
import { treenodeify } from '@/utilities/trees';
/* 命名空间(全局唯一) */
const namespacePrefix = 'org/propertyproject';
/* 初始数据 */
const ListState = {
  keep: {},
  pagination: {},
  treeData: { mapping: {}, sourceMapping: {}, tree: [], loadedKeys: [] },
};
const NewState = {
  entity: {
    state: 1,
    // 临时
    parentId: undefined,
    adminAreaId: undefined,
    name: '新测试项目',
    shortName: '新测试项目-简称',
    no: 'FDSF',
    address: '新测试项目-地址',
    description: '新测试项目-描述',
  },
  compayData: [],
  areaData: { mapping: {}, sourceMapping: {}, tree: [], loadedKeys: [] },
};
const EditState = {
  entity: {},
  positionData: [],
};
const SettingState = {
  entity: {},
  duty: {
    main: { checked: [], options: [] },
    ext: { checked: [], options: [] },
  },
};

export default {
  namespacePrefix,
  List: {
    namespace: `${namespacePrefix}List`,
  
    state: ListState,
  
    effects: {
      *rGetAll({ payload }, { call, put, select }) {
        const response = yield call(rGetAllPbfPropertyProjects, payload);
        if (response === undefined) { return; }

        yield put({ type: 'save', payload: { keep: payload, pagination: response }});
      },
      *rExport({ payload }, { call, put, select }) {
        yield call(rGetAllOrgEmployeesExtExport, payload);
      },
      *rPutState({ payload, index }, { call, put, select }) {
        // 获取原始数据
        const response = yield call(rGetOrgEmployeeExt, payload);
        if (response === undefined) { return; }

        // 修改状态
        const stateOld = response.state;
        const stateNew = (stateOld === 1) ? 2 : 1;

        // 修改远程状态
        const responsePut = yield call(rPutOrgEmployee, Object.assign(response, { state: stateNew } ));
        if (responsePut === undefined) { return; }

        // 获取本地状态
        const pagination = yield select(state => state[`${namespacePrefix}List`].pagination);

        // 修改本地状态
        pagination.entities[index]['state'] = stateNew;

        // 更新本地状态
        yield put({ type: 'save', payload: { pagination }});
      },
      *rDelete({ payload, index }, { call, put, select }) {
        const response = yield call(rDeleteOrgEmployee, payload);
        if (response === undefined) { return; }

        // 更新本地状态
        const pagination = yield select(state => state[`${namespacePrefix}List`].pagination);

        // 修改本地状态
        pagination.entities.splice(index, 1);

        // 更新本地状态
        yield put({ type: 'save', payload: { pagination }});
      },
      *rGetAllDepartment({ payload }, { call, put, select }) {
        // const origin = yield select(state => state[`${namespacePrefix}List`].treeData);

        // const response = yield call(rGetAllSecOrgFramesTree, payload, origin, true);
        // if (response === undefined) { return; }

        // yield put({ type: 'save', payload: { treeData: response }});
      },
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
      *rGetAllCompany({ payload }, { call, put, select }) {
        yield put({ type: 'save', payload: { compayData: [] }});

        const response = yield call(rGetAllOrgCompanies, payload);
        if (response === undefined) { return; }

        yield put({ type: 'save', payload: { compayData: treenodeify(response.entities) }});
      },
      *rGetAllArea({ payload }, { call, put, select }) {
        const origin = yield select(state => state[`${namespacePrefix}New`].areaData);

        const response = yield call(rGetAllIfsAdminAreas, payload, origin, true);
        if (response === undefined) { return; }

        yield put({ type: 'save', payload: { areaData: response }});
      },
      *rGetAllAreaCity({ payload }, { call, put, select }) {
        // 数组的最后一个是目标对象
        const targetOption = payload[payload.length - 1];
        const parentid = targetOption.value;

        // 转圈-开始
        targetOption.loading = true;
        // 发送请求
        const response = yield call(rGetAllIfsAdminAreaCities, { parentid });
        // 转圈-结束
        targetOption.loading = false;
        // 请求失败，返回
        if (response === undefined) { return; }

        // 没有子级，设置选中项为叶子节点
        if (response.tree.length === 0) {
          targetOption.isLeaf = true;
          return;
        }
        // 追加子级
        targetOption.children = response.tree;
      },
      *rPost({ payload, callback }, { call, put, select }) {
        const response = yield call(rPostPbfCmnProject, payload);
        if (response === undefined) { return; }
        callback && callback();
      },
    },

    reducers: {
      clean(state, action) { return NewState; },
      save(state, action) {
        return {
          ...state,
          compayData: action.payload.compayData || state.compayData,
          areaData: action.payload.areaData || state.areaData,
        };
      }
    },
  },
  Edit: {
    namespace: `${namespacePrefix}Edit`,
  
    state: EditState,
  
    effects: {
      *rGet({ payload, callback }, { call, put, select }) {
        const response = yield call(rGetOrgEmployeeExt, payload);
        if (response === undefined) { return; }

        yield put({ type: 'save', payload: { entity: response }});

        callback && callback(response.departmentId);
      },
      *rGetAllPosition({ payload }, { call, put, select }) {
        const response = yield call(rGetAllOrgPositions, payload);
        if (response === undefined) { return; }

        yield put({ type: 'save', payload: { positionData: response }});
      },
      *rPut({ payload, callback }, { call, put, select }) {
        const response = yield call(rPutOrgEmployee, payload);
        if (response === undefined) { return; }
        callback && callback();
      },
    },

    reducers: {
      clean(state, action) { return EditState; },
      save(state, action) {
        return {
          ...state,
          keep: action.payload.keep || state.keep,
          entity: action.payload.entity || state.entity,
          positionData: action.payload.positionData || state.positionData,
        };
      }
    },
  },
  Setting: {
    namespace: `${namespacePrefix}Setting`,
  
    state: SettingState,
  
    effects: {
      *rGet({ payload, callback }, { call, put, select }) {
        const response = yield call(rGetOrgEmployeeExt, payload);
        if (response === undefined) { return; }

        yield put({ type: 'save', payload: { entity: response }});

        callback && callback(response.id, response);
      },
      *rGetAllHrsEmployeeDuties({ payload, entity }, { call, put, select }) {
        // 获取员工已设置的职责
        const setted = yield call(rGetAllHrsEmployeeDuties, payload);
        if (setted === undefined) { return; }

        // 获取所有的职责
        const all = yield call(rGetAllHrsDepartmentPositionDuties, payload);
        if (all === undefined) { return; }

        // 由于集团，分公司，项目不能交叉兼职，通过 G、C、P 过滤出员工所有可设置的职责
        const settable = all.entities.filter(item => item.scope === entity.scope);

        // 得到所有的主职责
        const optionsMain = settable.filter(item => item.departmentPositionId === entity.departmentPositionId);

        // 得到已勾选的主职责
        const checkedMain = setted.entities.filter(item => {
          return optionsMain.map(ele => ele.id).includes(item.departmentPositionDutyId);
        }).map(item => item.departmentPositionDutyId);

        // 得到所有的扩展职责，扩展职责的数量和可设置职责相同，只是对主职责进行禁用
        const optionsExt = settable.map(item => {
          item.disabled = (item.departmentPositionId === entity.departmentPositionId);
          return item;
        });

        // 得到已勾选的扩展职责
        const checkedExt = setted.entities.filter(item => {
          return optionsMain.map(ele => ele.id).includes(item.departmentPositionDutyId) === false;
        }).map(item => item.departmentPositionDutyId);

        yield put({
          type: 'save',
          payload: {
            duty: {
              main: { checked: checkedMain, options: optionsMain },
              ext: { checked: checkedExt, options: optionsExt },
            },
          },
        });
      },
      *rPut({ payload, callback }, { call, put, select }) {
        const response = yield call(rPutHrsEmployeeDuties, payload);
        if (response === undefined) { return; }
        callback && callback();
      },
    },

    reducers: {
      clean(state, action) { return SettingState; },
      save(state, action) {
        return {
          ...state,
          keep: action.payload.keep || state.keep,
          entity: action.payload.entity || state.entity,
          duty: action.payload.duty || state.duty,
        };
      }
    },
  },
};
