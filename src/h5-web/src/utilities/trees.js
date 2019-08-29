export function treenodeify(arr, mark='') {
  return arr.map(item => {
    return {
      origin: item,
      // cascader & tree
      id: mark + item.id,
      value: mark + item.id,
      label: item.shortName || item.name || item.title,
      isLeaf: item.isLeaf,
      disabled: item.disabled,
      // tree
      parentId: String(item.parentId) || String(item.categoryId) || '0',
      selectable: item.selectable,
      disableCheckbox: item.disableCheckbox,
      path: item.path,
      level: item.level,
    };
  });
}

export function mappingify(arr, origin) {
  const mapping = {};
  const sourceMapping = {};
  const mappingArr = []; // 保证顺序

  for (let i = 0; i < arr.length; i++) {
    const item = arr[i];
    const key = item['value'];
    const pkey = String(item['parentId']);

    // 树数据映射
    if (origin) {
      if (origin.mapping[key] === undefined) {
        origin.mapping[key] = item;
        mapping[key] = item;
        mappingArr.push(key);
      }
    } else {
      mapping[key] = item;
      mappingArr.push(key);
    }

    // 源数据映射，有才设置
    if (item.origin === undefined || item.origin.source === undefined || item.origin.sourceId === undefined) { continue; }

    const sourceKey = `${item.origin.source}_${item.origin.sourceId}`;

    // 源数据映射
    if (origin) {
      if (origin.sourceMapping[sourceKey] === undefined) {
        origin.sourceMapping[sourceKey] = item;
        sourceMapping[sourceKey] = item;
      }
    } else {
      sourceMapping[sourceKey] = item;
    }
  }

  return {
    mapping,
    sourceMapping,
    mappingArr,
  };
}

export function treeify({ mapping, mappingArr }, origin) {
  const tree = [];
  const loadedKeys = [];

  for (let i = 0; i < mappingArr.length; i++) {
    const key = mappingArr[i];
    const item = origin ? origin.mapping[key] : mapping[key];
    const itemParent = origin ? origin.mapping[item['parentId']] : mapping[item['parentId']];

    // 当前项和父项是同一个时，表示是根节点
    // 找不到父项，表示是一级类别
    if (item === itemParent || itemParent === undefined) {
      if (origin) {
        origin.tree.push(item);
      } else {
        tree.push(item);
      }
      continue;
    }

    // 加入父项
    itemParent.children ? itemParent.children.push(item) : itemParent.children = [item];

    // 加入已加载数组
    if (origin) {
      origin.loadedKeys.includes(itemParent['value']) || origin.loadedKeys.push(itemParent['value']);
    } else {
      loadedKeys.includes(itemParent['value']) || loadedKeys.push(itemParent['value']);
    }
  }

  return {
    tree,
    loadedKeys,
  };
}

export function tree(arr, origin, clean) {
  if (clean) {
    origin.mapping = {};
    origin.sourceMapping = {};
    origin.tree.length = 0;
    origin.loadedKeys.length = 0;
  }

  if (origin) {
    treeify(mappingify(arr, origin), origin);
    return origin;
  }

  const { mapping, sourceMapping, mappingArr } = mappingify(arr);
  const { tree, loadedKeys } = treeify({ mapping, mappingArr });

  return {
    mapping,
    sourceMapping,
    tree,
    loadedKeys,
  };
}
