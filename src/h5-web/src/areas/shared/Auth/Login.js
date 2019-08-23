/* 开源-组件 */
import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Form, Tabs, Button, Input, Alert, Icon } from 'antd';
/* 开源-工具 */
import classNames from 'classnames';
/* 自研-工具 */
import { COOKIE_SEC_TOKEN, SYS_CSL_MST_MENU, SYS_LOGIN_USER, SEC_ORG_FRAME } from '@/Constant';
import { getRoutes } from '@/router/routes';
/* 自研-组件 */
/* 数据 */
import { store, history, addAsyncModel } from '@/store';
import { namespacePrefix, Login } from './Model';
/* 相对路径-样式 */
import styles from './Login.less';
/* 相对路径-组件 */
/* 异步数据模型 */
addAsyncModel(Login);
/* 命名空间(全局唯一) */
const namespace = `${namespacePrefix}Login`;
/* 变量(方便使用) */
const FormItem = Form.Item;
const { TabPane } = Tabs;

class SharedUserLogin extends Component {

  state = {
    type: 'account',
    showMessage: false,
  };

  componentDidMount() {
    // 清除菜单
    localStorage.removeItem(SYS_CSL_MST_MENU);
    localStorage.removeItem(SYS_LOGIN_USER);
    localStorage.removeItem(SEC_ORG_FRAME);
    // 第二次更新路由
    getRoutes();
    // 清除 cookie
    document.cookie = `${COOKIE_SEC_TOKEN}=0;expires=${new Date(0).toUTCString()}`;
  }

  componentWillReceiveProps(nextProps) {
    const { login } = nextProps.pagedata;
    if (this.props.pagedata.login !== login) {
      if (login && login.code !== 0) {
        this.setState({
          showMessage: true,
        });
      }
    }
  }

  handleSubmit = (e) => {
    e.preventDefault();
    // TODO：看看这个的区别
    // this.props.form.validateFields(activeFileds, { force: true }, (err, values) => {
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) {
        this.props.handleLogin(values, this.state.type);
      }
    });
  };

  renderMessage = () => {
    if (this.state.showMessage) {
      const { login } = this.props.pagedata;
      return <Alert style={{ marginBottom: 24 }} message={login.message} type="error" showIcon />;
    }
    return null;
  };

  onChange = e => {
    this.setState({
      showMessage: false,
    });
  }

  render() {
    const { getFieldDecorator } = this.props.form;
    const { type } = this.state;

    return (
      <div className={styles.main}>
        <div className={classNames(styles.login)}>
          <Form onSubmit={this.handleSubmit}>
            <Tabs
              animated={false}
              className={styles.tabs}
              activeKey={type}
              onChange={this.onSwitch}
            >
              <TabPane tab="账户密码登录" key="account">
                {this.renderMessage()}
                <FormItem>
                  {getFieldDecorator('account', {
                    initialValue: '',
                    rules: [{ required: true, message: '请输入账户！' }],
                  })(<Input
                    size="large"
                    prefix={<Icon type="user" className={styles.prefixIcon} />}
                    placeholder="请输入账户"
                    onChange={this.onChange}
                  />)}
                </FormItem>
                <FormItem>
                  {getFieldDecorator('password', {
                    initialValue: '',
                    rules: [{ required: true, message: '请输入密码！' }],
                  })(<Input
                    type="password"
                    size="large"
                    prefix={<Icon type="lock" className={styles.prefixIcon} />}
                    placeholder="请输入密码"
                    onChange={this.onChange}
                    autoComplete="new-password"
                  />)}
                </FormItem>
              </TabPane>
            </Tabs>
            <FormItem>
              <Button size="large" className={styles.submit} type="primary" htmlType="submit" loading={this.props.loading.effects[`${namespace}/login`]}>登录</Button>
            </FormItem>
          </Form>
        </div>
      </div>
    );
  }
}

function mapStateToProps(state, ownProps) {
  return {
    pagedata: state[namespace],
    loading: state.loading,
  };
}

function mapDispatchToProps(dispatch, ownProps) {
  return {
    handleLogin: (values, type) => {
      dispatch({
        type: `${namespace}/login`,
        payload: {
          ...values,
          type,
        },
      });
    },
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(Form.create()(SharedUserLogin));
