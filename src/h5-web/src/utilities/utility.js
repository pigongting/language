import clone from 'clone';
import cookie from 'cookie';
import moment from 'moment';
import queryString from 'query-string';

import window from 'global/window';

import { store, history, addAsyncModel } from '@/store';

import { COOKIE_SEC_TOKEN, DEFAULT_EMPTY_TIME } from '@/Constant';

/**
 * 测试属性是否匹配
 */
export function testPropTypes (value, type, dev) {
  const sEnums = ['number', 'string', 'boolean', 'undefined', 'function']; // NaN
  const oEnums = ['Null', 'Object', 'Array', 'Date', 'RegExp', 'Error'];
  const nEnums = ['[object Number]', '[object String]', '[object Boolean]', '[object Undefined]', '[object Function]', '[object Null]', '[object Object]', '[object Array]', '[object Date]', '[object RegExp]', '[object Error]'];
  const reg = new RegExp('\\[object (.*?)\\]');

  // 完全匹配模式，type应该传递类似格式[object Window] [object HTMLDocument] ...
  if (reg.test(type)) {
    // 排除nEnums的12种
    if (~nEnums.indexOf(type)) {
      if (dev === true) {
        console.warn(value, 'The parameter type belongs to one of 12 types：number string boolean undefined Null Object Array Date RegExp function Error NaN');
      }
    }

    if (Object.prototype.toString.call(value) === type) {
      return true;
    }

    return false;
  }

  // 检测到的类型
  let t = typeof value;

  // 可以通过 typeof 判断的，检测到的类型存在于枚举
  if (~sEnums.indexOf(t)) {
    // 区分特殊值NaN
    if (t === 'number' && isNaN(value)) {
      t = 'NaN';
    }
    // 传递的类型和检测到的类型匹配
    if (t === type) {
      return true;
    }
    return false;
  } else {
    // 需要通过 Object.prototype.toString.call() 判断的
    const o = Object.prototype.toString.call(value);
    // 本来o的值格式是[object Object]，通过正则后值的格式是Object
    const r = new RegExp('\\[object (.*?)\\]');
    const so = o.replace(r, '$1');

    // 检测到的类型存在于枚举，传递的类型和检测到的类型匹配
    if (~oEnums.indexOf(so) && so === type) {
      return true;
    }
    return false;
  }
}

/**
 * 参数类型检测
 */
export function checkPropTypes (arr, dev) {
  // 一维数组拆分为二维数组
  const multArr = [];
  for (let i = 0; i < arr.length; i++) {
    if (i % 2 === 0) {
      multArr.push(arr.slice(i, i + 2));
    }
  }

  // 两层循环验证
  for (let n = 0; n < multArr.length; n++) {
    const v = multArr[n][0];
    const vArr = multArr[n][1];

    // 如果vArr中包含v，表示验证通过，否则要验证类型
    if (~vArr.indexOf(v)) { continue; }

    // 验证类型
    let exist = false;
    for (let m = 0; m < vArr.length; m++) {
      if (testPropTypes(v, vArr[m], dev)) {
        exist = true;
        break;
      }
    }
    // 数组中的类型和值的类型都不匹配，则报错
    if (exist === false) {
      if (dev === true) {
        console.error(v, `Error: index ${n} is of the wrong type`);
      }
    }
  }
}

/**
 * 测试可能值
 */
