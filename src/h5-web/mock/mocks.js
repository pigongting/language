import { INTERFACE_URL, INTERFACE_URL_ICBP } from './config';

const proxy = {
  // 登录
  ['PUT /icb/sec/auth/login']: INTERFACE_URL_ICBP,





























  // // 登录
  // ['POST /zuul/ksv/csapi/auth/login']: INTERFACE_URL,
  // // 基础设施
  // ['GET /zuul/sas/csapi/ifs/adminareas']: INTERFACE_URL,
  // ['GET /zuul/sas/csapi/ifs/adminarea/cities']: INTERFACE_URL,
  // // 安全框架
  // ['GET /zuul/sas/csapi/sec/user']: INTERFACE_URL,
  // ['GET /zuul/sas/csapi/sec/orgframes']: INTERFACE_URL,
  // ['GET /zuul/sas/csapi/sec/permission/views/csl_mst_menu']: INTERFACE_URL,
  // // 组织架构
  // // 公司
  // ['GET /zuul/sas/csapi/org/companies']: INTERFACE_URL,
  // // 项目
  // ['GET /zuul/sas/csapi/pbf/propertyprojects']: INTERFACE_URL,
  // ['POST /zuul/sas/csapi/pbf/cmnproject']: INTERFACE_URL,
  // // 部门
  // ['GET /zuul/sas/csapi/org/deptdivisions']: INTERFACE_URL,
  // // 岗位
  // ['GET /zuul/sas/csapi/org/positions']: INTERFACE_URL,
  // // 员工
  // ['POST /zuul/sas/csapi/org/employee']: INTERFACE_URL,
  // ['PUT /zuul/sas/csapi/org/employee/:id']: INTERFACE_URL,
  // ['DELETE /zuul/sas/csapi/org/employee']: INTERFACE_URL,
  // ['GET /zuul/sas/csapi/org/employee-ext/:id']: INTERFACE_URL,
  // ['GET /zuul/sas/csapi/org/employees-ext']: INTERFACE_URL,
  // // 职责
  // ['GET /zuul/ksv/csapi/hrs/employeeduties']: INTERFACE_URL,
  // ['PUT /zuul/ksv/csapi/hrs/employeeduties/:id']: INTERFACE_URL,
  // ['GET /zuul/ksv/csapi/hrs/departmentpositionduties']: INTERFACE_URL,
};

module.exports = proxy;