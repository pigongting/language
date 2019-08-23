import rpcService from '@/netapi/rpcService';
import { checkParams } from '@/utilities/util';
import { notification } from 'antd';

/* 接口地址 */
import { URL_BRS_BROWSERS } from '@/netapi/RestApiUrls';

/* 默认参数 */
const defaultParams = {
  name: '',
  pageindex: 1,
  pagesize: 20,
};

// 查询多条-分页
export async function rGetAllBrsBrowsers(params) {
  const response = await rpcService.rGet(URL_BRS_BROWSERS + checkParams(defaultParams, params, true));
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  return response.data;
}
