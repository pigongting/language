/* 开源-组件 */
import React from 'react';
import { Dropdown, Icon, Menu } from 'antd';
/* 相对路径-样式 */
import styles from './index.less';

class Actions extends React.PureComponent {

  render() {
    const { actions } = this.props;

    if (actions.length <= 2) {
      return (
        <ul className={styles.actionsList}>
          {actions.map((item, index) => <li key={index} className={styles.actionsItem}>{item}</li>)}
        </ul>
      );
    }

    const moreActions = actions.slice(1);
    const menu = (
      <Menu>
        {moreActions.map((item, index) => <Menu.Item key={index} className={styles.actionsMenuItem}>{item}</Menu.Item>)}
      </Menu>
    );

    return (
      <ul className={styles.actionsList}>
        <li className={styles.actionsItem}>{actions[0]}</li>
        <li className={styles.actionsItem}>
          <Dropdown overlay={menu}>
            <span>更多 <Icon type="down" /></span>
          </Dropdown>
        </li>
      </ul>
    );
  }
}

export default Actions;
