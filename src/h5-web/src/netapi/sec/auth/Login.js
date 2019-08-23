import rpcService from '@/netapi/rpcService';
import { checkParams } from '@/utilities/util';
import { notification } from 'antd';

/* 接口地址 */
import { URL_SEC_AUTH_LOGIN } from '@/netapi/RestApiUrls';

/* 默认参数 */
const defaultParams = {
  account: '',
  password: '',
};

export async function rPutAuthLogin(params) {
  const response = await rpcService.rPut(URL_SEC_AUTH_LOGIN, checkParams(defaultParams, params));

  return response;
}