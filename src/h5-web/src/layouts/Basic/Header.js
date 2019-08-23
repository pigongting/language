import { SYS_LOGIN_USER } from '@/Constant';

import React, { PureComponent } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

import classNames from 'classnames';
import moment from 'moment';
import groupBy from 'lodash/groupBy';
import Debounce from 'lodash/debounce';

import { Menu, Icon, Spin, Tag, Dropdown, Avatar, Divider, Tooltip, message } from 'antd';

import { history } from '@/store';

import NoticeIcon from '@/components/NoticeIcon';
import HeaderSearch from '@/components/HeaderSearch';

import { PAGE_LOGO } from '@/Constant';

import styles from './Header.less';

class GlobalHeader extends PureComponent {
  componentDidMount() {
    // this.props.handleFetchUser();
  }

  componentWillUnmount() {
    // 清除 resize 事件定时器
    this.triggerResizeEvent.cancel();
  }
  
  // 切换侧边栏折叠状态
  toggle = () => {
    this.props.onCollapse(!this.props.collapsed);
    this.triggerResizeEvent();
  };
  
  // 触发 resize 事件
  triggerResizeEvent = Debounce(() => {
    const event = document.createEvent('HTMLEvents');
    event.initEvent('resize', true, false);
    window.dispatchEvent(event);
  }, 600);

  // 获取通知信息
  getNoticeData() {
    const { notices = [] } = this.props;
    if (notices.length === 0) {
      return {};
    }
    const newNotices = notices.map(notice => {
      const newNotice = { ...notice };
      if (newNotice.datetime) {
        newNotice.datetime = moment(notice.datetime).fromNow();
      }
      // transform id to item key
      if (newNotice.id) {
        newNotice.key = newNotice.id;
      }
      if (newNotice.extra && newNotice.status) {
        const color = {
          todo: '',
          processing: 'blue',
          urgent: 'red',
          doing: 'gold',
        }[newNotice.status];
        newNotice.extra = (
          <Tag color={color} style={{ marginRight: 0 }}>
            {newNotice.extra}
          </Tag>
        );
      }
      return newNotice;
    });
    return groupBy(newNotices, 'type');
  }

  render() {
    const {
      currentUser = {},
    } = this.props;

    const noticeData = this.getNoticeData();
    
    const menu = (
      <Menu className={styles.menu} selectedKeys={[]} onClick={this.props.handleMenuClick}>
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

    return (
      <div className={styles.header}>
        {this.props.isMobile && [
          <Link to="/" className={styles.logo} key="logo">
            <img src={PAGE_LOGO} alt="logo" width="32" />
          </Link>,
          <Divider type="vertical" key="line" />,
        ]}
        <Icon
          className={styles.trigger}
          type={this.props.collapsed ? 'menu-unfold' : 'menu-fold'}
          onClick={this.toggle}
        />
        <div className={styles.right}>
          {/*<HeaderSearch
            className={classNames(styles.action, styles.search)}
            placeholder="站内搜索"
            dataSource={['搜索提示一', '搜索提示二', '搜索提示三']}
            onSearch={value => {
              console.log('input', value); // eslint-disable-line
            }}
            onPressEnter={value => {
              console.log('enter', value); // eslint-disable-line
            }}
          />*/}
          <Tooltip title="使用文档">
            <a
              target="_blank"
              href="http://app.jzywy.com:7012/manual/pim/index.html"
              rel="noopener noreferrer"
              className={styles.action}
            >
              <Icon type="question-circle-o" />
            </a>
          </Tooltip>
          {/*<NoticeIcon
            className={styles.action}
            count={currentUser.notifyCount}
            onItemClick={(item, tabProps) => {
              console.log(item, tabProps); // eslint-disable-line
            }}
            onClear={this.props.handleNoticeClear}
            onPopupVisibleChange={this.props.handleFetchNotices}
            loading={true}
            popupAlign={{ offset: [20, -16] }}
          >
            <NoticeIcon.Tab
              list={noticeData['通知']}
              title="通知"
              emptyText="你已查看所有通知"
              emptyImage="https://gw.alipayobjects.com/zos/rmsportal/wAhyIChODzsoKIOBHcBk.svg"
            />
            <NoticeIcon.Tab
              list={noticeData['消息']}
              title="消息"
              emptyText="您已读完所有消息"
              emptyImage="https://gw.alipayobjects.com/zos/rmsportal/sAuJeJzSKbUmHfBQRzmZ.svg"
            />
            <NoticeIcon.Tab
              list={noticeData['待办']}
              title="待办"
              emptyText="你已完成所有待办"
              emptyImage="https://gw.alipayobjects.com/zos/rmsportal/HsIsxMZiWKrNUavQUXqx.svg"
            />
          </NoticeIcon>*/}
          {currentUser && currentUser.trueName ? (
            <Dropdown overlay={menu}>
              <span className={classNames(styles.action, styles.account)}>
                <Avatar size="small" className={styles.avatar} src={currentUser.avatar} />
                <span className={styles.name}>{currentUser.trueName}</span>
              </span>
            </Dropdown>
          ) : (
            <Spin size="small" style={{ marginLeft: 8 }} />
          )}
        </div>
      </div>
    );
  }
}

function mapStateToProps(state, ownProps) {
  let user = {};
  try {
    user = JSON.parse(localStorage.getItem(SYS_LOGIN_USER));
    if (user) {
      user.avatar = require('@/cdn/media/image/background/user.png');
    }
  } catch (e) {
    console.log(e);
  }

  return {
    currentUser: user || {},
  };
}

function mapDispatchToProps(dispatch, ownProps) {
  return {
    handleFetchUser: () => {
      dispatch({
        type: 'user/fetchCurrent',
      });
    },
    handleMenuClick: ({ key }) => {
      if (key === 'workplace') {
        history.push('/dashboard/workplace');
        return;
      }
      if (key === 'logout') {
        history.push('/auth/login');
        return;
      }
    },
    handleFetchNotices: (visible) => {
      if (visible) {
        dispatch({
          type: 'global/fetchNotices',
        });
      }
    },
    handleNoticeClear: (type) => {
      message.success(`清空了${type}`);
      this.props.dispatch({
        type: 'global/clearNotices',
        payload: type,
      });
    },
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(GlobalHeader);