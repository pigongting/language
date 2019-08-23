import rpcService from '@/netapi/rpcService';
import { checkParams } from '@/utilities/util';
import { notification } from 'antd';

/* 接口地址 */
import { URL_KNG_KNOWLEDGES, URL_KNG_KNOWLEDGE } from '@/netapi/RestApiUrls';

/* 默认参数 */
const defaultParams = {
  code: '',
  name: '',
  state: 0,
  description: '',
  ext1: '',
  ext2: '',
  ext3: '',
  ext4: '',
};

// 新建单条
export async function rPostKngKnowledge(params) {
  const response = await rpcService.rPost(URL_KNG_KNOWLEDGE, checkParams(defaultParams, params));
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}

// 编辑单条
export async function rPutKngKnowledge(params) {
  const response = await rpcService.rPut(URL_KNG_KNOWLEDGE + '/' + params.id, checkParams(defaultParams, params));
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}

// 获取单条
export async function rGetKngKnowledge(params) {
  const response = await rpcService.rGet(URL_KNG_KNOWLEDGE + '/' + params.id);
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}

// 删除多条
export async function rDeleteKngKnowledges(params) {
  const response = await rpcService.rDelete(URL_KNG_KNOWLEDGES + '?ids=' + params.ids);
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}
