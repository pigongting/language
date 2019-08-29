import rpcService from '@/netapi/rpcService';
import { checkParams } from '@/utilities/util';
import { notification } from 'antd';

/* 接口地址 */
import { URL_KNG_KNOWLEDGE_EX } from '@/netapi/RestApiUrls';

// 获取单条-扩展
export async function rGetExKngKnowledge(params) {
  const response = await rpcService.rGet(URL_KNG_KNOWLEDGE_EX + '/' + params.id);
  
  if (response.code !== 0) {
    notification.error({ message: '操作失败', description: response.message });
    return;
  }

  // 附加支持类型
  response.data.knowledgeBrowserVersion.map((item, index) => {
    if (index) {
      item[0] = "Full";
    } else {
      item[0] = "Hack";
    }
    return item;
  });

  return response.data;
}
