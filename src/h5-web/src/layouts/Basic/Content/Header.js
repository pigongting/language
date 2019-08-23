import React, { PureComponent, createElement } from 'react';

import pathToRegexp from 'path-to-regexp';
import PropTypes from 'prop-types';
import classNames from 'classnames';
import { urlToList } from '@/utilities/utility';

import { Breadcrumb, Tabs } from 'antd';

import routes from '@/router/routes';

import styles from './Header.less';

const { TabPane } = Tabs;

// 获取面包屑
// export function getBreadcrumb(breadcrumbNameMap, url) {
//   let breadcrumb = breadcrumbNameMap[url];
//   if (!breadcrumb) {
//     Object.keys(breadcrumbNameMap).forEach(item => {
//       if (pathToRegexp(item).test(url)) {
//         breadcrumb = breadcrumbNameMap[item];
//       }
//     });
//   }
//   return breadcrumb || {};
// }

export default class PageHeader extends PureComponent {
  static contextTypes = {
    routes: PropTypes.array,
    params: PropTypes.object,
    location: PropTypes.object,
  };

  state = {
    breadcrumb: null,
  };

  allRoutesObject = {};

  dataObject = {};

  componentWillMount() {
    const gRoutes = routes;
    this.allRoutesObject = gRoutes.allRoutesObject;
    this.dataObject = gRoutes.dataObject;
  }

  componentDidMount() {
    this.getBreadcrumbDom();
  }

  componentDidUpdate(preProps) {
    if (preProps.tabActiveKey !== this.props.tabActiveKey) {
      this.getBreadcrumbDom();
    }
  } 

  getBreadcrumbDom = () => {
    const breadcrumb = this.conversionBreadcrumbList();
    this.setState({
      breadcrumb,
    });
  };

  /**
   * 将参数转化为面包屑
   * Convert parameters into breadcrumbs
   */
  conversionBreadcrumbList = () => {
    // 如果通过 BasicContent 组件的属性传递了面包屑数据，优先使用
    const { breadcrumbList, breadcrumbSeparator } = this.props;
    if (breadcrumbList && breadcrumbList.length) {
      return this.conversionFromProps();
    }

    const { routes, params, routerLocation, breadcrumbNameMap } = this.getBreadcrumbProps();
    
    // 如果传入 routes 和 params 属性
    // If pass routes and params attributes
    if (routes && params) {
      return (
        <Breadcrumb
          className={styles.breadcrumb}
          routes={routes.filter(route => route.breadcrumbName)}
          params={params}
          itemRender={this.itemRender}
          separator={breadcrumbSeparator}
        />
      );
    }
    
    // 根据 location 生成 面包屑
    // Generate breadcrumbs based on location
    if (routerLocation && routerLocation.pathname) {
      return this.conversionFromLocation(routerLocation, breadcrumbNameMap);
    }
    
    return null;
  };

  // Generated according to props
  // 根据属性生成
  conversionFromProps = () => {
    const { breadcrumbList, breadcrumbSeparator, linkElement = 'a' } = this.props;

    return (
      <Breadcrumb className={styles.breadcrumb} separator={breadcrumbSeparator}>
        {breadcrumbList.map(item => (
          <Breadcrumb.Item key={item.title}>
            {item.href
              ? createElement(
                  linkElement,
                  {
                    [linkElement === 'a' ? 'href' : 'to']: item.href,
                  },
                  item.title
                )
              : item.title}
          </Breadcrumb.Item>
        ))}
      </Breadcrumb>
    );
  };
  
  // 获取面包屑属性
  getBreadcrumbProps = () => {
    return {
      routes: this.props.routes || this.context.routes,
      params: this.props.params || this.context.params,
      routerLocation: this.props.location || this.context.location,
      breadcrumbNameMap: this.props.breadcrumbNameMap || this.allRoutesObject,
    };
  };

  // 渲染 Breadcrumb 子节点
  // Render the Breadcrumb child node
  itemRender = (route, params, routes, paths) => {
    const { linkElement = 'a' } = this.props;
    const last = routes.indexOf(route) === routes.length - 1;
    return last || !route.component ? (
      <span>{route.breadcrumbName}</span>
    ) : (
      createElement(
        linkElement,
        {
          href: paths.join('/') || '/',
          to: paths.join('/') || '/',
        },
        route.breadcrumbName
      )
    );
  };