export function testPossibility (inputList, callback, obj) {
  /** inputList
    [
      [undefined, true, {}],
      [undefined, true],
      [1, 2, 3]
    ]
   */
  // 第一维数组的长度
  const n = inputList.length;

  // 组合
  const combination = [];
  for (let i = 0; i < n; i++) {
    combination.push(0);
  }
  // 此时的组合的格式为：[0,0,0]
  // 对combination的修改，目标是改成类似 [0,0,1] [0,0,2] [0,1,0] [0,1,1] [0,1,2] [1,0,0] [1,0,1] [1,0,2] [1,1,0] ...

  // 用于使组合的最后一个元素的值不为0，使得循环继续
  let i = 0;

  // 标识循环是否继续，默认不继续
  let isContinue = false;

  // 至少执行一次
  do {
    // 每次拿到参数数组都要循环第一维数组的长度
    const paramsArr = [];
    for (let j = 0; j < n; j++) {
      // 拿到第几个第二维数组的第几个元素
      paramsArr.push(inputList[j][combination[j]]);
    }
    // apply反向调用待测试函数
    callback.apply(obj || null, paramsArr);

    // 核心部分，对combination的修改
    i++;

    // 组合的最后一个元素的值
    combination[n - 1] = i;

    for (let j = n - 1; j >= 0; j--) {
      // 如果组合的第几个值已经和第几个第二维数组的长度相等了，表示这个第二维数组的值取完了，要归0
      if (combination[j] >= inputList[j].length) {

        combination[j] = 0;

        i = 0;

        // 如果j!=0，即不是第一个第二维数组，前一位加1
        if (j - 1 >= 0) {
          combination[j - 1] = combination[j - 1] + 1;
        }
      }
    }

    // 结束循环
    isContinue = false;

    // 当组合数组的元素有一个不是0的时候，继续循环
    for (let key in combination) {
      if (combination[key] !== 0) {
        isContinue = true;
      }
    }
  } while (isContinue);
}

/**
 * 对象检测
 */
export const checkObject = {
  isEmpty: (obj) => {
    try {
      const json = JSON.stringify(obj);
      if (json === '{}') {
        return true;
      }

      return false;

    } catch (ex) {
      console.log(ex);
      return false;
    }
  },
  isRequestParams: (obj, dev) => {
    // 特殊值
    const sv = [undefined];
    // 正常值
    const vv = ['number', 'string'];

    let result = false;

    for (let key in obj) {
      const value = obj[key];

      // 可以是特殊值
      if (~sv.indexOf(value)) {
        continue;
      }

      const type = typeof value;

      // 可以是正常值，以及NaN
      if (~vv.indexOf(type)) {
        // 不能是 NaN
        if (type === 'number' && isNaN(value)) {
          result = key;
          break;
        }

        continue;
      }

      // 不能是 {}, [], function () {}, new Date(), new RegExp(), new Error()，以及其它类型
      result = key;
      break;
    }

    if (result !== false) {
      if (dev === true) {
        console.error(`Error: ${result} must be [ undefined, number, string ]`);
      }
      return false;
    }

    return true;
  },
  isOneLevel: (obj, dev) => {
    // 特殊值
    const sv = [null, undefined];
    // 正常值
    const vv = ['number', 'string', 'boolean'];

    let result = false;

    for (let key in obj) {
      const value = obj[key];

      // 可以是特殊值
      if (~sv.indexOf(value)) {
        continue;
      }

      const type = typeof value;

      // 可以是正常值，以及NaN
      if (~vv.indexOf(type)) {
        if (type === 'number' && isNaN(value)) {
          continue;
        }

        continue;
      }

      // 不能是 {}, [], function () {}, new Date(), new RegExp(), new Error()，以及其它类型
      result = key;
      break;
    }

    if (result !== false) {
      if (dev === true) {
        console.error(`Error: ${result} must be [ null, undefined, true, number, string, NaN ]`);
      }
      return false;
    }

    return true;
  }
};

/**
 * 操作 URL 转换
 */
export function urlToList(url) {
  const urllist = url.split('/').filter(i => i);
  return urllist.map((urlItem, index) => {
    return `/${urllist.slice(0, index + 1).join('/')}`;
  });
}







// 显示与数组匹配的多个值
export function displayMultipleValues(params) {
  const { arr, ids, key, name, join } = params;

  const obj = arr.reduce((nodes, node) => {
    nodes[node[key]] = node;
    return nodes;
  }, {});

  const nameArr = [];
  ids.forEach(item => {
    if (obj[item]) {
      nameArr.push(obj[item][name]);
    }
  });

  if (join) {
    return nameArr.join(join);
  }

  return nameArr;
}

