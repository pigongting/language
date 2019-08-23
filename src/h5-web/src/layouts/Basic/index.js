/* 开源-组件 */
import React, { Fragment } from 'react';
import { connect } from 'react-redux';
import { Switch, Redirect, Route, Link } from 'react-router-dom';
import { Layout, Icon } from 'antd';
/* 开源-工具 */
import PropTypes from 'prop-types';
import pathToRegexp from 'path-to-regexp';
import classNames from 'classnames';
import DocumentTitle from 'react-document-title';
import { ContainerQuery } from 'react-container-query';
import { enquireScreen, unenquireScreen } from 'enquire-js';
/* 自研-工具 */
import { PAGE_TITLE, PAGE_COMPANY } from '@/Constant';
import routes from '@/router/routes';
import asyncRouter from '@/router/asyncRouter';
/* 自研-组件 */
import GlobalFooter from '@/components/GlobalFooter';
import NotFound from '@/areas/shared/Exception/404';
/* 相对路径-组件 */
import BasicHeader from './Header';
import SiderMenu from './SiderMenu';
/* 相对路径-样式 */
import './index.css';
/* 变量(方便使用) */
const { Content, Header, Footer } = Layout;

// 响应布局数据
const query = {
  'screen-xs': {
    maxWidth: 575,
  },
  'screen-sm': {
    minWidth: 576,
    maxWidth: 767,
  },
  'screen-md': {
    minWidth: 768,
    maxWidth: 991,
  },
  'screen-lg': {
    minWidth: 992,
    maxWidth: 1199,
  },
  'screen-xl': {
    minWidth: 1200,
  },
};

// 判断是非是移动端
let isMobile;
enquireScreen(b => {
  isMobile = b;
});

class BasicLayout extends React.Component {

  static childContextTypes = {
    location: PropTypes.object,
    breadcrumbNameMap: PropTypes.object,
  };
  
  state = {
    isMobile,
  }

  allRoutes = [];

  menuTree = [];
  
  getChildContext() {
    return {
      location: this.props.location,
    };
  }

  componentWillMount() {
    this.allRoutes = routes.allRoutes;
    this.menuTree = routes.menuTree;
  }
  
  componentDidMount() {
    this.enquireHandler = enquireScreen(mobile => {
      this.setState({
        isMobile: mobile,
      });
    });
  }

  componentWillUnmount() {
    unenquireScreen(this.enquireHandler);
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

  // 默认打开页面
  getDefaultPage(menuTree) {

    let entryPage;
    let match = false;

    function loop(arr) {
      if (match) {
        return;
      }
      for (var i = 0; i < arr.length; i++) {
        if (match) {
          return;
        }
        if (arr[i].children) {
          loop(arr[i].children);
        } else {
          // console.log(arr[i]);
          // console.log(arr[i].hashPath);
          entryPage = arr[i].hashPath;
          match = true;
        }
      }
    }

    loop(menuTree);

    return entryPage;
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
    // 布局
    const layout = (
      <Layout>
        <SiderMenu
          menuData={this.menuTree}
          location={this.props.location}
          collapsed={this.props.collapsed}
          onCollapse={this.props.handleMenuCollapse}
          isMobile={this.state.isMobile}
        />
        <Layout>
          <Header style={{ padding: 0, position: 'relative', zIndex: 1 }}>
            <BasicHeader
              collapsed={this.props.collapsed}
              onCollapse={this.props.handleMenuCollapse}
              isMobile={this.state.isMobile}
            />
          </Header>
          <Content style={{ margin: '24px 24px 0', height: '100%' }}>
            <Switch>
              {this.getLoopRoute(this.allRoutes)}
              <Redirect exact from="/" to={this.getDefaultPage(this.menuTree) || '/dashboard/workplace'} />
              <Route render={NotFound} />
            </Switch>
          </Content>
          <Footer style={{ padding: 0 }}>
            <GlobalFooter
              // links={[
              //   {
              //     key: 'Pro 首页',
              //     title: 'Pro 首页',
              //     href: 'http://pro.ant.design',
              //     blankTarget: true,
              //   },
              //   {
              //     key: 'github',
              //     title: <Icon type="github" />,
              //     href: 'https://github.com/ant-design/ant-design-pro',
              //     blankTarget: true,
              //   },
              //   {
              //     key: 'Ant Design',
              //     title: 'Ant Design',
              //     href: 'http://ant.design',
              //     blankTarget: true,
              //   },
              // ]}
              copyright={
                <Fragment>
                  Copyright <Icon type="copyright" /> 2018 {PAGE_COMPANY}
                </Fragment>
              }
            />
          </Footer>
        </Layout>
      </Layout>
    );

    return (
      <DocumentTitle title={this.getPageTitle()}>
        <ContainerQuery query={query}>
          {params => <div className={classNames(params)}>{layout}</div>}
        </ContainerQuery>
      </DocumentTitle>
    );
  }
}

function mapStateToProps({ user, global, loading }, ownProps) {
  return {
    collapsed: global.collapsed,
    // notices: global.notices,
    // currentUser: user.currentUser,
    // fetchingNotices: loading.effects['global/fetchNotices'],
    // fetchingNotices: false,
  };
}

function mapDispatchToProps(dispatch, ownProps) {
  return {
    handleMenuCollapse: (collapsed) => {
      dispatch({
        type: 'global/changeLayoutCollapsed',
        payload: collapsed,
      });
    }
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(BasicLayout);