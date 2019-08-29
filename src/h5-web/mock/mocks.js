import { INTERFACE_URL } from './config';

const proxy = {
  // 浏览器
  // 浏览器类型
  ['GET /brs/browsertypes']: INTERFACE_URL,
  ['GET /brs/browsertype/:id']: INTERFACE_URL,
  ['PUT /brs/browsertype/:id']: INTERFACE_URL,
  ['POST /brs/browsertype']: INTERFACE_URL,
  ['DELETE /brs/browsertypes']: INTERFACE_URL,
  // 浏览器
  ['GET /brs/browsers']: INTERFACE_URL,
  ['GET /brs/browser/:id']: INTERFACE_URL,
  ['PUT /brs/browser/:id']: INTERFACE_URL,
  ['POST /brs/browser']: INTERFACE_URL,
  ['DELETE /brs/browsers']: INTERFACE_URL,
  // 浏览器版本
  ['GET /brs/browserversions']: INTERFACE_URL,
  ['GET /brs/browserversion/:id']: INTERFACE_URL,
  ['PUT /brs/browserversion/:id']: INTERFACE_URL,
  ['POST /brs/browserversion']: INTERFACE_URL,
  ['DELETE /brs/browserversions']: INTERFACE_URL,

  // 语言
  // 浏览器
  ['GET /lan/languages']: INTERFACE_URL,
  ['GET /lan/language/:id']: INTERFACE_URL,
  ['PUT /lan/language/:id']: INTERFACE_URL,
  ['POST /lan/language']: INTERFACE_URL,
  ['DELETE /lan/languages']: INTERFACE_URL,

  // 知识点
  // 知识点类别
  ['GET /kng/knowledgecategorys']: INTERFACE_URL,
  ['GET /kng/knowledgecategory/:id']: INTERFACE_URL,
  ['PUT /kng/knowledgecategory/:id']: INTERFACE_URL,
  ['POST /kng/knowledgecategory']: INTERFACE_URL,
  ['DELETE /kng/knowledgecategorys']: INTERFACE_URL,
  // 知识点
  ['GET /kng/knowledges']: INTERFACE_URL,
  ['GET /kng/knowledge/:id']: INTERFACE_URL,
  ['PUT /kng/knowledge/:id']: INTERFACE_URL,
  ['POST /kng/knowledge']: INTERFACE_URL,
  ['DELETE /kng/knowledges']: INTERFACE_URL,
  // 知识点-扩展
  ['GET /kng/knowledge-ex/:id']: INTERFACE_URL,
};

module.exports = proxy;