// 比对一维数组元素是否完全相同
export function isnotSameArray(origin, targert) {
  // 异常
  if (!origin && !targert) {
    return false;
  }
  if (!origin) {
    return true;
  }
  if (!targert) {
    return true;
  }

  let rOrigin = origin;
  let rTargert = targert;

  // 数组内容是 { key: '1' } 格式的对象
  if (origin.length > 0 && origin[0].key) {
    rOrigin = origin.map(item => item.key);
  }

  if (targert.length > 0 && targert[0].key) {
    rTargert = targert.map(item => item.key);
  }

  // 正常
  return (rOrigin.sort().join() !== rTargert.sort().join());
}

// 判断行政区划是否是最后一级
export function adminAreaIsLeaf(code) {
  return (/[1|2|3|4|5|6|7|8|9]/.test(code.substr(-7, 7)));
}

// 根据数组，获取指定字段作为键名的对象
export function getKeyObject(arr, key) {
  return arr.reduce((nodes, node) => {
    nodes[node[key]] = node;
    return nodes;
  }, {});
}

// 根据数组，获取指定字段的值不重复的数组
export function uniqueValueArray(arr, parent, key) {
  const keyArr = [];
  
  const parentArr = arr.reduce((nodes, node) => {
    const value = String(node[parent]);

    if(!nodes.includes(value)) {
      nodes.push(value);

      if (key) {
        const curkey = String(node[key]);
        let parentKey = curkey;

        if (/\|/.test(curkey)) {
          parentKey = curkey.substring(0, curkey.lastIndexOf('|'));
        }

        keyArr.push(String(parentKey));
      }
    }

    return nodes;
  }, []);

  return key ? keyArr : parentArr;
}

// 数组去重
// Array Removal Repetition Value 
export function arrayRRV(arr) {
  const json = {};
  const result = [];
  for (var i = 0; i < arr.length; i++) {
    const value = arr[i];
    if (json[value]) { continue; }
    result.push(value);
    json[value] = 1;
  }
  return result;
}

// 将数组按照指定长度拆分
export function sliceArrayByLength(arr, length) {
  let newArr = [];
  for (let i = 0; i < arr.length; i += length) {
    newArr.push(arr.slice(i, i + length));
  }
  return newArr;
}

// 生成树
export function generateTree(data, key, parentId) {
  if (!data || data.length === 0) {
    return [];
  }

  const cloneData = clone(data);
  const root = {};

  // 建立 ID 到节点数据的映射表
  const map = cloneData.reduce((nodes, node) => {
    nodes[node[key]] = node;
    return nodes;
  }, {});

  // 通过映射表查找 parentId，找到父节点，建立树结构
  cloneData.forEach(node => {
    const parent = (node[key] !== String(node[parentId])) ? (map[node[parentId]] || root) : root;
    const children = parent.children = parent.children || [];
    children.push(node);
  });

  return root.children;

  // 方式1
  // const tree = [];

  // 递归
  // function loop(item, arr, parentId) {
  //   arr.forEach((s, i) => {
  //     if (s.parentId === parentId) {
  //       s.children = [];
  //       loop(s.children, menuMetaData, s.id);
  //       item.push(s);
  //     }
  //   })
  // }

  // 执行递归
  // loop(tree, menuMetaData, 1);
}

