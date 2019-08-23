/* 开源-组件 */
import React from 'react';
import { Spin } from 'antd';
/* 自研-组件 */
import NotFound from '@/areas/shared/Exception/404';
/* 自研-工具 */
import routes from '@/router/routes';

class DynamicComponent extends React.Component {
  constructor(...args) {
    super(...args);
    this.LoadingComponent = <div>加载中...</div>;
    this.state = {
      AsyncRouter: null,
      isNotFound: false,
    };
  }

  componentDidMount() {
    this.mounted = true;
    this.load();
  }

  componentWillUnmount() {
    this.mounted = false;
  }

  load() {
    const route = routes.allRoutesObject[this.props.match.url];

    if (!route) {
      console.log(routes);
      console.log(`route NotFound with ${this.props.match.url}`);
      return;
    }

    if (!route.chunkName || !route.moduleId) {
      console.log(`chunkName/moduleId NotFound with ${this.props.match.url}`);
      return;
    }

    // TODO：现在是依赖 webpack compliation plugin
    __webpack_require__.e(route.chunkName).then((data) => {
      const m = __webpack_require__(route.moduleId);
      const AsyncRouter = m.default || m;
      if (this.mounted) {
        this.setState({ AsyncRouter });
      } else {
        this.state.AsyncRouter = AsyncRouter; // eslint-disable-line
      }
    }).catch((ex) => {
      console.log(ex);
      this.setState({ isNotFound: true });
    });
  }

  render() {
    const { AsyncRouter, isNotFound } = this.state;
    const { LoadingComponent } = this;

    if (isNotFound) return <NotFound />;

    if (AsyncRouter) return <AsyncRouter {...this.props} />;

    return (
      <div style={{ textAlign: 'center', padding: '20px' }}>
        <Spin size="large" />
      </div>
    );
  }
}

export default () => DynamicComponent;