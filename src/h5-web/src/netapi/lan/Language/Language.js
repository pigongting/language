import rpcService from '@/netapi/rpcService';
import { checkParams } from '@/utilities/util';
import { notification } from 'antd';

/* 接口地址 */
import { URL_LAN_LANGUAGES, URL_LAN_LANGUAGE } from '@/netapi/RestApiUrls';

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
export async function rPostLanLanguage(params) {
  const response = await rpcService.rPost(URL_LAN_LANGUAGE, checkParams(defaultParams, params));
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}

// 编辑单条
export async function rPutLanLanguage(params) {
  const response = await rpcService.rPut(URL_LAN_LANGUAGE + '/' + params.id, checkParams(defaultParams, params));
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}

// 获取单条
export async function rGetLanLanguage(params) {
  const response = await rpcService.rGet(URL_LAN_LANGUAGE + '/' + params.id);
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}

// 删除多条
export async function rDeleteLanLanguages(params) {
  const response = await rpcService.rDelete(URL_LAN_LANGUAGES + '?ids=' + params.ids);
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}