// 格式转换
export function formatTransform(param) {
  const { origin, settings } = param;
  Object.keys(settings).forEach((skey) => {
    const fields = settings[skey];
    switch (skey) {
      case 'string2int':
        fields.forEach((key) => {
          origin[key] = origin[key] ? Number(origin[key]) : undefined;
        });
        break;
      case 'int2string':
        fields.forEach((key) => {
          origin[key] = origin[key] ? String(origin[key]) : undefined;
        });
        break;
      case 'string2int4key':
        fields.forEach((key) => {
          const m = origin[key];
          if (m && (m.length > 0)) {
            origin[key] = [];
            m.forEach((item, index) => {
              origin[key][index] = {
                ...item,
                key: Number(item.key),
              };
            });
          }
        });
        break;
      case 'int2string4key':
        fields.forEach((key) => {
          const m = origin[key];
          if (m && (m.length > 0)) {
            m.forEach((item, index) => {
              
              Object.keys(item).forEach(s => {
                if ((typeof item[s] === 'number') && (item[s] === 0)) {
                  item[s] = undefined;
                } else if ((typeof item[s] === 'string') && (item[s] === '')) {
                  item[s] = undefined;
                }
              });
              
              origin[key][index] = {
                ...item,
                key: String(item.key),
              };
            });
          }
        });
        break;
      case 'upload2server':
        fields.forEach((key) => {
          const files = origin[key];
          if (files && (files.length > 0)) {
            origin[key] = [];
            files.forEach((file, index) => {
              origin[key][index] = {
                id: origin.id || 0,
                url: file.url,
              };
            })
          }
        });
        break;
      case 'server2upload':
        fields.forEach((key) => {
          const files = origin[key];
          if (files && (files.length > 0) && (typeof files[0].url === 'string')) {
            files.forEach((file, index) => {
              const arr = file.url.split('/');
              origin[key][index] = {
                uid: `-${index + 1}`,
                url: file.url,
                name: arr[arr.length - 1],
                status: 'done',
              };
            });
          }
        });
        break;
      case 'moment2datetime':
        fields.forEach((key) => {
          origin[key] = moment.isMoment(origin[key]) ? origin[key].format('YYYY-MM-DD HH:mm:ss') : undefined;
        });
        break;
      case 'datetime2moment':
        fields.forEach((key) => {
          origin[key] = origin[key] ? (origin[key] === DEFAULT_EMPTY_TIME) ? undefined : moment(origin[key]) : undefined;
        });
        break;
      case 'default2undefined':
        fields.forEach((key) => {
          if ((typeof origin[key] === 'number') && (origin[key] === -1)) {
            origin[key] = undefined;
          } else if ((typeof origin[key] === 'string') && (origin[key] === '')) {
            origin[key] = undefined;
          }
        });
        break;
      default:
        break;
    }
  });
}

// 格式转换对象
export const transformData = {
  datetime2moment: (value) => {
    return value ? (value === DEFAULT_EMPTY_TIME ? undefined : moment(value)) : undefined;
  },
  datetime2moment4Range: (start, end) => {
    if (!start || !end) { return [] }
    return [
      (start === DEFAULT_EMPTY_TIME ? undefined : moment(start)),
      (end === DEFAULT_EMPTY_TIME ? undefined : moment(end)),
    ];
  }
};

// 格式转换为请求参数
export function transformToUrl(data) {
  const newData = {};

  Object.keys(data).forEach(key => {
    const item = data[key];
    if (moment.isMoment(item)) {
      newData[key] = item.format('YYYY-MM-DD HH:mm:ss');
    } else if (Array.isArray(item)) {
      newData[key] = item.join(',');
    } else {
      newData[key] = item;
    }

  });

  return newData;
};

// 根据指定字段拆分数组
export function splitByField(arr, field) {
  const temp = {};
  const multArr = [];

  arr.forEach(item => {
    if (temp[item[field]]) {
      temp[item[field]].push(item);
    } else {
      temp[item[field]] = [item];
    }
  });

  for (let key in temp) {
    multArr.push(temp[key]);
  }

  return multArr;
}














/**
 * 表单数据 → 搜索参数
 * tree
 * time
 * 
 */
