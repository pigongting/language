import rpcService from '@/netapi/rpcService';
import { checkParams } from '@/utilities/util';
import { notification } from 'antd';

/* 接口地址 */
import { URL_KNG_KNOWLEDGES } from '@/netapi/RestApiUrls';

/* 默认参数 */
const defaultParams = {
  name: '',
  pageindex: 1,
  pagesize: 20,
};

export async function rGetAllKngKnowledges(params) {
  const response = await rpcService.rGet(URL_KNG_KNOWLEDGES + checkParams(defaultParams, params, true));
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}