  // 从 Location 转化
  conversionFromLocation = (routerLocation, breadcrumbNameMap) => {
    const { breadcrumbSeparator, linkElement = 'a' } = this.props;
    
    // // Convert the url to an array
    // // 把 url 转为数组
    // const pathSnippets = urlToList(routerLocation.pathname);
    
    // // Loop data mosaic routing
    // // 循环数据拼接路由
    // const extraBreadcrumbItems = pathSnippets.map((url, index) => {
    //   const currentBreadcrumb = getBreadcrumb(breadcrumbNameMap, url);
    //   const isLinkable = (index !== pathSnippets.length - 1) && currentBreadcrumb.component;
      
    //   return (currentBreadcrumb.name && !currentBreadcrumb.hideInBreadcrumb) ? (
    //     <Breadcrumb.Item key={url}>
    //       {createElement(
    //         isLinkable ? linkElement : 'span',
    //         { [linkElement === 'a' ? 'href' : 'to']: url },
    //         currentBreadcrumb.name
    //       )}
    //     </Breadcrumb.Item>
    //   ) : null;
    // });
    
    // // Add home breadcrumbs to your head
    // // 添加首页到面包屑的开始位置
    // extraBreadcrumbItems.unshift(
    //   <Breadcrumb.Item key="home">
    //     {createElement(
    //       linkElement,
    //       {
    //         [linkElement === 'a' ? 'href' : 'to']: '/',
    //       },
    //       '首页'
    //     )}
    //   </Breadcrumb.Item>
    // );

    const matchRoute = breadcrumbNameMap[routerLocation.pathname];

    if (!matchRoute || !matchRoute.path) {
      return null;
    }

    const ids = matchRoute.path.split('|');

    const extraBreadcrumbItems = ids.map((id, index) => {
      const item = this.dataObject[id];
      
      if (id === '1') {
        return (
          <Breadcrumb.Item key="1">
            {createElement(
              linkElement,
              {
                [linkElement === 'a' ? 'href' : 'to']: '/',
              },
              '首页'
            )}
          </Breadcrumb.Item>
        );
      } else if (item && item.name && !item.hideInBreadcrumb) {
        const isLinkable = (index !== (ids.length - 1)) && item.hashPath;
        
        return (
          <Breadcrumb.Item key={item.id}>
            {createElement(
              isLinkable ? linkElement : 'span',
              { [linkElement === 'a' ? 'href' : 'to']: item.hashPath },
              item.name
            )}
          </Breadcrumb.Item>
        );
      } else {
        return null;
      }
    });
    
    return (
      <Breadcrumb className={styles.breadcrumb} separator={breadcrumbSeparator}>
        {extraBreadcrumbItems}
      </Breadcrumb>
    );
  };

  // 标签切换
  onTabChange = key => {
    if (this.props.onTabChange) {
      this.props.onTabChange(key);
    }
  };

  render() {
    // 都来自于 BasicContent 的 restProps 属性
    const {
      title,
      logo,
      action,
      content,
      extraContent,
      tabList,
      className,
      tabActiveKey,
      tabDefaultActiveKey,
      tabBarExtraContent,
    } = this.props;

    const clsString = classNames(styles.pageHeader, className);
    
    const activeKeyProps = {};
    if (tabDefaultActiveKey !== undefined) {
      activeKeyProps.defaultActiveKey = tabDefaultActiveKey;
    }
    if (tabActiveKey !== undefined) {
      activeKeyProps.activeKey = tabActiveKey;
    }

    return (
      <div className={clsString}>
        {this.state.breadcrumb}
        <div className={styles.detail}>
          {logo && <div className={styles.logo}>{logo}</div>}
          <div className={styles.main}>
            <div className={styles.row}>
              {title && <h1 className={styles.title}>{title}</h1>}
              {action && <div className={styles.action}>{action}</div>}
            </div>
            <div className={styles.row}>
              {content && <div className={styles.content}>{content}</div>}
              {extraContent && <div className={styles.extraContent}>{extraContent}</div>}
            </div>
          </div>
        </div>
        {tabList &&
          tabList.length && (
            <Tabs
              className={styles.tabs}
              {...activeKeyProps}
              onChange={this.onTabChange}
              tabBarExtraContent={tabBarExtraContent}
            >
              {tabList.map(item => <TabPane tab={item.tab} key={item.key} />)}
            </Tabs>
          )}
      </div>
    );
  }
}
