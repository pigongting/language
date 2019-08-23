/* 开源-组件 */
import React, { Fragment } from 'react';
import { Table } from 'antd';
/* 开源-工具 */
import classNames from 'classnames';
/* 相对路径-样式 */
import styles from './index.less';

class BaseForm extends React.PureComponent {

  render() {
    const { title, desc, actions } = this.props;

    return (
      <div className={styles.baseContentForm}>
        <div className={styles.baseContentFormWarp}>
          <div className={styles.baseContentFormScroll}>
            {this.props.children}
          </div>
        </div>
        <div className={styles.baseContentFooter}>
          <ul>{actions.map((item, index) => <li key={index}>{item}</li>)}</ul>
        </div>
      </div>
    );
  }
}

export default BaseForm;
