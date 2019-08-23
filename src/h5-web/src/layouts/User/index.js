/* 开源-组件 */
import React, { Fragment } from 'react';
import { Link, Redirect, Switch, Route } from 'react-router-dom';
import { Icon } from 'antd';
/* 开源-工具 */
import pathToRegexp from 'path-to-regexp';
import DocumentTitle from 'react-document-title';
import asyncRouter from '@/router/asyncRouter';
import routes from '@/router/routes';
/* 自研-工具 */
import { PAGE_TITLE, PAGE_LOGO_TEXT_LOGIN, PAGE_COMPANY, PAGE_SLOGAN } from '@/Constant';
/* 自研-组件 */
import GlobalFooter from '@/components/GlobalFooter';
import NotFound from '@/areas/shared/Exception/404';
/* 相对路径-样式 */
import styles from './index.less';
/* 图片 */
import backgroundLogin from '@/cdn/media/image/background/login.svg';

const links = [];

const copyright = (
  <Fragment>
    Copyright <Icon type="copyright" /> 2018 {PAGE_COMPANY}
  </Fragment>
);

class UserLayout extends React.PureComponent {

  allRoutes = [];

  componentWillMount() {
    this.allRoutes = routes.allRoutes;
  }

  // 通过匹配url地址，以路由配置中的名称作为页面名称
  getPageTitle() {
    const { pathname } = this.props.location;
    let title = PAGE_TITLE;
    let currentRoute = null;
    // match params path
    Object.keys(this.allRoutes).forEach(key => {
      const item = this.allRoutes[key];
      if (pathToRegexp(item.hashPath).test(pathname)) {
        currentRoute = item;
      }
    });
    if (currentRoute && currentRoute.name) {
      title = `${currentRoute.name} - ${PAGE_TITLE}`;
    }
    return title;
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
    return (
      <DocumentTitle title={this.getPageTitle()}>
        <div className={styles.container} style={{ backgroundImage: 'url('+ backgroundLogin +')'}}>
          <div className={styles.content}>
            <div className={styles.top}>
              <div className={styles.header}>
                <Link to="/">
                  <img alt={PAGE_TITLE} className={styles.logo} src={PAGE_LOGO_TEXT_LOGIN} />
                </Link>
              </div>
              <div className={styles.desc}>{PAGE_TITLE} {PAGE_SLOGAN}</div>
            </div>
            <Switch>
              {this.getLoopRoute(this.allRoutes)}
              <Route render={NotFound} />
            </Switch>
          </div>
          <GlobalFooter links={links} copyright={copyright} />
        </div>
      </DocumentTitle>
    );
  }
}

export default UserLayout;
