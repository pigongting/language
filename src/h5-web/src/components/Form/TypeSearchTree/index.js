/* 开源-组件 */
import React, { Fragment } from 'react';
import { Tree, Input } from 'antd';
/* 开源-组件 */
import { toArray } from '@/utilities/util';
import { treeify } from '@/utilities/trees';
/* 相对路径-样式 */
import styles from './index.less';

class FormTypeSearchTree extends React.Component {
  
  constructor(props) {
    super(props);

    this.state = {
      selectedKeys: props.value || [],
    };
  }

  componentWillReceiveProps(nextProps) {
    // 合并控制
    this.manualControlExpandedTag = 2;

    // 应该是一个受控组件
    if ('value' in nextProps) {
      this.setState({
        selectedKeys: nextProps.value || [],
      });
    }
  }

  manualControlExpandedTag = 2; // 手动/合并控制展开标记 1 自动控制，2 合并控制

  alreadyExpandedKeys = []; // 已经展开的keys

  // 应该传递一个事件，以将值传递给 Form （默认传递了 onChange 事件）
  // 每一个会影响值的操作都应该触发这个函数
  triggerChange = (changedValue) => {
    if (this.props.onChange) {
      this.props.onChange(Object.assign([], changedValue));
    }
  }

  handleSelect = (selectedKeys, { selected, selectedNodes, node, event }) => {
    // 受控
    this.triggerChange(selectedKeys);

    // 传递参数到组件外
    if (this.props.onSelect) {
      this.props.onSelect(selectedKeys, { selected, selectedNodes, node, event });
    }
  }

  handleExpand = (expandedKeys, {expanded, node}) => {
    // 手动控制
    this.manualControlExpandedTag = 1;
    this.alreadyExpandedKeys = expandedKeys;
    this.setState({ manualExpandedKeys: expandedKeys });
  }

  // 当定义了此函数，onExpand时会调用，当node没有isLeaf或者isLeaf=false时，会显示折叠按钮
  handleLoadData = (loadData, node) => {
    return new Promise((resolve, reject) => {
      // if (node.props.children) { resolve(); return; }
      loadData && loadData(node.props.dataRef.id, resolve, node.props.dataRef);
    });
  }

  // 渲染树节点
  renderTreeNodes = data => {
    return data.map(item => {
      if (item.children) {
        return (
          <Tree.TreeNode
            key={item.value}
            title={item.label}
            selectable={item.selectable}
            dataRef={item}
          >
            {this.renderTreeNodes(item.children)}
          </Tree.TreeNode>
        );
      }
      return <Tree.TreeNode
        key={item.value}
        title={item.label}
        selectable={item.selectable}
        isLeaf={item.isLeaf}
        disabled={item.disabled}
        dataRef={item}
      />;
    });
  }

  // 搜索
  handleSearch = (value) => {
    this.setState({
      searchValue: value,
    });
  }

  // 搜索数据
  searchData = (treeData, searchValue) => {
    if (searchValue === undefined || searchValue === '') {
      return treeData.tree;
    }

    const mapping = {};
    const mappingArr = [];

    for (let key in treeData.mapping) {
      const item = treeData.mapping[key];
      if (~item.label.indexOf(searchValue)) {
        if (mapping[key] === undefined) {
          const copyItem = Object.assign({}, item);
          delete copyItem.children;

          mapping[key] = copyItem;
          mappingArr.push(key);

          if (mapping[item.parentId] === undefined) {
            const parent = treeData.mapping[item.parentId];
            if (parent) {
              const copyParent = Object.assign({}, parent);
              delete copyParent.children;

              mapping[item.parentId] = copyParent;
              mappingArr.push(item.parentId);
            }
          }
        }
      }
    }

    return treeify({ mapping, mappingArr }).tree;
  }

  render() {
    const { selectedKeys, manualExpandedKeys, searchValue } = this.state;
    const { treeData, loadData, expandedKeys } = this.props;

    // 合并控制时执行合并操作
    if (this.manualControlExpandedTag === 2) {
      this.alreadyExpandedKeys = toArray.unique(this.alreadyExpandedKeys.concat(expandedKeys));
    }

    // 当前树数据
    const currentTree = this.searchData(treeData, searchValue);

    return (
      <div className={styles.typeSearch}>
        <div className={styles.searchHeader}>
          <Input.Search size="small" placeholder={'请输入搜索关键字'} autoComplete="off" allowClear onSearch={this.handleSearch} />
        </div>
        <Tree
          onSelect={this.handleSelect}
          selectedKeys={selectedKeys}
          onExpand={this.handleExpand}
          expandedKeys={this.manualControlExpandedTag === 1 ? manualExpandedKeys : this.alreadyExpandedKeys}
          loadData={loadData && this.handleLoadData.bind(this, loadData)}
        >
          {this.renderTreeNodes(currentTree)}
        </Tree>
      </div>
    );
  }
}

export default FormTypeSearchTree;