export const form2search = {
  treeOLD: (obj, field, which) => {
    if (obj === undefined || obj[field] === undefined) { return; }

    /**
     * tree
     * obj 操作对象，【注意】不能改变的引用
     * field 操作字段
     * which 使用哪个
     */

    // 参数类型检查
    checkPropTypes([
      obj, [undefined, 'Object'],
      field, ['string'],
      which, ['string'],
    ], true);
    
    // 无需处理
    if (obj === undefined) {
      return;
    }

    if (obj[field] === undefined) {
      return;
    }

    if (obj[field][0] === undefined) {
      return;
    }

    if (typeof obj[field][0] === 'string') {
      return;
    }

    // 如果obj[field][0]是对象，则需要处理

    // 目前使用分割key的方式，也可以使用detail的方式
    const keyArr = obj[field][0]['key'].split('-');

    // 各种id组成的对象
    const idObj = {
      orgframeParentId: keyArr[0],
      orgframeId: keyArr[1],
      sourceId: keyArr[2],
    };

    // 使用idObj指定字段的值作为最后的值
    obj[field] = idObj[which];
  },
  tree: (obj, field) => {
    if (obj === undefined || obj[field] === undefined) { return; }

    // 参数类型检查
    checkPropTypes([
      obj, [undefined, 'Object'],
      field, ['string'],
    ], true);

    if (obj === undefined) {
      return;
    }

    if (testPropTypes(obj[field], 'string')) {
      obj[field] = Number(obj[field]);
      return;
    }

    if (testPropTypes(obj[field], 'Array')) {
      if (testPropTypes(obj[field][0], 'undefined')) {
        delete obj[field];
        return;
      }
      if (testPropTypes(obj[field][0], 'string')) {
        obj[field] = Number(obj[field][0].substring(obj[field][0].indexOf('=') + 1));
        return;
      }
    }
  },
  time: (obj, field) => {
    if (obj === undefined || obj[field] === undefined) { return; }

    // 参数类型检查
    checkPropTypes([
      obj, ['Object'],
      field, ['string'],
    ], true);

    // 格式转换
    if (moment.isMoment(obj[field])) {
      obj[field] = obj[field].format('YYYY-MM-DD HH:mm:ss');
    }
  },
  timeRange: (obj, field, start, end) => {
    if (obj === undefined || obj[field] === undefined) { return; }

    // 参数类型检查
    checkPropTypes([
      obj, ['Object'],
      field, ['string'],
    ], true);

    if (obj[field] === undefined) { return; } 

    obj[start] = obj[field][0] ? obj[field][0].format('YYYY-MM-DD HH:mm:ss') : undefined;
    obj[end] = obj[field][1] ? obj[field][1].format('YYYY-MM-DD HH:mm:ss') : undefined;

    delete obj[field];
  },
  upload: (obj, field) => {
    if (obj === undefined || obj[field] === undefined) { return; }

    // 参数类型检查
    checkPropTypes([
      obj, ['Object'],
      field, ['string'],
      obj[field], ['Array']
    ], true);

    // 过滤有效的地址
    const fileList = obj[field].filter(item => item.url);

    // 格式转换
    obj[field] = fileList.map(item => {
      return {
        id: obj.id || 0,
        url: item.url,
      };
    });
  },
  cascader: (obj, field, mark) => {
    if (obj === undefined || obj[field] === undefined) { return; }

    if (testPropTypes(obj[field], 'Array')) {
      if (obj[field].length === 0) {
        delete obj[field];
        return;
      }

      const last = obj[field][obj[field].length - 1];

      if (mark) {
        if (testPropTypes(last, 'string')) {
          if (~last.indexOf(mark)) {
            obj[field] = Number(last.replace(mark, ''));
            return;
          }

          delete obj[field];
          return;
        }

        delete obj[field];
        return;
      }

      obj[field] = Number(last);
    }
  },
  cascaderChange: (obj, field, options) => {
    if (obj === undefined || obj[field] === undefined) { return; }

    const value = obj[field];
    const last = value[value.length - 1];

    // 字符串
    if (testPropTypes(last, 'string')) {
      // 有标记
      if (~last.indexOf(options.mark)) {
        obj[options.id] = Number(last.replace(options.mark, ''));
        delete obj[options.cid];

      // 无标记
      } else {
        obj[options.cid] = Number(last);
        delete obj[options.id];
      }

    // 其它类型直接赋值给类
    } else {
      obj[options.cid] = last;
      delete obj[options.id];
    }

    // 删除虚拟字段
    delete obj[field];
  },
  ids: (obj, field) => {
    if (obj === undefined || obj[field] === undefined) { return; }

    obj[field] = obj[field].join(',');
  },
};

