/* 接口 */
import { rGetAllKngKnowledges } from '@/netapi/kng/Knowledge/Knowledges';
import { rPostKngKnowledge, rPutKngKnowledge, rGetKngKnowledge, rDeleteKngKnowledges } from '@/netapi/kng/Knowledge/Knowledge';
import { rGetExKngKnowledge } from '@/netapi/kng/Knowledge/KnowledgeEx';
import { rGetAllKngKnowledgeCategorysTree } from '@/netapi/kng/KnowledgeCategory/KnowledgeCategorys';
import { rGetAllLanLanguages } from '@/netapi/lan/Language/Languages';
import { rGetAllBrsBrowserTypes } from '@/netapi/brs/BrowserType/BrowserTypes';
import { rGetAllBrsBrowsers } from '@/netapi/brs/Browser/Browsers';
import { rGetAllBrsBrowserVersions } from '@/netapi/brs/BrowserVersion/BrowserVersions';
/* 开源 */
import { tree, treenodeify } from '@/utilities/trees';
import clone from 'clone';
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
    name: '',
    state: 1,
    description: '',
    ext1: '',
    ext2: '',
    ext3: '',
    ext4: '',
    // 关联
    languageIds: [2],
    categoryIds: [8],
    knowledgeIds: [],
    knowledgeBrowserVersion: [
      { '0': 'Full' },
      { '0': 'Hack' },
    ],
  },
  browser: DEFAULT_TREE,
  category: DEFAULT_TREE,
  language: [],
  knowledge: [],
};
// 编辑
const EditState = {
  entity: {},
  browser: DEFAULT_TREE,
  category: DEFAULT_TREE,
  language: [],
  knowledge: [],
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
  
    state: clone(NewState),
  
    effects: {
      rPost: rPost.bind(this, rPostKngKnowledge),
      rGetAllBrowser,
      rGetAllLanguage,
      rGetTreeCategory,
      rGetAllKnowledge,
    },

    reducers: {
      clean(state, action) {
        return {
          ...NewState,
          entity: {
            ...NewState.entity,
            knowledgeBrowserVersion: [{ '0': 'Full' }, { '0': 'Hack' }]
          }
        };
      },
      save(state, action) {
        return {
          ...state,
          browser: action.payload.browser || state.browser,
          language: action.payload.language || state.language,
          category: action.payload.category || state.category,
          knowledge: action.payload.knowledge || state.knowledge,
        };
      }
    },
  },
  Edit: {
    namespace: `${namespacePrefix}Edit`,
  
    state: clone(EditState),
  
    effects: {
      rGetEx: rGet.bind(this, rGetExKngKnowledge),
      rPut: rPut.bind(this, rPutKngKnowledge),
      rGetAllBrowser,
      rGetAllLanguage,
      rGetTreeCategory,
      rGetAllKnowledge,
    },

    reducers: {
      clean(state, action) { return EditState; },
      save(state, action) {
        return {
          ...state,
          entity: action.payload.entity || state.entity,
          browser: action.payload.browser || state.browser,
          language: action.payload.language || state.language,
          category: action.payload.category || state.category,
          knowledge: action.payload.knowledge || state.knowledge,
        };
      }
    },
  },
};


function* rGetAllBrowser({ payload }, { call, put, select }) {
  const responseBrowserType = yield call(rGetAllBrsBrowserTypes, { pagesize: 1000 });
  if (responseBrowserType === undefined) { return; }

  const responseBrowser = yield call(rGetAllBrsBrowsers, { pagesize: 1000 });
  if (responseBrowser === undefined) { return; }

  const responseBrowserVersion = yield call(rGetAllBrsBrowserVersions, { pagesize: 1000 });
  if (responseBrowserVersion === undefined) { return; }

  // 附加类型
  responseBrowserType.entities.unshift({
    id: 0,
    name: '-',
  });
  responseBrowser.entities.unshift({
    id: 0,
    name: 'Support Type',
    browserTypeId: 0,
  });
  responseBrowserVersion.entities.unshift({
    id: 0,
    name: 'Full',
    browserId: 0,
  }, {
    id: -1,
    name: 'Hack',
    browserId: 0,
  });

  // 组成树形数据结构
  const browserType = tree(treenodeify(responseBrowserType.entities, 'browserType'));

  const browser = tree(treenodeify(responseBrowser.entities.map(item => {
    item.parentId = 'browserType' + item.browserTypeId;
    return item;
  }), 'browser'), browserType);

  const browserVersion = tree(treenodeify(responseBrowserVersion.entities.map(item => {
    item.parentId = 'browser' + item.browserId;
    return item;
  })), browser);

  yield put({ type: 'save', payload: { browser: browserVersion }});
}

function* rGetAllLanguage({ payload }, { call, put, select }) {
  const response = yield call(rGetAllLanLanguages, payload);
  if (response === undefined) { return; }

  yield put({ type: 'save', payload: { language: response.entities }});
}

function* rGetTreeCategory({ payload }, { call, put, select }) {
  const response = yield call(rGetAllKngKnowledgeCategorysTree, payload);
  if (response === undefined) { return; }

  yield put({ type: 'save', payload: { category: response }});
}

function* rGetAllKnowledge({ payload }, { call, put, select }) {
  const response = yield call(rGetAllKngKnowledges, payload);
  if (response === undefined) { return; }

  yield put({ type: 'save', payload: { knowledge: response.entities }});
}