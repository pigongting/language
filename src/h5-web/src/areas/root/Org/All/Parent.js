/* 开源-组件 */
import React from 'react';
/* 开源-工具 */
/* 自研-组件 */
import ParentTabs from '@/components/ParentTabs';
/* 自研-工具 */
/* 数据 */
import { store, history } from '@/store';
/* 变量(方便使用) */
const { dispatch } = store;

class ParentComponent extends React.Component {

  tabsData = [
    {
      key: '/company',
      tab: '非投诉类',
    },
    {
      key: '/complain',
      tab: '投诉类',
    },
    {
      key: '/dissatisfied',
      tab: '不满意投诉处理',
    },
    {
      key: '/400',
      tab: '集团控股400',
    },
  ]

  handleChangeTabs = (activeKey) => {
    history.replace(this.props.match.url + activeKey);
  }

  getTabActiveKey = () => {
    const { match, location } = this.props;
    return location.pathname.replace(match.path, '');
  }

  render() {
    const { children } = this.props;

    return (
      <ParentTabs
        tabList={this.tabsData}
        tabActiveKey={this.getTabActiveKey()}
        onTabChange={this.handleChangeTabs}
      >
        {children}
      </ParentTabs>
    );
  }
}

export default ParentComponent;