/**
 * 搜索参数 → 表单数据
 * enums
 */
export const search2form = {
  enums: (arr, ids, choose, separator) => {
    // 验证参数
    checkPropTypes([
      arr, ['Array'],
      ids, ['string'],
      choose, ['string'],
      separator, ['string'],
    ]);

    // 从arr中过滤出ids中存在的项
    const idArr = ids.split(',');
    const match = arr.filter(item => {
      if (~idArr.indexOf(String(item.id))) {
        return true;
      }
      return false;
    });

    // 选择显示哪个字段，以什么分割的字符串
    if (choose && separator) {
      return match.map(item => item[choose]).join(separator);
    }

    // 选择显示哪个字段组成的数组
    if (choose) {
      return match.map(item => item[choose]);
    }

    return match;
  },
  tree: (key, mapping) => {
    const keys = [];
    const treeKey = syncVarIterator.getter(mapping, `${key}.treeKey`);

    if (treeKey) {
      keys.splice(0, 0, treeKey);
    }

    return keys;
  },
  treeParent: (key, mapping, removelast) => {
    const path = syncVarIterator.getter(mapping, `${key}.path`);
    if (path) {
      const keys = path.split('|');
      return removelast ? keys.slice(0, -1) : keys;
    }
  },
  time: (value) => {
    // 参数类型检查
    checkPropTypes([
      value, [undefined, 'string']
    ], true);

    if (value === undefined || value === DEFAULT_EMPTY_TIME) {
      return undefined;
    }

    return moment(value);
  },
  timeRange: (start, end) => {
    // 参数类型检查
    checkPropTypes([
      start, [undefined, 'string'],
      end, [undefined, 'string']
    ], true);

    if (!start || !end) { return [] }

    return [
      (start === DEFAULT_EMPTY_TIME ? undefined : moment(start)),
      (end === DEFAULT_EMPTY_TIME ? undefined : moment(end)),
    ];
  },
  upload: (value) => {
    // 参数类型检查
    checkPropTypes([
      value, ['Array']
    ], true);

    // 过滤无效的url
    const validValue = value.filter(item => item.url);

    // 返回数组
    return validValue.map((item, index) => {
      // URL的格式为，名称在最后一个斜杠后面
      const reg = new RegExp('(.*)(\\/)');
      return {
        uid: `-${index + 1}`,
        url: item.url,
        name: item.url.replace(reg, ''),
        status: 'done',
      };
    });
  },
  cascader: (entity) => {
    if (testPropTypes(entity, 'Object')) {
      const path = entity.path;
      const pathArr = path.split('|').filter(id => id !== '1').map(item => Number(item));
      return pathArr;
    }
    return undefined;
  },
  cascaderChange: (mapping, { cid, id, mark }) => {
    if (!!cid === false && !!id === false) { return; }
    const key = cid || mark + id;

    const entity = mapping[key];
    if (entity === undefined || entity.path === undefined) { return; }

    const pathArr = entity.path.split('|').filter(id => id !== '1').map(item => item);
    return pathArr;
  },
  defaultValue: (value) => {
    // 参数类型检查
    checkPropTypes([
      value, [undefined, 'NaN', 'number', 'string']
    ], true);

    if (value === undefined) {
      return undefined;
    }

    if (testPropTypes(value, 'NaN')) {
      return undefined;
    }

    if (testPropTypes(value, 'number') && (value === -1 || value === 0)) {
      return undefined;
    }

    if (testPropTypes(value, 'string') && value === '' && value === DEFAULT_EMPTY_TIME) {
      return undefined;
    }

    return value;
  },
  ids: (ids) => {
    if (ids === undefined) { return; }
    return ids.split(',');
  },
};

/**
 * 比对
 * array
 */
