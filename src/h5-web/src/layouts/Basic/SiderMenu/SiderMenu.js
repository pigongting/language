import React, { PureComponent } from 'react';
import { Link } from 'react-router-dom';

import pathToRegexp from 'path-to-regexp';
import classNames from 'classnames';

import { Layout, Menu, Icon } from 'antd';

import routes from '@/router/routes';

import { history } from '@/store';
import { PAGE_TITLE, PAGE_LOGO, PAGE_LOGO_TEXT } from '@/Constant';
import { urlToList } from '@/utilities/utility';
// /userinfo/2144/id => ['/userinfo','/useinfo/2144,'/userindo/2144/id']

import styles from './SiderMenu.less';

const { Sider } = Layout;
const { SubMenu } = Menu;

// Allow config icon as string or ReactNode
// 允许配置图标，格式为 字符串 或 ReactNode
//   icon: 'setting',
//   icon: 'http://demo.com/icon.png',
//   icon: <Icon type="setting" />,
const getIcon = icon => {
  if (typeof icon === 'string' && icon.indexOf('http') === 0) {
    return (<img src={icon} alt="icon" className={classNames(styles.icon, 'sider-menu-item-img')} />);
  }
  if (typeof icon === 'string') {
    return (<Icon type={icon} />);
  }
  return icon;
};

/**
 * Find all matched menu keys based on pathnames
 * 根据路径查找所有匹配的菜单键
 * 以最后匹配的路径所获取的key数组为准
 */
export const getMeunMatchKeys = (menuRouteObject, pathnames) => {
  let keys = [];

  pathnames.forEach((item, index) => {
    const findItem = menuRouteObject[item];
    if (findItem) {
      keys = findItem.path.split('|');
    }
  });

  return keys;
}

// 组件开始
export default class SiderMenu extends PureComponent {
  constructor(props) {
    super(props);

    this.state = {
      openKeys: [],
      // width: 0
    };
  }

  componentWillMount() {
    this.menuRouteObject = routes.menuRouteObject;
    this.setState({
      openKeys: this.getDefaultCollapsedSubMenus(this.props),
    });
  }

  componentWillReceiveProps(nextProps) {
    // const that = this;
    // this.timer = setTimeout(() => {
    //   that.setState({
    //     width: window.innerWidth
    //   })
    // }, 500);
    // window.onresize = this.timer;

    if (nextProps.location.pathname !== this.props.location.pathname) {
      this.setState({
        openKeys: this.getDefaultCollapsedSubMenus(nextProps),
      });
    }
  }
  componentWillUnmount() {
    // clearInterval(this.timer);
  }

  /**
   * 获取默认展开的子菜单，根据路径获取
   * /list/search/articles = > ['list','/list/search']
   * @param  props
   */
  getDefaultCollapsedSubMenus(props) {
    const { location: { pathname } } = props;
    return getMeunMatchKeys(this.menuRouteObject, urlToList(pathname));
  }

  // 手动改变展开项
  handleOpenChange = openKeys => {
    const lastOpenKey = openKeys[openKeys.length - 1];
    // 超过一个 key 匹配到，表示打开了两个主菜单
    const moreThanOne = openKeys.filter(openKey => this.isMainMenu(openKey)).length > 1;
    this.setState({
      openKeys: moreThanOne ? [lastOpenKey] : [...openKeys],
    });
  };

  // 是否是主菜单
  isMainMenu = key => {
    return this.props.menuData.some(item => {
      return key && (String(item.id) === key || String(item.path) === key);
    });
  };

  // 获取选中项，根据路径获取
  getSelectedMenuKeys = () => {
    const { location: { pathname } } = this.props;
    return getMeunMatchKeys(this.menuRouteObject, urlToList(pathname));
  };

  /**
   * 获得菜单子节点
   * @memberof SiderMenu
   */
  getNavMenuItems = menusData => {
    if (!menusData) {
      return [];
    }

    return menusData.map(item => {
      if (item.children && item.children.some(child => child.origin.name)) {
        const childrenItems = this.getNavMenuItems(item.children);

        // 当无子菜单时就不展示菜单
        if (childrenItems && childrenItems.length > 0) {
          return (
            <SubMenu
              title={
                item.origin.icon ? (
                  <span>
                    {getIcon(item.origin.icon)}
                    <span>{item.origin.name}</span>
                  </span>
                ) : (
                  item.origin.name
                )
              }
              key={item.origin.id}
            >
              {childrenItems}
            </SubMenu>
          );
        }

        return null;
      } else {
        return <Menu.Item key={item.origin.id}>{this.getMenuItemPath(item)}</Menu.Item>;
      }
    });
  };

  /**
   * 判断是否是http链接.返回 Link 或 a
   * Judge whether it is http link.return a or Link
   * @memberof SiderMenu
   */
  getMenuItemPath = item => {
    const itemPath = item.origin.hashPath;
    const icon = getIcon(item.origin.icon);
    const { target, name } = item.origin;

    // 没有路径返回图标文字
    if (!itemPath) {
      return (
        <div>
          {icon}
          <span>{name}</span>
        </div>
      );
    }
    
    // Is it a http link
    // 是 http 链接
    if (/^https?:\/\//.test(itemPath)) {
      return (
        <a href={itemPath} target={target}>
          {icon}
          <span>{name}</span>
        </a>
      );
    }

    return (
      <Link
        to={itemPath}
        target={target}
        replace={itemPath === this.props.location.pathname}
        onClick={() => {
          // 多次点击同一个菜单，会刷新
          if (itemPath === this.props.location.pathname) {
            history.replace(itemPath);
            history.go();
          }
          this.props.isMobile && this.props.onCollapse(true);
        }}
      >
        {icon}
        <span>{name}</span>
      </Link>
    );
  };

  render() {
    const { collapsed, onCollapse } = this.props;
    const { openKeys, width } = this.state;

    // Don't show popup menu when it is been collapsed
    // 当是折叠状态，不要展开菜单
    const menuProps = collapsed ? {} : { openKeys };

    // if pathname can't match, use the nearest parent's key
    // 如果 pathname 不能匹配，使用最靠近的父的 key
    let selectedKeys = this.getSelectedMenuKeys();
    if (!selectedKeys.length) {
      selectedKeys = [openKeys[openKeys.length - 1]];
    }

    return (
      <Sider
        width={192}
        breakpoint="lg"
        trigger={null}
        collapsible
        collapsed={collapsed}
        onCollapse={onCollapse}
        className={styles.sider}
      >
        <div className={styles.logo} key="logo">
          <Link to="/">
            <img src={PAGE_LOGO} alt={PAGE_TITLE} className='mdImage'/> 
            <img src={PAGE_LOGO_TEXT} alt={PAGE_TITLE} className='lgImage'/> 
          </Link>
        </div>
        <Menu
          key="Menu"
          theme="dark"
          mode="inline"
          {...menuProps}
          onOpenChange={this.handleOpenChange}
          selectedKeys={selectedKeys}
          style={{ padding: '16px 0', width: '100%' }}
        >
          {this.getNavMenuItems(this.props.menuData)}
        </Menu>
      </Sider>
    );
  }
}
