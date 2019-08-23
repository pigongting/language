/* 开源-组件 */
import React, { Fragment } from 'react';
/* 自研-工具 */
import { history } from '@/store';
/* 相对路径-样式 */
import styles from './index.less';

class StateBar extends React.PureComponent {
  constructor(props) {
    super(props);

    this.state = {
      value: props.value || '0',
    };
  }

  // 应该是一个受控组件
  componentWillReceiveProps(nextProps) {
    const { value: valueNew } = nextProps;
    const { value: valueOld } = this.props;

    if (valueNew !== valueOld) {
      this.setState({
        value: valueNew,
      });
    }
  }

  // 每一个会影响值的操作都应该触发这个函数
  // 应该传递一个事件，以将值传递给 Form （默认传递了 onChange 事件）
  triggerChange = (changedValue) => {
    const onChange = this.props.onChange;
  
    if (onChange) {
      onChange(changedValue);
    }
  }

  // 改变状态
  handleChangeState = (key) => {
    this.triggerChange(key);
    this.props.onChangeSatae(key);
  }

  render() {
    const { value } = this.state;
    const { data } = this.props;

    return (
      <ul className={styles.filterState}>
        {Object.keys(data).map((key, index) => {
          return (
            <Fragment key={key}>
              {index > 0 && <li className={styles.divide} />}
              <li
                className={(key === value) ? styles.currentState : undefined}
                onClick={this.handleChangeState.bind(this, key)}
              >
                {data[key]}
              </li>
            </Fragment>
          );
        })}
      </ul>
    );
  }
}

export default StateBar;