export const compare = {
  eqArray: (left, right) => {
    checkPropTypes([
      left, ['Array'],
      right, ['Array']
    ]);

    if (left === right) {
      return true;
    }

    if (testPropTypes(left, '[object Array]') === false) {
      return false;
    }

    if (testPropTypes(right, '[object Array]') === false) {
      return false;
    }

    // 长度不一样，肯定不相同
    if (left.length !== right.length) {
      return false;
    }

    // 使用JSON.stringify检查是否存在循环引用
    try {
      JSON.stringify(left);
      JSON.stringify(right);
    } catch (ex) {
      return false;
    }

    // 递归排序
    (function loop (ele) {
      for (let key in ele) {
        const item = ele[key];

        // 如果不是一层对象，递归
        if (checkObject.isOneLevel(item) === false) {
          loop(item);
        }

        // 如果是数组，直接排序
        if (testPropTypes(item, 'Array')) {
          item.sort();
          continue;
        }

        // 对象转数组后，按属性名排序
        const sortable = [];

        for (let key in item) {
          sortable.push([key, item[key]]);
        }

        sortable.sort(function(a, b) {
          return a[0] > b[0] ? 1 : -1;
        });

        ele[key] = sortable;
      }
    })([left, right]);

    // 循环比对
    for (let i = 0; i < left.length; i++) {
      const ls = JSON.stringify(left[i]);
      const rs = JSON.stringify(right[i]);
      if (ls !== rs) {
        return false;
      }
    }
    
    return true;
  }
};

/**
 * 转换为数组
 * url
 * unique
 */
export const toArray = {
  url: (url) => {
    const urllist = url.split('/').filter(i => i);
    return urllist.map((urlItem, index) => {
      return `/${urllist.slice(0, index + 1).join('/')}`;
    });
  },
  unique: (arr) => {
    return arr.concat().sort().filter((item, index, array) => {
      return !index || (item !== array[index - 1]);
    });
  },
  sliceByLength: (arr, length) => {
    let newArr = [];
    for (let i = 0; i < arr.length;) {
      newArr.push(arr.slice(i, i + length));
      i = i + length;
    }
    return newArr;
  },
  sliceByField(arr, field) {
    const temp = {};
    const multArr = [];

    arr.forEach(item => {
      if (temp[item[field]]) {
        temp[item[field]].push(item);
      } else {
        temp[item[field]] = [item];
      }
    });

    for (let key in temp) {
      multArr.push(temp[key]);
    }

    return multArr;
  },
  cascader(arr) {
    return arr.map(item => {
      return {
        id: item.id,
        parentId: item.parentId || 0,
        value: item.value || item.id,
        level: item.level,
        label: item.shortName || item.name,
        isLeaf: item.isLeaf,
        treeKey: item.treeKey || item.id || 0,
        treeParentKey: item.treeParentKey || item.parentId || item.categoryId || 0,
      };
    });
  },
};

/**
 * 转换为对象
 * array
 */
export const toObject = {
  array: (arr, key) => {
    return arr.reduce((result, item) => {
      result[item[key]] = item;
      return result;
    }, {});
  }
};


// ============================================================
// 业务强相关
// ============================================================

// 合并请求参数
export function combineParams(payload) {
  const type = payload.type;
  const current = payload.current;
  const formValues = payload.formValues;
  const tableFilters = payload.tableFilters;

  // type(1: 页面筛选, 其他：用户操作了地址栏)
  if (type === 1) {
    // tableFilters.pageindex 可能没有，请求时会自动使用默认值
    // 如果有值，则与当前分页进行比对，如果没有修改分页，则设置为第 1 页
    if (Number(tableFilters.pageindex) === (Number(current) + 1)) {
      tableFilters.pageindex = 1;
    }
  } else {
    const search = queryString.parse(history.location.search);

    // 优先使用地址栏的值，没有的话，使用页面的值
    Object.keys(search).forEach(key => {
      formValues[key] = search[key];
    });

    Object.keys(search).filter(key => formValues[key] === undefined).forEach(key => {
      tableFilters[key] = search[key];
    });
  }

  const all = Object.assign({}, formValues, tableFilters);
  
  // 同步地址拦
  const searchString = queryString.stringify(all);
  const searchConnect = searchString ? `?${searchString}` : '';
  window.history.replaceState(null, null, `/#${history.location.pathname}${searchConnect}${history.location.hash}`);

  return {
    all,
    formValues,
    tableFilters,
  };
}

