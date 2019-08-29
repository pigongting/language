/* 接口 */
import { rGetAllKngKnowledgeCategorys } from '@/netapi/kng/KnowledgeCategory/KnowledgeCategorys';
import { rPostKngKnowledgeCategory, rPutKngKnowledgeCategory, rGetKngKnowledgeCategory, rDeleteKngKnowledgeCategorys } from '@/netapi/kng/KnowledgeCategory/KnowledgeCategory';
/* 开源 */
/* 自研 */
import { rGetAll, rDeleteCategory, rPutStateCategory, rPost, rPut, rGet, rGetParent, rGetAndParent } from '@/utilities/common';
/* 命名空间(全局唯一) */
const namespacePrefix = 'kng/knowledgecategory';
/* 初始数据 */
// 列表
const ListState = {
  keep: {},
  pagination: {},
};
// 新建
const NewState = {
  entity: {
    parentId: 1,
    level: 2,
    path: '1|5',
    code: '',
    name: 'Test',
    priority: 1,
    state: 1,
    description: 'Server-Test',
    ext1: '',
    ext2: '',
    ext3: '',
    ext4: '',
  },
  parentEntity: {},
};
// 编辑
const EditState = {
  entity: {},
  parentEntity: {},
};

export default {
  namespacePrefix,
  List: {
    namespace: `${namespacePrefix}List`,
  
    state: ListState,
  
    effects: {
      rGetAll: rGetAll.bind(this, rGetAllKngKnowledgeCategorys),
      rDelete: rDeleteCategory.bind(this, rDeleteKngKnowledgeCategorys),
      rPutState: rPutStateCategory.bind(this, rGetKngKnowledgeCategory, rPutKngKnowledgeCategory),
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
      rGetParent: rGetParent.bind(this, rGetKngKnowledgeCategory),
      rPost: rPost.bind(this, rPostKngKnowledgeCategory),
    },

    reducers: {
      clean(state, action) { return NewState; },
      save(state, action) {
        return {
          ...state,
          parentEntity: action.payload.parentEntity || state.parentEntity,
        };
      }
    },
  },
  Edit: {
    namespace: `${namespacePrefix}Edit`,
  
    state: EditState,
  
    effects: {
      rGetAndParent: rGetAndParent.bind(this, rGetKngKnowledgeCategory),
      rPut: rPut.bind(this, rPutKngKnowledgeCategory),
    },

    reducers: {
      clean(state, action) { return EditState; },
      save(state, action) {
        return {
          ...state,
          entity: action.payload.entity || state.entity,
          parentEntity: action.payload.parentEntity || state.parentEntity,
        };
      }
    },
  },
};
