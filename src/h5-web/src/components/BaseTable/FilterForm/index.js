/* 开源-组件 */
import React from 'react';
import { connect } from 'react-redux';
import { Row, Col, Button, Icon, Input, Spin, Form } from 'antd';
/* 开源-工具 */
import classNames from 'classnames';
/* 自研-组件 */
/* 相对路径-样式 */
import styles from './index.less';

class FilterForm extends React.PureComponent {
  
  state = {
    advancedMode: false
  }
  /*
  componentWillReceiveProps(nextProps) {
    const { loading: loadingNew } = nextProps;
    const { loading: loadingOld } = this.props;

    if (loadingNew !== loadingOld && loadingNew === true) {
      this.handleToggleAdvancedMode(false);
    }
  }
  */
  // 生成搜索项
  generateFilters = (filters) => {
    return filters.map((filter, index) => {
      return (
        <Col md={12} sm={24} key={index}>
          <Form.Item label={filter.label}>{filter.render}</Form.Item>
        </Col>
      );
    });
  }

  // 生成操作按钮
  generateOperations = (operations) => {
    return operations.map((operation, index) => {
      return (
        <li key={index}>{operation}</li>
      );
    });
  }

  // 切换高级模式
  handleToggleAdvancedMode = (mode) => {
    this.setState({ advancedMode: mode === false ? mode : !this.state.advancedMode });
  }

  render() {
    const { advancedMode } = this.state;
    const { loading, folded, states, filter, filters, operations, onReset, onFold } = this.props;

    return (
      <div className={styles.baseContentOperation}>
        <div className={styles.operationBar}>
          {folded !== undefined && <div className={styles.baseContentTreeFold} onClick={onFold}><Icon type={folded ? 'right' : 'left'} /></div>}
          {states}
          <div className={styles.loading}>{loading && <Spin size="small" />}</div>
          <ul className={styles.operationButtons}>{this.generateOperations(operations)}</ul>
          <div className={styles.sampleSearch}>
            {filter}
            <Button size="small" onClick={this.handleToggleAdvancedMode}>高级搜索</Button>
          </div>
        </div>
        <div className={classNames(styles.advancedSearch, advancedMode && styles.advancedSearchShow)}>
          <div className={styles.searchTitle}><Icon type="search" /><span>高级搜索</span></div>
          <div className={styles.searchList}><Row>{this.generateFilters(filters)}</Row></div>
          <ul className={styles.searchButtons}>
            <li><Button size="small" type="primary" htmlType="submit">搜索</Button></li>
            <li><Button size="small" onClick={onReset}>重置</Button></li>
            <li><Button size="small" onClick={this.handleToggleAdvancedMode}>收起</Button></li>
          </ul>
        </div>
      </div>
    );
  }
}

function mapStateToProps(state, ownProps) {
  return {
    loading: state.loading.global,
  };
}

export default connect(mapStateToProps)(FilterForm);
