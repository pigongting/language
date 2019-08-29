import React from 'react';
import { Cascader, Button } from 'antd';
import { form2search, search2form } from '@/utilities/util';

import styles from './index.less';

class FormMultipleCascader extends React.Component {
  
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
  handleChange (index, value, selectedOptions) {
    const newValue = [ ...this.state.value ];
    const last = value[value.length - 1];
    newValue[index] = last === undefined ? undefined : Number(last);
    this.triggerChange(newValue);
  }

  // 插入一条
  handleAppend () {
    this.triggerChange([ ...this.state.value, undefined]);
  }

  // 移除一条
  handleRemove (index) {
    const newValue = [ ...this.state.value.filter((item, i) => i !== index) ];
    this.triggerChange(newValue.length === 0 ? [undefined] : newValue);
  }

  render() {
    const { value } = this.state;
    const { data, placeholder } = this.props;

    // 保证一定有一条
    if (value.length === 0) { value.push(undefined); }

    return (
      <div className={styles.cascaderWarp}>
        {value.map((item, index) => {
          return (
            <div key={index} className={styles.cascaderBox}>
              <Cascader
                size="small"
                value={search2form.cascader(data.mapping, { id: item })}
                options={data.tree}
                placeholder={placeholder}
                onChange={this.handleChange.bind(this, index)}
              />
              <Button icon="minus" size="small" onClick={this.handleRemove.bind(this, index)} />
            </div>
          );
        })}
        <Button icon="plus" size="small" onClick={this.handleAppend.bind(this)} />
      </div>
    );
  }
}

export default FormMultipleCascader;