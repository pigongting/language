import rpcService from '@/netapi/rpcService';
import { checkParams } from '@/utilities/util';
import { notification } from 'antd';

/* 接口地址 */
import { URL_BRS_BROWSERTYPE, URL_BRS_BROWSERTYPES } from '@/netapi/RestApiUrls';

/* 默认参数 */
const defaultParams = {
  name: '',
  code: '',
  state: 0,
  description: '',
  ext1: '',
  ext2: '',
  ext3: '',
  ext4: ''
};

// 新建单条
export async function rPostBrsBrowserType(params) {
  const response = await rpcService.rPost(URL_BRS_BROWSERTYPE, checkParams(defaultParams, params));
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}

// 编辑单条
export async function rPutBrsBrowserType(params) {
  const response = await rpcService.rPut(URL_BRS_BROWSERTYPE + '/' + params.id, checkParams(defaultParams, params));
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}

// 获取单条
export async function rGetBrsBrowserType(params) {
  const response = await rpcService.rGet(URL_BRS_BROWSERTYPE + '/' + params.id);
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}

// 删除多条
export async function rDeleteBrsBrowserTypes(params) {
  const response = await rpcService.rDelete(URL_BRS_BROWSERTYPES + '?ids=' + params.ids);
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}
