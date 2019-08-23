/* 开源-组件 */
import React, { Fragment } from 'react';
import { Tabs } from 'antd';
/* 自研-组件 */
/* 相对路径-样式 */
import styles from './index.less';

class ParentTabs extends React.PureComponent {

  render() {
    const { tabList, tabActiveKey, onTabChange } = this.props;

    return (
      <Fragment>
        <div className={styles.baseContentTabs}>
          <Tabs size="small" activeKey={tabActiveKey} onChange={this.onTabChange}>
            {tabList.map(item => <Tabs.TabPane tab={item.tab} key={item.key} />)}
          </Tabs>
        </div>
        {this.props.children}
      </Fragment>
    );
  }
}

export default ParentTabs;
