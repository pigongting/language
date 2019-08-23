// 接口
import { rPutAuthLogin } from '@/netapi/sec/auth/Login';
// import { rGetAllSecUser } from '@/netapi/sec/User';
// import { rGetAllSecMenu } from '@/netapi/sec/Menu';
// import { rGetAllSecOrgFrames } from '@/netapi/sec/SecOrgFrames';
/* 开源 */
/* 自研 */
import { LOCALSTORAGEKEY_AUTHORIZATION, SYS_CSL_MST_MENU, SYS_LOGIN_USER, SEC_ORG_FRAME } from '@/Constant';
import { store, history, addAsyncModel } from '@/store';
import routes, { getRoutes } from '@/router/routes';
/* 命名空间(全局唯一) */
const namespacePrefix = 'auth/login';
/* 变量(方便使用) */
const { dispatch } = store;
/* 初始数据 */
const LoginState = {
  login: null
};

export default {
  namespacePrefix,
  Login: {
    namespace: `${namespacePrefix}Login`,
  
    state: LoginState,
  
    effects: {
      *login({ payload }, { call, put }) {
        // 登录
        const response = yield call(rPutAuthLogin, payload);
        if (response === undefined) { return; }

        // 登录失败
        if (response.code !== 0) {
          yield put({ type: 'save', payload: response });
          return;
        }

        // 保存 authorization Token
        localStorage.setItem(LOCALSTORAGEKEY_AUTHORIZATION, JSON.stringify({ token: response.data }));

        // 跳转-首页
        history.replace('/');

        /*
        // 登录成功
        // 获取用户信息
        const user = yield call(rGetAllSecUser);
        if (user === undefined) { return; }

        // 获取菜单
        const menu = yield call(rGetAllSecMenu);
        if (menu === undefined) { return; }

        // 获取组织架构
        const orgframe = yield call(rGetAllSecOrgFrames);
        if (orgframe === undefined) { return; }

        // 将用户信息保存到本地存储
        localStorage.setItem(SYS_LOGIN_USER, JSON.stringify(user));

        // 将菜单并保存到本地存储
        localStorage.setItem(SYS_CSL_MST_MENU, JSON.stringify(menu));

        // 将组织架构保存到本地存储
        localStorage.setItem(SEC_ORG_FRAME, JSON.stringify(orgframe.entities));

        // 更新全局用户信息
        dispatch({ type: 'global/save', payload: { user } });

        // 第三次更新路由
        getRoutes();

        // 跳转-首页
        history.replace('/');

        /*
        // 将附加了附加来源的搜索参数字符串转为对象，取出来源
        const searchObject = queryString.parse(history.location.search);
        const pathname = searchObject.frompathname;

        // 删除来源属性，得到未附加来源的搜索参数字符串
        delete searchObject.frompathname;
        const searchString = queryString.stringify(searchObject);
        const pathsearch = searchString ? `?${searchString}` : searchString;

        // menu 转对象
        const menuObj = getKeyObject(menu, 'url');

        // 跳转
        // TODO：二级地址 /qcs/taskdivision/settaskdivisionitem 有问题
        if (pathname && menuObj[pathname]) {
          history.replace(`${pathname}${pathsearch}${history.location.hash}`);
        } else {
          history.replace('/');
        }
        */
      },
    },

    reducers: {
      clean(state, action) { return LoginState; },
      save(state, action) {
        return {
          ...state,
          login: action.payload,
        };
      },
    },
  },
};
