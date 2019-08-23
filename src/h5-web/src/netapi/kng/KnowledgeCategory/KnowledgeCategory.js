import rpcService from '@/netapi/rpcService';
import { checkParams } from '@/utilities/util';
import { notification } from 'antd';

/* 接口地址 */
import { URL_KNG_KNOWLEDGECATEGORYS, URL_KNG_KNOWLEDGECATEGORY } from '@/netapi/RestApiUrls';

/* 默认参数 */
const defaultParams = {
  parentId: 0,
  level: 0,
  path: '',
  code: '',
  name: '',
  priority: 0,
  state: 0,
  description: '',
  ext1: '',
  ext2: '',
  ext3: '',
  ext4: '',
};

// 新建单条
export async function rPostKngKnowledgeCategory(params) {
  const response = await rpcService.rPost(URL_KNG_KNOWLEDGECATEGORY, checkParams(defaultParams, params));
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}

// 编辑单条
export async function rPutKngKnowledgeCategory(params) {
  const response = await rpcService.rPut(URL_KNG_KNOWLEDGECATEGORY + '/' + params.id, checkParams(defaultParams, params));
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}

// 获取单条
export async function rGetKngKnowledgeCategory(params) {
  const response = await rpcService.rGet(URL_KNG_KNOWLEDGECATEGORY + '/' + params.id);
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}

// 删除多条
export async function rDeleteKngKnowledgeCategorys(params) {
  const response = await rpcService.rDelete(URL_KNG_KNOWLEDGECATEGORYS + '?ids=' + params.ids);
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}
