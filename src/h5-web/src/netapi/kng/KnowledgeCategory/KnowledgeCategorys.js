import rpcService from '@/netapi/rpcService';
import { checkParams } from '@/utilities/util';
import { notification } from 'antd';
import { tree, treenodeify } from '@/utilities/trees';

/* 接口地址 */
import { URL_KNG_KNOWLEDGECATEGORYS } from '@/netapi/RestApiUrls';

/* 默认参数 */
const defaultParams = {
  name: '',
  pageindex: 1,
  pagesize: 1000,
};

export async function rGetAllKngKnowledgeCategorys(params) {
  const response = await rpcService.rGet(URL_KNG_KNOWLEDGECATEGORYS + checkParams(defaultParams, params, true));
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  response.data.entities = tree(treenodeify(response.data.entities)).tree;

  return response.data;
}

export async function rGetAllKngKnowledgeCategorysTree(params, origin, needRoot) {
  const response = await rpcService.rGet(URL_KNG_KNOWLEDGECATEGORYS + checkParams(defaultParams, params, true));
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  // 过滤根节点
  if (needRoot !== true) {
    response.data.entities = response.data.entities.filter(item => item.id !== item.parentId);
  }

  return tree(treenodeify(response.data.entities), origin);
}
