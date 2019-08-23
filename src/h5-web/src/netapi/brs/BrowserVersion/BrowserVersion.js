import rpcService from '@/netapi/rpcService';
import { checkParams } from '@/utilities/util';
import { notification } from 'antd';

/* 接口地址 */
import { URL_BRS_BROWSERVERSION, URL_BRS_BROWSERVERSIONS } from '@/netapi/RestApiUrls';

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
export async function rPostBrsBrowserVersion(params) {
  const response = await rpcService.rPost(URL_BRS_BROWSERVERSION, checkParams(defaultParams, params));
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}

// 编辑单条
export async function rPutBrsBrowserVersion(params) {
  const response = await rpcService.rPut(URL_BRS_BROWSERVERSION + '/' + params.id, checkParams(defaultParams, params));
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}

// 获取单条
export async function rGetBrsBrowserVersion(params) {
  const response = await rpcService.rGet(URL_BRS_BROWSERVERSION + '/' + params.id);
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}

// 删除多条
export async function rDeleteBrsBrowserVersions(params) {
  const response = await rpcService.rDelete(URL_BRS_BROWSERVERSIONS + '?ids=' + params.ids);
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}
