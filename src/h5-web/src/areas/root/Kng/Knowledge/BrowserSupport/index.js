import React from 'react';
import { Table, Select } from 'antd';
import { toNumber } from '@/utilities/util';

import styles from './index.less';

class FormBrowserSupport extends React.Component {
  
  constructor(props) {
    super(props);

    this.state = {
      value: props.value || [],
    };
  }

  componentWillReceiveProps(nextProps) {
    if (this.props.value !== nextProps.value) {
      this.setState({
        value: nextProps.value || [],
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

  // 下拉选择变化
  handleChange (index, key, value, option) {
    const newValue = [ ...this.state.value ];   
    newValue[index][key] = value;
    this.triggerChange(newValue);
  }

  generatorColumns = (data) => {
    return data.map(item => {
      return {
        title: item.label,
        key: item.value,
        children: item.children ? item.children.map(bitem => {
          return {
            title: bitem.label,
            dataIndex: String(toNumber.string(bitem.value)),
            render: (text, record, index) => {
              if (item.label === '-') {
                return text;
              } else {
                return (
                  <Select
                    size="small"
                    value={text}
                    onChange={this.handleChange.bind(this, index, String(toNumber.string(bitem.value)))}
                    dropdownMatchSelectWidth={false}
                    style={{ minWidth: '52px' }}
                    allowClear
                  >
                    {bitem.children.map((bvitem, index) => <Select.Option key={index} value={Number(bvitem.value)}>{bvitem.label}</Select.Option>)}
                  </Select>
                );
              }
            }
          };
        }) : null,
      };
    });
  }

  render() {
    const { value } = this.state;
    const { columnSource } = this.props;
    const columns = this.generatorColumns(columnSource.tree);

    return (
      <div className={styles.tableWarp}>
        <div className={styles.tableBox}>
          <Table
            rowKey="0"
            columns={columns}
            dataSource={value}
            bordered
            size="middle"
            pagination={false}
          />
        </div>
      </div>
    );
  }
}

export default FormBrowserSupport;