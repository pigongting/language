export default {
  // ====================================================
  // begin 通用
  Common: {
    // 启用状态
    enableState: {
      0: '全部',
      1: '启用',
      2: '禁用',
      100: '系统',
    },
    // 性别
    gender: {
      0: '全部',
      1: '男',
      2: '女',
      99: '保密',
    },
    // 证件类型
    certificateType: {
      1: '身份证',
      2: '护照',
      3: '港澳通行证',
      4: '台湾通行证',
      5: '回乡证',
      6: '台胞证',
      7: '香港居民身份证',
      100: '其他',
    },
  },
  // end 通用
  // ====================================================

  // ====================================================
  // begin 组织架构
  Org: {
    // 组织类型
    type: {
      G: '集团',
      C: '分公司',
      P: '项目',
    },
  },
  // end 组织架构
  // ====================================================

  // ====================================================
  // begin 安全框架
  Sec: {
    orgFrameSource: {
      0: '无效',
      1: 't_org_company_group',
      2: 't_org_department',
      3: 't_org_company',
      4: 't_org_department',
      5: 't_pbf_cmnproject',
      6: 't_org_department',
    },
  },
  // end 安全框架
  // ====================================================
}
