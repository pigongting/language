import rpcService from '@/netapi/rpcService';
import { checkParams } from '@/utilities/util';
import { notification } from 'antd';

/* 接口地址 */
import { URL_LAN_LANGUAGES } from '@/netapi/RestApiUrls';

/* 默认参数 */
const defaultParams = {
  name: '',
  pageindex: 1,
  pagesize: 20,
};

export async function rGetAllLanLanguages(params) {
  const response = await rpcService.rGet(URL_LAN_LANGUAGES + checkParams(defaultParams, params, true));
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}
