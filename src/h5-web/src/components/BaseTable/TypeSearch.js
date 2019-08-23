/* 开源-组件 */
import React, { Fragment } from 'react';
/* 开源-工具 */
import classNames from 'classnames';
/* 相对路径-样式 */
import styles from './TypeSearch.less';

class TypeSearch extends React.PureComponent {

  render() {
    const { component, folded } = this.props;

    return (
      <Fragment>
        <div className={classNames(styles.baseContentTreeWarp, folded ? styles.folded : '')}>
          <div className={styles.baseContentTreeScroll}>
            {component}
          </div>
        </div>
        {this.props.children}
      </Fragment>
    );
  }
}

export default TypeSearch;
