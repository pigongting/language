/* 自研-工具 */
import { SYS_CSL_MST_MENU } from '@/Constant';
import { tempMenus, nonMenuRouters, childRouters } from '@/router/RouterUris';
import { tree, treenodeify } from '@/utilities/trees';

/**
  * 源数据：
  * 1. serverMenus 服务端菜单
  * 2. tempMenus 临时菜单
  * 3. nonMenuRouters 非菜单路由
  * 4. childRouters 非菜单子路由
  * 
**/

const routes = {
  allRoutes: [],
  menuRouteObject: {},
  allRoutesObject: {},
  dataObject: {},
  menuTree: [],
};

// 从存储中取出的服务端菜单路由
function getServerMenus () {
  let serverMenus = [];

  try {
    const storageMenu = JSON.parse(localStorage.getItem(SYS_CSL_MST_MENU));
    if (storageMenu !== null) { serverMenus = storageMenu; }
  } catch(e) {
    console.log(e);
  }

  return serverMenus;
}

/**
  * 这个文件不只需要执行一次，所以要导出函数，如：在登录后需要重新执行
 */
export function getRoutes() {
  // 服务端菜单
  const serverMenus = getServerMenus();

  // 菜单 = 服务端菜单 + 临时菜单
  const menus = serverMenus.concat(tempMenus);

  // url转hashPath，删除空icon
  menus.map(item => {
    if (!item.icon) {
      delete item.icon;
    }
    if (item.url) {
      item.hashPath = item.url;
    }
    return item;
  });

  // 菜单路由
  const menuRouters = menus.filter(item => item.hashPath);

  // 全部路由 = 菜单路由 + 非菜单路由 + 非菜单子路由
  const allRouters = menuRouters.concat(nonMenuRouters).concat(childRouters);

  // 全部数据 = 菜单 + 非菜单路由 + 非菜单子路由
  const all = menus.concat(nonMenuRouters).concat(childRouters);
  
  // 菜单树
  const treeData = tree(treenodeify(menus));

  // 将非菜单子路由和菜单树建立关系
  childRouters.forEach(item => {
    const parent = treeData.mapping[item.parentId];
    if (parent) {
      if (parent.origin.subRoutes === undefined) {
        parent.origin.subRoutes = [];
      }
      parent.origin.subRoutes.push(item);
    }
  });

  // 对象-菜单中的路由-hashPath作为key
  const menuRouteObject = menuRouters.reduce((nodes, node) => {
    if (node.hashPath) {
      nodes[node.hashPath] = node;
    }
    return nodes;
  }, {});

  // 对象-所有路由-hashPath作为key
  const allRoutesObject = allRouters.reduce((nodes, node) => {
    if (node.hashPath) {
      nodes[node.hashPath] = node;
    }
    return nodes;
  }, {});

  // 对象-完整数据-id作为key
  const dataObject = all.reduce((nodes, node) => {
    if (node.id) {
      nodes[node.id] = node;
    }
    return nodes;
  }, {});

  // 更新路由
  routes.allRoutes = allRouters;
  routes.menuRouteObject = menuRouteObject;
  routes.allRoutesObject = allRoutesObject;
  routes.dataObject = dataObject;
  routes.menuTree = treeData.tree;
}

// 第一次得到路由
getRoutes();

export default routes;