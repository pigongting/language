import rpcService from '@/netapi/rpcService';
import { checkParams } from '@/utilities/util';
import { notification } from 'antd';

/* 接口地址 */
import { URL_BRS_BROWSER, URL_BRS_BROWSERS } from '@/netapi/RestApiUrls';

/* 默认参数 */
const defaultParams = {
  browserTypeId: 0,
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
export async function rPostBrsBrowser(params) {
  const response = await rpcService.rPost(URL_BRS_BROWSER, checkParams(defaultParams, params));
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}

// 编辑单条
export async function rPutBrsBrowser(params) {
  const response = await rpcService.rPut(URL_BRS_BROWSER + '/' + params.id, checkParams(defaultParams, params));
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}

// 获取单条
export async function rGetBrsBrowser(params) {
  const response = await rpcService.rGet(URL_BRS_BROWSER + '/' + params.id);
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}

// 删除多条
export async function rDeleteBrsBrowsers(params) {
  const response = await rpcService.rDelete(URL_BRS_BROWSERS + '?ids=' + params.ids);
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}
