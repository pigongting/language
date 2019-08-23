// import registerServiceWorker from '@/registerServiceWorker';
import 'url-polyfill';

import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { Router, Route, Switch } from 'react-router-dom';

import { LocaleProvider } from 'antd';
import zh_CN from 'antd/components/locale-provider/zh_CN';
import 'moment/locale/zh-cn';

import { store, history, addAsyncModel } from '@/store';

import BaseLayout from '@/layouts/Base';
import UserLayout from '@/layouts/User';

import global from '@/areas/shared/Global/global';

addAsyncModel(global);

class Index extends Component {
  render() {
    return (
      <Provider store={store}>
        <LocaleProvider locale={zh_CN}>
          <Router history={history}>
            <Switch>
              <Route path="/auth" component={UserLayout} />
              <Route path="/" component={BaseLayout} />
            </Switch>
          </Router>
        </LocaleProvider>
      </Provider>
    );
  }
}

ReactDOM.render(<Index />, document.getElementById('root'));
// registerServiceWorker();
