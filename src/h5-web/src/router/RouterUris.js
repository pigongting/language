// 临时菜单路由
export const tempMenus = [];

// 非菜单路由
export const nonMenuRouters = [
  {
    name: '登录',
    hashPath: '/auth/login',
    chunkName: 'shared-AuthLogin',
    moduleId: './src/areas/shared/Auth/Login.js',
  },
  {
    name: '工作台',
    hashPath: '/dashboard/workplace',
    chunkName: 'root-DsbWorkplace',
    moduleId: './src/areas/root/Dsb/Workplace.js',
  },
  {
    name: '403',
    hashPath: '/exception/403',
    chunkName: 'shared-Exception403',
    moduleId: './src/areas/shared/Exception/403.js',
  },
  {
    name: '404',
    hashPath: '/exception/404',
    chunkName: 'shared-Exception404',
    moduleId: './src/areas/shared/Exception/404.js',
  },
  {
    name: '500',
    hashPath: '/exception/500',
    chunkName: 'shared-Exception500',
    moduleId: './src/areas/shared/Exception/500.js',
  },
  {
    name: '500',
    hashPath: '/exception/500',
    chunkName: 'shared-Exception500',
    moduleId: './src/areas/shared/Exception/500.js',
  },
  // 员工
  {
    id: 9801,
    parentId: 98,
    level: 5,
    path: '1|2|86|98|9801',
    name: '新建员工',
    hashPath: '/org/employee/new',
    chunkName: 'root-OrgEmployeeNew',
    moduleId: './src/areas/root/Org/Employee/New.js',
  },
  {
    id: 9802,
    parentId: 98,
    level: 5,
    path: '1|2|86|98|9802',
    name: '编辑员工',
    hashPath: '/org/employee/edit',
    chunkName: 'root-OrgEmployeeEdit',
    moduleId: './src/areas/root/Org/Employee/Edit.js',
  },
  {
    id: 9803,
    parentId: 98,
    level: 5,
    path: '1|2|86|98|9803',
    name: '员工设置',
    hashPath: '/org/employee/setting',
    chunkName: 'root-OrgEmployeeSetting',
    moduleId: './src/areas/root/Org/Employee/Setting.js',
  },
];

// 非菜单-子路由
export const childRouters = [
  {
    id: 12901,
    parentId: 129,
    level: 5,
    path: '1|2|126|129|12901',
    name: '公司',
    hashPath: '/org/all/company',
    chunkName: 'root-OrgPropertyProjectList',
    moduleId: './src/areas/root/Org/PropertyProject/List.js',
  },
];
