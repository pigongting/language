import React from 'react';
import { Link } from 'react-router-dom';

import ContentHeader from './Header';

import styles from './index.less';

export default ({ children, wrapperClassName, top, ...restProps }) => {
  return (
  
  <div style={{ margin: '-24px -24px 0' }} className={wrapperClassName}>
    {top}
    <ContentHeader key="contentheader" {...restProps} linkElement={Link} />
    {children ? <div className={styles.content}>{children}</div> : null}
  </div>
)
};
