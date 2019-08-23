import React from 'react';
import { Tree, Modal, Input, Icon, Row, Col } from 'antd';

import styles from './index.less';

class FormModelSelectedTree extends React.Component {
  
  constructor(props) {
    super(props);

    this.state = {
      visible: false,
      checkedKeys: props.value ? this.real2tree(props.value) : [],
      _checkedKeys: undefined,
    };
  }

  componentWillReceiveProps(nextProps) {
    if (this.props.value !== nextProps.value) {
      this.setState({
        checkedKeys: nextProps.value ? this.real2tree(nextProps.value) : [],
      });
    }
  }

  // 应该传递一个事件，以将值传递给 Form （默认传递了 onChange 事件）
  // 每一个会影响值的操作都应该触发这个函数
  triggerChange = (changedValue) => {
    if (this.props.onChange) {
      this.props.onChange(Object.assign([], changedValue));
    }
  }

  // 渲染树节点
  renderTreeNodes = data => {
    return data.map(item => {
      if (item.children) {
        return (
          <Tree.TreeNode
            key={item.treeKey || item.value}
            title={item.treeTitle || item.label}
            selectable={false}
            disableCheckbox={item.treeDisableCheckbox || item.disableCheckbox}
            dataRef={item}
          >
            {this.renderTreeNodes(item.children)}
          </Tree.TreeNode>
        );
      }
      return (
        <Tree.TreeNode
          key={item.treeKey || item.value}
          title={item.treeTitle || item.label}
          isLeaf={item.treeIsLeaf || item.isLeaf}
          selectable={false}
          disableCheckbox={item.treeDisableCheckbox || item.disableCheckbox}
          disabled={item.treeDisabled || item.disabled}
          dataRef={item}
        />
      );
    });
  }

  // 渲染选中节点
  renderSelectedNodes = () => {
    const { checkedKeys, _checkedKeys } = this.state;
    const { data } = this.props;
    const currentKeys = _checkedKeys || checkedKeys;

    return (
      <ul className={styles.selectedNodes}>
        {currentKeys.map(key => {
          const item = data.mapping[key];
          return (item ? <li key={item.value}>{item.label}</li> : null);
        })}
      </ul>
    );
  }

  // 渲染文本
  renderSelectedText = () => {
    const { checkedKeys } = this.state;
    const { data } = this.props;

    const labels = [];

    checkedKeys.forEach(key => {
      const item = data.mapping[key];
      labels.push(item.label);
    });

    return labels.join('，');
  }

  // 处理鼠标滚动事件
  handleWheel = (e) => {
    e.stopPropagation();
  }

  // 点击输入框，显示对话框
  handleClick = () => {
    this.setState({
      visible: true,
    });
  }

  // 勾选
  handleCheck = (checkedKeys, { checked, checkedNodes, node, event }) => {
    this.setState({
      _checkedKeys: checkedKeys,
    });
  }

  // 取消
  handleCancel = () => {
    this.setState({
      visible: false,
    });
  }

  // 确定
  handleOk = () => {
    const { checkedKeys, _checkedKeys } = this.state;
    const { data, mark } = this.props;
    const currentKeys = _checkedKeys || checkedKeys;

    const realIds = [];

    currentKeys.forEach(key => {
      const item = data.mapping[key];
      if (item.origin.sourceId) {
        if (mark) {
          if (item.origin.source === mark) {
            realIds.push(item.origin.sourceId);
          }
        } else {
          realIds.push(item.origin.sourceId);
        }
      } else {
        realIds.push(item.origin.id);
      }
    });

    this.setState({
      visible: false,
    }, () => {
      this.triggerChange(realIds);
    })
  }

  // 清空
  handleClean = () => {
    this.triggerChange([]);
  }

  // 真实ID转树ID
  real2tree = (realId) => {
    const { data, mark } = this.props;
    const treeKeys = [];

    realId.forEach(id => {
      const item = data.sourceMapping[mark + '_' + id] || data.mapping[mark ? mark + id : id];
      if (item && item.value) {
        treeKeys.push(item.value);
      }
    });

    return treeKeys;
  }

  render() {
    const { visible, checkedKeys, _checkedKeys } = this.state;
    const { title, data } = this.props;

    const modalBodyHeight = document.documentElement.getBoundingClientRect().height - 300;
    const text = this.renderSelectedText();

    return (
      <div onWheel={this.handleWheel}>
        <Input
          placeholder={`请${title}`}
          suffix={text ? <Icon type="close-circle" theme="filled" className="ant-input-clear-icon" onClick={this.handleClean} /> : null}
          onClick={this.handleClick}
          value={text}
        />
        <Modal
          title={title}
          visible={visible}
          onOk={this.handleOk}
          onCancel={this.handleCancel}
          bodyStyle={{ height: modalBodyHeight }}
          className={styles.treeModal}
        >
          <Row>
            <Col span={12}>
              <Tree
                checkable
                onCheck={this.handleCheck}
                checkedKeys={_checkedKeys || checkedKeys}
              >
                {this.renderTreeNodes(data.tree)}
              </Tree>
            </Col>
            <Col span={12}>
              {this.renderSelectedNodes()}
            </Col>
          </Row>
        </Modal>
      </div>
    );
  }
}

export default FormModelSelectedTree;