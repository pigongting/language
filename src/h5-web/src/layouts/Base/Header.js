/* 开源-组件 */
import React, { Fragment } from 'react';
import { connect } from 'react-redux';
import { Icon, Tooltip, Dropdown, Avatar, Spin, Menu } from 'antd';
/* 数据 */
import { history } from '@/store';
/* 相对路径-样式 */
import styles from './Header.less';

class Header extends React.PureComponent {
  
  handleMenuClick = ({ key }) => {
    if (key === 'workplace') {
      history.push('/dashboard/workplace');
      return;
    }
    if (key === 'logout') {
      history.push('/auth/login');
      return;
    }
  }

  menu = (
    <Menu className={styles.menu} selectedKeys={[]} onClick={this.handleMenuClick}>
      <Menu.Item key="workplace">
        <Icon type="user" />个人中心
      </Menu.Item>
      <Menu.Item disabled>
        <Icon type="setting" />设置
      </Menu.Item>
      <Menu.Divider />
      <Menu.Item key="logout">
        <Icon type="logout" />退出登录
      </Menu.Item>
    </Menu>
  );

  render() {
    const { title, onCollapsed, collapsed } = this.props;
    const { user } = this.props.pagedata;

    return (
      <div className={styles.baseContentHeader}>
        <div className={styles.foldBox} onClick={onCollapsed}>
          <Icon type={collapsed ? 'menu-unfold' : 'menu-fold'} />
        </div>
        <h1>{title}</h1>
        <Tooltip title="使用文档">
          <a href={window.globalConfig.URL_HELP_DOC} target="_blank" rel="noopener noreferrer" className={styles.helpDoc}>
            <Icon type="question-circle-o" />
          </a>
        </Tooltip>
        <Dropdown overlay={this.menu}>
          <div className={styles.userInfo}>
            <div className={styles.avatar}><Avatar size="small" src={user.avatar} /></div>
            <div className={styles.name}>{user.name}</div>
          </div>
        </Dropdown>
      </div>
    );
  }
}

function mapStateToProps(state, ownProps) {
  return {
    pagedata: Object.assign({ ...state['global'] }, {})
  };
}

export default connect(mapStateToProps)(Header);