// 同步地址栏参数到redux
export function syncUrlParams(dispatch, namespace) {
  // 取得地址拦的搜索参数
  const search = queryString.parse(history.location.search);

  // 同步地址栏的搜索参数到redux
  if (dispatch && namespace) {
    dispatch({ type: `${namespace}/initKeep`, payload: search });
  }

  return search;
}

// 重载参数
export function pageParams(params, reset) {
  return reset ? { ...params } : (params && Object.assign({}, this.props.form.getFieldsValue(), params));
}

// 合并请求参数并更新地址栏
// 不应该直接在表单表格中设置默认值，而应该使用 defaultValue 参数
export function mergeParams(payload, defaultValue) {
  // 取得地址拦的搜索参数，在页面加载就已确认，下面的同步地址栏不会改变
  const search = window.location.hash.split('?')[1];
  const keep = queryString.parse(search);
  
  // 如果 payload 是 undefined 则以地址栏同步下来的数据为准，否则以页面为准
  const current = payload || keep;
  
  // 如果对应值是 undefined，使用默认值替换
  const replace = Object.keys(current).reduce((result, key) => {
    result[key] = (current[key] === undefined) ? (defaultValue && defaultValue[key]) : current[key];
    return result;
  }, {});

  // 合并
  const merge = transformToUrl(Object.assign({}, defaultValue, replace));

  // 同步地址拦
  const searchString = queryString.stringify(merge);
  const searchConnect = searchString ? `?${searchString}` : '';
  window.history.replaceState(null, null, `/#${history.location.pathname}${searchConnect}${history.location.hash}`);

  return merge;
}

export const handleParams = {
  url: syncUrlParams,
  page: pageParams,
  merge: mergeParams,
};

// ============================================================
// 设计模式
// ============================================================
/**
 * 同步变量迭代器
 *
 */
export const syncVarIterator = {
  getter: function (obj, key) {
    // 如果不存在obj则返回未定义
    if (!obj) {
      return undefined;
    }

    // 解析属性层次序列
    const keyArr = key.split('.');

    // 结果变量，暂时指向obj持有的引用，后续将可能被不断的修改
    let result = obj;

    // 迭代obj对象属性
    for (let i = 0; i < keyArr.length; i++) {
      // 如果第 i 层属性存在对应的值则迭代该属性值
      if (result[keyArr[i]] !== undefined) {
        result = result[keyArr[i]];
        // 如果不存在则返回未定义
      } else {
        return undefined;
      }
    }
    // 返回获取的结果
    return result;
  },
  setter: function (obj, key, val) {
    // 如果不存在obj则返回未定义
    if (!obj) {
      return false;
    }

    // 解析属性层次序列
    const keyArr = key.split('.');

    // 结果变量，暂时指向obj持有的引用，后续将可能被不断的修改
    let result = obj;
    let i = 0;

    // 迭代obj对象属性
    for (; i < keyArr.length - 1; i++) {
      // 如果第 i 层属性对应的值不存在，则定义为对象
      if (result[keyArr[i]] === undefined) {
        result[keyArr[i]] = {};
      }
      // 如果第 i 层属性对应的值不是对象（Object）的一个实例，则抛出错误
      if (!(result[keyArr[i]] instanceof Object)) {
        throw new Error('obj.' + keyArr.splice(0, i + 1).join('.') + 'is not Object');
      }
      // 迭代该层属性值
      result = result[keyArr[i]];
    }
    // 返回设置成功的属性值
    return result[keyArr[i]] = val;
  }
};


