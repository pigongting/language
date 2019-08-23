/* 开源-组件 */
import React from 'react';
import DocumentTitle from 'react-document-title';
import { Layout } from 'antd';
import { Switch, Redirect, Route } from 'react-router-dom';
/* 自研-工具 */
import routes from '@/router/routes';
import asyncRouter from '@/router/asyncRouter';
import { toArray } from '@/utilities/util';
/* 相对路径-组件 */
import Header from './Header';
import SiderMenu from './SiderMenu';
/* 相对路径-样式 */
import styles from './index.less';

class BaseLayout extends React.PureComponent {

  constructor(props) {
    super(props);

    this.state = {
      collapsed: false,
    };
  }

  // 获取匹配的路由
  getMatchRoute() {
    const { pathname } = this.props.location;
    const { allRoutesObject } = routes;
    const pathArray = toArray.url(pathname);

    let matchRoute  = undefined;

    for (let i = 0; i < pathArray.length; i++) {
      const path = pathArray[i];
      const currentRoute = allRoutesObject[path];
      if (currentRoute !== undefined) {
        matchRoute = currentRoute;

        // 仅显示主路由的标题
        if (matchRoute.subRoutes) { break; }
      }
    }

    return matchRoute;
  }

  // 获取页面名称
  getPageTitle(matchRoute) {
    const noTitle = '未标题文档';

    if (matchRoute === undefined) {
      return noTitle;
    }

    const title = matchRoute.name;

    return title || noTitle;
  }

  // 获取选中的菜单项
  getSelectedKeys(matchRoute) {
    const defaulKeys = [];

    if (matchRoute === undefined) {
      return defaulKeys;
    }

    const key = String(matchRoute.id);

    return [key] || defaulKeys;
  }

  // 获取展开的菜单项
  getOpenKeys(matchRoute) {
    const defaulKeys = [];

    if (matchRoute === undefined || matchRoute.path === undefined) {
      return defaulKeys;
    }

    const keys = matchRoute.path.split('|');

    return keys || defaulKeys;
  }

  // 展开折叠菜单
  handleCollapsed = () => {
    this.setState({
      collapsed: !this.state.collapsed,
    });
  }

  // 递归生成路由
  getLoopRoute = (arr) => {
    return arr.map((item, index) => {
      if (item.subRoutes) {
        return (
          <Route
            key={index}
            path={item.hashPath}
            render={(props) => {
              const ParentRoute = asyncRouter();
              return (
                <ParentRoute {...props}>
                  <Switch location={props.location}>
                    {item.redirect && <Redirect exact from={item.hashPath} to={item.redirect} />}
                    {this.getLoopRoute(item.subRoutes)}
                  </Switch>
                </ParentRoute>
              );
            }}
          />
        );
      } else {
        return (<Route key={index} path={item.hashPath} component={asyncRouter()} exact />);
      }
    });
  }

  render() {
    const { collapsed } = this.state;

    const matchRoute = this.getMatchRoute();
    const title = this.getPageTitle(matchRoute);
    const selectedKeys = this.getSelectedKeys(matchRoute);
    const openKeys = this.getOpenKeys(matchRoute);

    return (
      <DocumentTitle title={title}>
        <div className={styles.baseLayout}>
          <SiderMenu location={this.props.location} selectedKeys={selectedKeys} openKeys={openKeys} collapsed={collapsed} />
          <div className={styles.baseContent}>
            <Header title={title} collapsed={collapsed} onCollapsed={this.handleCollapsed} />
            <Switch>
              {this.getLoopRoute(routes.allRoutes)}
              <Redirect exact from="/" to="/dashboard/workplace" />
            </Switch>
          </div>
        </div>
      </DocumentTitle>
    );
  }
}

export default BaseLayout;
