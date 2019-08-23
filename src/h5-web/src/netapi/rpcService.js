import fetch from 'isomorphic-fetch';

// 伪造返回结果
function ErrorJsonResult(error) {
  return {
    code: -999,
    message: error,
    data: ''
  };
};

function request(options) {
  return fetch(options.url, {
    // 必须和 header 的 'Content-Type' 匹配
    body: options.data,
    // *default, no-cache, reload, force-cache, only-if-cached
    cache: 'no-cache',
    // include, same-origin, *omit
    credentials: 'include',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=utf-8'
    },
    // *GET, POST, PUT, DELETE, etc.
    method: options.method,
    // no-cors, cors, *same-origin
    // mode: 'no-cors',
    // manual, *follow, error
    redirect: 'follow',
    // *client, no-referrer
    referrer: 'no-referrer',
  })
  .then(response => {
    // console.log(response);

    if (response.ok === true) {
      return response.json();
    } else if (response.status === 403) {
      console.log('没有权限: ' + options.url);
      // 弹窗登录
      return ErrorJsonResult('没有权限');
    } else if (response.status === 404) {
      // console.log('地址错误: ' + options.url);
      return ErrorJsonResult('地址错误');
    } else if (response.status === 500) {
      // console.log('服务错误: ' + options.url);
      return ErrorJsonResult('服务错误');
    } else {
      // console.log('其他错误: ' + options.url);
      return ErrorJsonResult('其他错误');
    }
  })
  .catch(error => {
    // console.log('网络故障时或请求被阻止: ' + options.url);
    return ErrorJsonResult('网络故障时或请求被阻止');
  })
}

const rpcService = {
  rGet: (url, extend) => {
    return request(Object.assign({ url }, extend, { method: 'GET' }));
  },
  rPost: (url, data) => {
    return request(Object.assign({ url }, { method: 'POST', data: JSON.stringify(data) }));
  },
  rPut: (url, data) => {
    return request(Object.assign({ url }, { method: 'PUT', data: JSON.stringify(data) }));
  },
  rDelete: (url, data) => {
    return request(Object.assign({ url }, { method: 'DELETE' }));
  }
};

export default rpcService;