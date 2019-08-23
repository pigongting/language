/* 自研 */
import { SYS_LOGIN_USER } from '@/Constant';
import { localVerifyToken } from '@/utilities/util';
/* 初始数据 */
const globalState = {
  user: {
    name: '请登录',
    avatar: require('@/cdn/media/image/background/user.png'),
    postion: '交互专家 |蚂蚁金服－某某某事业群－某某平台部－某某技术部－UED',
  },
};

/* 格式转换 */
const userTransform = (user) => {
  if (!user) { return globalState.user; }

  return {
    name: user.nickName || user.trueName || globalState.user.name,
    avatar: user.avatar || globalState.user.avatar,
    postion: user.postionName ? (user.postionName + '| ' + user.departmentName) : globalState.user.postion,
    ...user,
  };
};

/* 本地存储 */
const userString = localStorage.getItem(SYS_LOGIN_USER);
const userObject = JSON.parse(userString);
globalState.user = userTransform(userObject);

export default {
  namespace: 'global',

  state: globalState,

  effects: {},

  reducers: {
    save(state, action) {
      return {
        ...state,
        user: userTransform(action.payload.user) || state.user,
      };
    }
  },

  subscriptions: {
    setup({ history }) {
      return history.listen(({ pathname, search }) => {
        // 本地验证token
        // localVerifyToken();
      });
    },
  },
};
