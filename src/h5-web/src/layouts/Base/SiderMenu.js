/* 开源-组件 */
import React, { Fragment } from 'react';
import { Switch, Redirect, Route, Link } from 'react-router-dom';
import { Menu, Icon } from 'antd';
/* 开源-工具 */
import classNames from 'classnames';
/* 自研-工具 */
import routes from '@/router/routes';
import { history } from '@/store';
import { PAGE_LOGO_ICON, PAGE_LOGO_PLANTEXT, PAGE_TITLE } from '@/Constant';
/* 相对路径-样式 */
import styles from './SiderMenu.less';

class SiderMenu extends React.PureComponent {
  
  state = {
    openKeys: undefined
  }

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
            <Menu.SubMenu
              key={item.origin.id}
              title={
                item.origin.icon ? (
                  <span>
                    {<Icon type={item.origin.icon} />}
                    <span>{item.origin.name}</span>
                  </span>
                ) : (
                  <span>{item.origin.name}</span>
                )
              }
            >
              {childrenItems}
            </Menu.SubMenu>
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
    const { target, name, icon } = item.origin;

    // 没有路径返回图标文字
    if (!itemPath) {
      return (
        <div>
          {icon && <Icon type={icon} />}
          <span>{name}</span>
        </div>
      );
    }
    
    // Is it a http link
    // 是 http 链接
    if (/^https?:\/\//.test(itemPath)) {
      return (
        <a href={itemPath} target={target}>
          {icon && <Icon type={icon} />}
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
        {icon && <Icon type={icon} />}
        <span>{name}</span>
      </Link>
    );
  };

  /**
   * 展开/折叠菜单
   */
  handleChangeOpen = (openKeys) => {
    this.setState({ openKeys });
  }

  render() {
    const { selectedKeys, openKeys, collapsed } = this.props;
    const menuProps = collapsed ? {} : { openKeys: this.state.openKeys || openKeys };

    return (
      <div className={classNames(styles.baseSiderWarp, collapsed ? styles.collapsed : '')}>
        <div className={styles.baseSiderScroll}>
          <div className={styles.siderHeader}>
            <div className={styles.logos}>
              <div className={styles.logoIcon}><img src={PAGE_LOGO_ICON} alt={PAGE_TITLE} /></div>
              <div className={styles.logoText}><img src={PAGE_LOGO_PLANTEXT} alt={PAGE_TITLE} /></div>
            </div>
          </div>
          <div className={styles.siderMenu}>
            <Menu
              theme="dark"
              mode="inline"
              defaultSelectedKeys={selectedKeys}
              inlineCollapsed={collapsed}
              onOpenChange={this.handleChangeOpen}
              { ...menuProps }
            >
              {this.getNavMenuItems(routes.menuTree)}
            </Menu>
          </div>
        </div>
      </div>
    );
  }
}

export default SiderMenu;
