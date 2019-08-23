/* 开源-组件 */
import React, { Fragment } from 'react';
import { connect } from 'react-redux';
import { Avatar } from 'antd';
/* 开源-工具 */
/* 自研-组件 */
/* 自研-工具 */
/* 数据 */
import { store, history, addAsyncModel } from '@/store';
import { namespacePrefix, Workplace } from './Model';
/* 相对路径-样式 */
import styles from './Workplace.less';
/* 异步数据模型 */
addAsyncModel(Workplace);
/* 命名空间(全局唯一) */
const namespace = `${namespacePrefix}Workplace`;
/* 变量(方便使用) */
const { dispatch } = store;

class WorkplaceComponent extends React.Component {

  componentDidMount() {
  }

  render() {
    const { user } = this.props.pagedata.global;

    return (
      <div className={styles.scrollBox}>
        <div className={styles.header}>
          <div className={styles.userAvatar}>
            <Avatar size={72} src={user.avatar} />
          </div>
          <div className={styles.userInfo}>
            <div className={styles.welcome}>{user.name}，祝你开心每一天！</div>
            <div className={styles.position}>{user.postion}</div>
          </div>
        </div>
        <div className={styles.content}></div>
      </div>
    );
  }
}

function mapStateToProps(state, ownProps) {
  return {
    pagedata: Object.assign({ global: { ...state['global'] } }, { ...state[namespace] }, {
      loading: {
        rGetAll: state.loading.effects[`${namespace}/rGetAll`],
      }
    })
  };
}

export default connect(mapStateToProps)(WorkplaceComponent);
