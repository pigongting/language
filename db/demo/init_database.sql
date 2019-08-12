-- =================================================================
-- giga-framework
-- =================================================================
-- 逻辑删除标志
-- meta_logic_flag: All(0, "全部"), Normal(1, "正常"), Deleted(2, "删除"), Invalid(3, "无效"), System(100, "系统");


-- =================================================================
-- t_sec_org_frame
-- =================================================================

-- -- TRUNCATE TABLE t_saas_ternant;
/*!40000 ALTER TABLE `t_saas_ternant` DISABLE KEYS */;
INSERT INTO 
  `t_saas_ternant` (`id`, `code`, `name`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) 
VALUES
	(1, 'JZY-PG', '佳兆业物业集团', 0, '', '', '', '', '', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_saas_ternant` ENABLE KEYS */;

-- 佳兆业物业部门中英文对照
-- 1、	行政及人力资源部
-- Administration & Human resource Department
-- 2、	财务管理部
-- Financial Management Department
-- 3、	采购管理部
-- Purchase Management Department
-- 4、	法律合规部
-- Legal & Compliance Department
-- 5、	审计监察部
-- Audit & Supervision Department
-- 6、	品质及客户服务部
-- Quality & Customer service Department
-- 7、	互联网社区管理部
-- Internet Community Department
-- 8、	安全督察部
-- Security & Supervision Department
-- 9、	投资发展部
-- Investment & Development Department

-- 物业集团
	-- 品质部 QCD 
		-- 主管
		-- 专员
	-- 安全督察部 SI Safety Inspector
		-- 主管
		-- 专员 
-- 城市分公司
	-- 品质部
		-- 主管
		-- 专员
	-- 安全督察部
		-- 主管
		-- 专员
-- 项目(明确:一个人多个岗位, 一个人多个项目的项目经理)
	-- 行政部
		-- 项目经理
		-- 项目经理助理(B角)
	-- 客服部
		-- 主管
		-- 前台
		-- 管家
	-- 工程部
		-- 主管
		-- 领班(group)
		-- 技工(TODO: 考虑分成 电工:弱电强电, 给排水, 电梯, 维修, 木工...)
	-- 秩序部
		-- 主管
		-- 领班
		-- 保安
	-- 环境部
		-- 主管
		-- 专员

-- G:HO:Head Office 总公司
-- C:BO:Branch Office 分公司
-- P:OC:Operation Community 小区

-- -- TRUNCATE TABLE t_org_department_division;
/*!40000 ALTER TABLE `t_org_department_division` DISABLE KEYS */;
INSERT INTO `t_org_department_division` (`id`, `code`, `short_name`, `name`, `scope`, `state`, `description`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
	(1, 'AH', '行政人力部', '行政及人力资源部', 'G,C', 0, 'Administration & Human resource Department', NOW(), NOW(), 2),
	(2, 'FM', '财务部', '财务管理部', 'G,C', 0, 'Financial Management Department', NOW(), NOW(), 2),
	(3, 'PM', '采购部', '采购管理部', 'G,C', 0, 'Purchase Management Department', NOW(), NOW(), 2),
	(4, 'LC', '法务部', '法律合规部', 'G', 0, 'Legal & Compliance Department', NOW(), NOW(), 2),
	(5, 'AS', '审计监察部', '审计监察部', 'G', 0, 'Audit & Supervision Department', NOW(), NOW(), 2),
	(6, 'QC', '品质部', '品质及客户服务部', 'G,C', 0, 'Quality & Customer service Department', NOW(), NOW(), 1),
	(7, 'IC', '互联网中心', '互联网社区管理部', 'G', 0, 'Internet Community Department', NOW(), NOW(), 2),
	(8, 'SS', '安全督察部', '安全督察部', 'G,C', 0, 'Security & Supervision Department', NOW(), NOW(), 1),
	(9, 'ID', '投资发展部', '投资发展部', 'G', 0, 'Investment & Development Department', NOW(), NOW(), 2),
	(10, 'AD', '行政部', '行政管理部', 'P', 0, 'Administration Management Department', NOW(), NOW(), 1),
	(11, 'CS', '客服部', '客户服务部', 'P', 0, 'Customer service Department', NOW(), NOW(), 1),
	(12, 'SS', '秩序部', '安全保卫部', 'P', 0, 'Safety & Security Department', NOW(), NOW(), 1),
	(13, 'EM', '工程部', '工程维修部', 'P', 0, 'Engineering & Maintenance Department', NOW(), NOW(), 1),
	(14, 'EP', '环境部', '环境保护部', 'P', 0, 'Environmental Protection Department', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_org_department_division` ENABLE KEYS */;
  
-- TODO:公共职位,比如:专员staff; 指定部门职位, 比如:财务部出纳, 法务部律师
-- assistant manager 助理主管
-- manager 主管
-- senior manager 高级主管
-- front desk 前台,是指前台这个'场合'
-- receptionist 前台, 是指前台接待人员

-- -- TRUNCATE TABLE t_org_position_division;
/*!40000 ALTER TABLE `t_org_position_division` DISABLE KEYS */;
INSERT INTO `t_org_position_division` (`id`, `code`, `short_name`, `name`, `scope`, `state`, `description`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
	(1, 'DM', '主管', '部门主管', 'G,C,P', 0, 'department manager', NOW(), NOW(), 1),
	(2, 'DA', '助理主管', '助理部门主管', 'G,C,P', 0, ' assistant department manager', NOW(), NOW(), 2),
	(3, 'ST', '专员', '专员/职员/全职人员', 'G,C,P', 0, 'staff', NOW(), NOW(), 1),
	(4, 'CM', '项目经理', '(行政)项目经理/小区主管', 'P', 0, 'project manager/community manager', NOW(), NOW(), 1),
	(5, 'CA', '助理项目经理', '(行政)助理项目经理/助理小区主管', 'P', 0, 'assistant project manager/assistant community manager', NOW(), NOW(), 1),
	(6, 'RE', '前台', '(客服)前台接待员', 'P', 0, 'receptionist', NOW(), NOW(), 1),
	(7, 'BU', '管家', '(客服)管家', 'P', 0, 'butler', NOW(), NOW(), 1),
	(8, 'GL', '领班', '(工程/秩序)领班', 'P', 0, 'group leader', NOW(), NOW(), 1),
	(9, 'SG', '保安', '(秩序)保安', 'P', 0, 'security guard', NOW(), NOW(), 1),
	(10, 'SW', '技工', '(工程)技工', 'P', 0, 'skilled worker', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_org_position_division` ENABLE KEYS */;

-- -- TRUNCATE TABLE t_org_department_division_position_division;
/*!40000 ALTER TABLE `t_org_department_division_position_division` DISABLE KEYS */;
INSERT INTO `t_org_department_division_position_division` (`id`, `department_division_id`, `position_division_id`, `state`, `description`, `scope`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
  (1, 6, 1, 0, '集团-品质部-主管', 'G', NOW(), NOW(), 1),
  (2, 6, 3, 0, '集团-品质部-专员', 'G', NOW(), NOW(), 1),
  (3, 8, 1, 0, '集团-安全督察部-主管', 'G', NOW(), NOW(), 1),
  (4, 8, 3, 0, '集团-安全督察部-专员', 'G', NOW(), NOW(), 1),  
  (5, 6, 1, 0, '分公司-品质部-主管', 'C', NOW(), NOW(), 1),
  (6, 6, 3, 0, '分公司-品质部-专员', 'C', NOW(), NOW(), 1),
  (7, 8, 1, 0, '分公司-安全督察部-主管', 'C', NOW(), NOW(), 1),
  (8, 8, 3, 0, '分公司-安全督察部-专员', 'C', NOW(), NOW(), 1),  
  (9, 10, 4, 0, '项目-行政部-项目经理', 'P', NOW(), NOW(), 1),
  (10, 10, 5, 0, '项目-行政部-助理项目经理', 'P', NOW(), NOW(), 1),
  (11, 11, 1, 0, '项目-客服部-主管', 'P', NOW(), NOW(), 1),
  (12, 11, 6, 0, '项目-客服部-前台', 'P', NOW(), NOW(), 1),
  (13, 11, 7, 0, '项目-客服部-管家', 'P', NOW(), NOW(), 1),  
  (14, 12, 1, 0, '项目-秩序部-主管', 'P', NOW(), NOW(), 1),
  (15, 12, 8, 0, '项目-秩序部-领班', 'P', NOW(), NOW(), 1),
  (16, 12, 9, 0, '项目-秩序部-保安', 'P', NOW(), NOW(), 1),  
  (17, 13, 1, 0, '项目-工程部-主管', 'P', NOW(), NOW(), 1),
  (18, 13, 8, 0, '项目-工程部-领班', 'P', NOW(), NOW(), 1),
  (19, 13, 10, 0, '项目-工程部-技工', 'P', NOW(), NOW(), 1),   
  (20, 14, 1, 0, '项目-环境部-主管', 'P', NOW(), NOW(), 1),
  (21, 14, 3, 0, '项目-环境部-专员', 'P', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_org_department_division_position_division` ENABLE KEYS */;


-- C:客服, V:环境, S:秩序, E:工程, 
-- CG:综合
/*INSERT INTO `t_org_duty_division` (`id`, `code`, `short_name`, `name`, `state`, `description`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
	(1, 'CCC', '(客服)咨询', '(客服)咨询', 0, '(customer service) consultation', NOW(), NOW(), 1),
	(2, 'CCP', '(客服)投诉', '(客服)投诉', 0, '(customer service) complain', NOW(), NOW(), 1),
	(3, 'CCG', '(客服)综合', '(客服)综合', 0, '(customer service) colligate', NOW(), NOW(), 1),
	(4, 'VCG', '(环境)综合', '(环境)综合', 0, '(environmental protection) colligate', NOW(), NOW(), 1),
	(5, 'SCG', '(秩序)综合', '(秩序)综合', 0, '(safety & security) colligate', NOW(), NOW(), 1),
	(6, 'ESE', '(工程)强电', '(工程)强电', 0, '(engineering & maintenance) strong electricity', NOW(), NOW(), 1),
	(7, 'EWE', '(工程)弱电', '(工程)弱电', 0, '(engineering & maintenance) weak electricity', NOW(), NOW(), 1),
	(8, 'ESD', '(工程)给排水', '(工程)给排水', 0, '(engineering & maintenance) water supply and drainage', NOW(), NOW(), 1),
	(9, 'EEV', '(工程)电梯', '(工程)电梯', 0, '(engineering & maintenance) elevator', NOW(), NOW(), 1),
	(10, 'EHV', '(工程)暖通', '(工程)暖通', 0, '(engineering & maintenance) heating and ventilation 采暖通风', NOW(), NOW(), 1),
	(11, 'ECG', '(工程)综合', '(工程)综合', 0, '(engineering & maintenance) colligate', NOW(), NOW(), 1);*/

-- -- TRUNCATE TABLE t_org_duty_division;
/*!40000 ALTER TABLE `t_org_duty_division` DISABLE KEYS */;
INSERT INTO `t_org_duty_division` (`id`, `code`, `short_name`, `name`, `state`, `description`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
	(1, 'COM', '(通用)综合', '(通用)综合', 0, '(common) colligate', NOW(), NOW(), 1),

	(2, 'CCC', '(客服)咨询', '(客服)咨询', 0, '(customer service) consultation', NOW(), NOW(), 1),
	(3, 'CCP', '(客服)投诉', '(客服)投诉', 0, '(customer service) complain', NOW(), NOW(), 1),

	(4, 'ESE', '(工程)强电', '(工程)强电', 0, '(engineering & maintenance) strong electricity', NOW(), NOW(), 1),
	(5, 'EWE', '(工程)弱电', '(工程)弱电', 0, '(engineering & maintenance) weak electricity', NOW(), NOW(), 1),
	(6, 'ESD', '(工程)给排水', '(工程)给排水', 0, '(engineering & maintenance) water supply and drainage', NOW(), NOW(), 1),
	(7, 'EEV', '(工程)电梯', '(工程)电梯', 0, '(engineering & maintenance) elevator', NOW(), NOW(), 1),
	(8, 'EHV', '(工程)暖通', '(工程)暖通', 0, '(engineering & maintenance) heating and ventilation 采暖通风', NOW(), NOW(), 1),
	(9, 'EHV', '(工程)维修', '(工程)维修', 0, '(engineering & maintenance) maintenance', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_org_duty_division` ENABLE KEYS */;


-- 导入部门岗位职责
-- -- TRUNCATE TABLE t_org_department_position_duty;
/*!40000 ALTER TABLE `t_org_department_position_duty` DISABLE KEYS */;
INSERT INTO `t_org_department_position_duty` (`id`, `department_position_id`, `duty_division_id`, `state`, `description`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
	(1, 1, 1, 0, '集团-品质部-主管-(通用)综合', NOW(), NOW(), 1),
	(2, 2, 1, 0, '集团-品质部-专员-(通用)综合', NOW(), NOW(), 1),
	(3, 3, 1, 0, '集团-安全督察部-主管-(通用)综合', NOW(), NOW(), 1),
	(4, 4, 1, 0, '集团-安全督察部-专员-(通用)综合', NOW(), NOW(), 1),
	(5, 5, 1, 0, '分公司-品质部-主管-(通用)综合', NOW(), NOW(), 1),
	(6, 6, 1, 0, '分公司-品质部-专员-(通用)综合', NOW(), NOW(), 1),
	(7, 7, 1, 0, '分公司-安全督察部-主管-(通用)综合', NOW(), NOW(), 1),
	(8, 8, 1, 0, '分公司-安全督察部-专员-(通用)综合', NOW(), NOW(), 1),
	(9, 9, 1, 0, '项目-行政部-项目经理-(通用)综合', NOW(), NOW(), 1),
	(10, 10, 1, 0, '项目-行政部-助理项目经理-(通用)综合', NOW(), NOW(), 1),
	(11, 11, 1, 0, '项目-客服部-主管-(通用)综合', NOW(), NOW(), 1),
	(12, 12, 1, 0, '项目-客服部-前台-(通用)综合', NOW(), NOW(), 1),
	(13, 12, 2, 0, '项目-客服部-前台-(客服)咨询', NOW(), NOW(), 1),
	(14, 13, 1, 0, '项目-客服部-管家-(通用)综合', NOW(), NOW(), 1),
	(15, 13, 3, 0, '项目-客服部-管家-(客服)投诉', NOW(), NOW(), 1),
	(16, 14, 1, 0, '项目-工程部-主管-(通用)综合', NOW(), NOW(), 1),
	(17, 15, 1, 0, '项目-工程部-领班-(通用)综合', NOW(), NOW(), 1),
	(18, 16, 1, 0, '项目-工程部-技工-(通用)综合', NOW(), NOW(), 1),
	(19, 16, 4, 0, '项目-工程部-技工-(工程)强电', NOW(), NOW(), 1),
	(20, 16, 5, 0, '项目-工程部-技工-(工程)弱电', NOW(), NOW(), 1),
	(21, 16, 6, 0, '项目-工程部-技工-(工程)给排水', NOW(), NOW(), 1),
	(22, 16, 7, 0, '项目-工程部-技工-(工程)电梯', NOW(), NOW(), 1),
	(23, 16, 8, 0, '项目-工程部-技工-(工程)暖通', NOW(), NOW(), 1),
	(24, 16, 9, 0, '项目-工程部-技工-(工程)维修', NOW(), NOW(), 1),

	(25, 17, 1, 0, '项目-秩序部-主管-(通用)综合', NOW(), NOW(), 1),
	(26, 18, 1, 0, '项目-秩序部-领班-(通用)综合', NOW(), NOW(), 1),
	(27, 19, 1, 0, '项目-秩序部-保安-(通用)综合', NOW(), NOW(), 1),
	(28, 20, 1, 0, '项目-环境部-主管-(通用)综合', NOW(), NOW(), 1),
	(29, 21, 1, 0, '项目-环境部-专员-(通用)综合', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_org_department_position_duty` ENABLE KEYS */;

-- -- TRUNCATE TABLE t_sec_org_frame;
-- -- TRUNCATE TABLE t_org_company;
-- -- TRUNCATE TABLE t_org_company_group; 
-- -- TRUNCATE TABLE t_org_department;
-- -- TRUNCATE TABLE t_cmn_community;

-- 导入集团
-- -- TRUNCATE TABLE t_org_company_group;
/*!40000 ALTER TABLE `t_org_company_group` DISABLE KEYS */;
INSERT INTO `t_org_company_group` (`id`, `tenant_id`, `code`, `name`, `state`, `description`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
	(1, 1, 'PG', '佳兆业物业集团', 0, '', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_org_company_group` ENABLE KEYS */;

-- 插入org_frame
-- -- TRUNCATE TABLE t_sec_org_frame;
/*!40000 ALTER TABLE `t_sec_org_frame` DISABLE KEYS */;
INSERT INTO `t_sec_org_frame` (`id`, `parent_id`, `level`, `path`, `no`, `short_name`, `name`, `source`, `source_id`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
	(1, 1, 1, '1', 'JZY-PG', '物业集团', '佳兆业物业集团', 't_org_company_group', 1, '', '', '', '',  NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_sec_org_frame` ENABLE KEYS */;

-- 导入集团级部门
-- -- TRUNCATE TABLE t_org_department;
/*!40000 ALTER TABLE `t_org_department` DISABLE KEYS */;
INSERT INTO `t_org_department` (`id`, `parent_id`, `department_division_id`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
	(1, 1, 1, 0, '佳兆业物业集团-行政及人力资源部', '', '', '', '', NOW(), NOW(), 2),
  (2, 1, 2, 0, '佳兆业物业集团-财务管理部', '', '', '', '', NOW(), NOW(), 2),
  (3, 1, 3, 0, '佳兆业物业集团-采购管理部', '', '', '', '', NOW(), NOW(), 2),
  (4, 1, 4, 0, '佳兆业物业集团-法律合规部', '', '', '', '', NOW(), NOW(), 2),
  (5, 1, 5, 0, '佳兆业物业集团-审计监察部', '', '', '', '', NOW(), NOW(), 2),
  (6, 1, 6, 0, '佳兆业物业集团-品质及客户服务部', '', '', '', '', NOW(), NOW(), 1),
  (7, 1, 7, 0, '佳兆业物业集团-互联网社区管理部', '', '', '', '', NOW(), NOW(), 2),
  (8, 1, 8, 0, '佳兆业物业集团-安全督察部', '', '', '', '', NOW(), NOW(), 1),
  (9, 1, 9, 0, '佳兆业物业集团-投资发展部', '', '', '', '', NOW(), NOW(), 2);
/*!40000 ALTER TABLE `t_org_department` ENABLE KEYS */;  

-- 插入org_frame
/*!40000 ALTER TABLE `t_sec_org_frame` DISABLE KEYS */;
INSERT INTO `t_sec_org_frame` (`id`, `parent_id`, `level`, `path`, `no`, `short_name`, `name`, `source`, `source_id`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
	(2, 1, 2, '1|2', 'PG-AH', '集团行政人力', '佳兆业物业集团-行政及人力资源部', 't_org_department', 1, '', '', '', '',  NOW(), NOW(), 2),
  (3, 1, 2, '1|3', 'PG-FM', '集团财务', '佳兆业物业集团-财务管理部', 't_org_department', 2, '', '', '', '',  NOW(), NOW(), 2),
  (4, 1, 2, '1|4', 'PG-PM', '集团采购', '佳兆业物业集团-采购管理部', 't_org_department', 3, '', '', '', '',  NOW(), NOW(), 2),
  (5, 1, 2, '1|5', 'PG-LC', '集团法务', '佳兆业物业集团-法律合规部', 't_org_department', 4, '', '', '', '',  NOW(), NOW(), 2),
  (6, 1, 2, '1|6', 'PG-AS', '集团审计', '佳兆业物业集团-审计监察部', 't_org_department', 5, '', '', '', '',  NOW(), NOW(), 2),
  (7, 1, 2, '1|7', 'PG-QC', '集团客服', '佳兆业物业集团-品质及客户服务部', 't_org_department', 6, '', '', '', '',  NOW(), NOW(), 1),
  (8, 1, 2, '1|8', 'PG-IC', '集团互联网', '佳兆业物业集团-互联网社区管理部', 't_org_department', 7, '', '', '', '',  NOW(), NOW(), 2),
  (9, 1, 2, '1|9', 'PG-SS', '集团安全督查', '佳兆业物业集团-安全督察部', 't_org_department', 8, '', '', '', '',  NOW(), NOW(), 1),
  (10, 1, 2, '1|10', 'PG-ID', '集团投资发展', '佳兆业物业集团-投资发展部', 't_org_department', 9, '', '', '', '',  NOW(), NOW(), 2);
/*!40000 ALTER TABLE `t_sec_org_frame` ENABLE KEYS */;

-- 导入公司org_frame
-- -- TRUNCATE TABLE t_org_company;
/*!40000 ALTER TABLE `t_org_company` DISABLE KEYS */;
INSERT INTO `t_org_company` (`id`, `parent_id`, `code`, `name`, `priority`, `state`, `description`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
	(1, 1, 'PG-GD-SZ', '深圳物业分公司', 1, 0, '', NOW(), NOW(), 1),
	(2, 1, 'PG-GD-GZ', '广州物业分公司', 2, 0, '', NOW(), NOW(), 1),
	(3, 1, 'PG-GD-DG', '东莞物业分公司', 3, 0, '', NOW(), NOW(), 1),
	(4, 1, 'PG-GD-HZ', '惠州物业分公司', 4, 0, '', NOW(), NOW(), 1),
	(5, 1, 'PG-GD-FS', '佛山物业分公司', 5, 0, '', NOW(), NOW(), 1),
	(6, 1, 'PG-GD-ZH', '珠海物业分公司', 6, 0, '', NOW(), NOW(), 1),
	(7, 1, 'PG-LN-AA', '辽宁物业分公司', 7, 0, '', NOW(), NOW(), 1),
	(8, 1, 'PG-LN-DL', '大连物业分公司', 10, 0, '', NOW(), NOW(), 1),
	(9, 1, 'PG-LN-SZ', '绥中物业分公司', 8, 0, '', NOW(), NOW(), 1),
	(10, 1, 'PG-SD-AA', '山东物业分公司', 9, 0, '', NOW(), NOW(), 1),	
	(11, 1, 'PG-SX-AA', '山西物业分公司', 11, 0, '', NOW(), NOW(), 1),
	(12, 1, 'PG-SH-AA', '上海物业分公司', 12, 0, '', NOW(), NOW(), 1),
	(13, 1, 'PG-JS-AA', '江苏物业分公司', 13, 0, '', NOW(), NOW(), 1),
	(14, 1, 'PG-ZJ-HZ', '杭州物业分公司', 14, 0, '', NOW(), NOW(), 1),
	(15, 1, 'PG-HB-AA', '湖北物业分公司', 15, 0, '', NOW(), NOW(), 1),
	(16, 1, 'PG-HN-CS', '长沙物业分公司', 16, 0, '', NOW(), NOW(), 1),
	(17, 1, 'PG-CQ-AA', '重庆物业分公司', 17, 0, '', NOW(), NOW(), 1),
	(18, 1, 'PG-SC-CD', '成都物业分公司', 18, 0, '', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_org_company` ENABLE KEYS */;

-- 插入org_frame
/*!40000 ALTER TABLE `t_sec_org_frame` DISABLE KEYS */;
INSERT INTO `t_sec_org_frame` (`id`, `parent_id`, `level`, `path`, `no`, `short_name`, `name`, `source`, `source_id`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
  (11, 1, 2, '1|11', 'PG-GD-SZ', '深圳公司', '佳兆业物业集团-深圳物业分公司', 't_org_company', 1, '', '', '', '',  NOW(), NOW(), 1),
  (12, 1, 2, '1|12', 'PG-GD-GZ', '广州公司', '佳兆业物业集团-广州物业分公司', 't_org_company', 2, '', '', '', '',  NOW(), NOW(), 1),
  (13, 1, 2, '1|13', 'PG-GD-DG', '东莞公司', '佳兆业物业集团-东莞物业分公司', 't_org_company', 3, '', '', '', '',  NOW(), NOW(), 1),
  (14, 1, 2, '1|14', 'PG-GD-HZ', '惠州公司', '佳兆业物业集团-惠州物业分公司', 't_org_company', 4, '', '', '', '',  NOW(), NOW(), 1),
  (15, 1, 2, '1|15', 'PG-GD-FS', '佛山公司', '佳兆业物业集团-佛山物业分公司', 't_org_company', 5, '', '', '', '',  NOW(), NOW(), 1),
  (16, 1, 2, '1|16', 'PG-GD-ZH', '珠海公司', '佳兆业物业集团-珠海物业分公司', 't_org_company', 6, '', '', '', '',  NOW(), NOW(), 1),
  (17, 1, 2, '1|17', 'PG-LN-AA', '辽宁公司', '佳兆业物业集团-辽宁物业分公司', 't_org_company', 7, '', '', '', '',  NOW(), NOW(), 1),
  (18, 1, 2, '1|18', 'PG-LN-DL', '大连公司', '佳兆业物业集团-大连物业分公司', 't_org_company', 10, '', '', '', '',  NOW(), NOW(), 1),
  (19, 1, 2, '1|19', 'PG-LN-SZ', '绥中公司', '佳兆业物业集团-绥中物业分公司', 't_org_company', 8, '', '', '', '',  NOW(), NOW(), 1),
  (20, 1, 2, '1|10', 'PG-SD-AA', '山东公司', '佳兆业物业集团-山东物业分公司', 't_org_company', 9, '', '', '', '',  NOW(), NOW(), 1),  
  (21, 1, 2, '1|21', 'PG-SX-AA', '山西公司', '佳兆业物业集团-山西物业分公司', 't_org_company', 11, '', '', '', '',  NOW(), NOW(), 1),
  (22, 1, 2, '1|22', 'PG-SH-AA', '上海公司', '佳兆业物业集团-上海物业分公司', 't_org_company', 12, '', '', '', '',  NOW(), NOW(), 1),
  (23, 1, 2, '1|23', 'PG-JS-AA', '江苏公司', '佳兆业物业集团-江苏物业分公司', 't_org_company', 13, '', '', '', '',  NOW(), NOW(), 1),
  (24, 1, 2, '1|24', 'PG-ZJ-HZ', '杭州公司', '佳兆业物业集团-杭州物业分公司', 't_org_company', 14, '', '', '', '',  NOW(), NOW(), 1),
  (25, 1, 2, '1|25', 'PG-HB-AA', '湖北公司', '佳兆业物业集团-湖北物业分公司', 't_org_company', 15, '', '', '', '',  NOW(), NOW(), 1),
  (26, 1, 2, '1|26', 'PG-HN-CS', '长沙公司', '佳兆业物业集团-长沙物业分公司', 't_org_company', 16, '', '', '', '',  NOW(), NOW(), 1),
  (27, 1, 2, '1|27', 'PG-CQ-AA', '重庆公司', '佳兆业物业集团-重庆物业分公司', 't_org_company', 17, '', '', '', '',  NOW(), NOW(), 1),
  (28, 1, 2, '1|28', 'PG-SC-CD', '成都公司', '佳兆业物业集团-成都物业分公司', 't_org_company', 18, '', '', '', '',  NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_sec_org_frame` ENABLE KEYS */;

-- -- /*!40000 ALTER TABLE `t_org_department` DISABLE KEYS */;
-- -- INSERT INTO `t_org_department` (`id`, `parent_id`, `department_division_id`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
  -- -- (10, 11, 1, 0, '佳兆业物业集团-深圳物业分公司-行政及人力资源部', '', '', '', '', NOW(), NOW(), 2),
  -- -- (11, 11, 2, 0, '佳兆业物业集团-深圳物业分公司-财务管理部', '', '', '', '', NOW(), NOW(), 2),
  -- -- (12, 11, 3, 0, '佳兆业物业集团-深圳物业分公司-采购管理部', '', '', '', '', NOW(), NOW(), 2),
  -- -- (13, 11, 6, 0, '佳兆业物业集团-深圳物业分公司-品质及客户服务部', '', '', '', '', NOW(), NOW(), 1),
  -- -- (14, 11, 8, 0, '佳兆业物业集团-深圳物业分公司-安全督察部', '', '', '', '', NOW(), NOW(), 1),
-- -- /*!40000 ALTER TABLE `t_org_department` ENABLE KEYS */;  
-- -- /*!40000 ALTER TABLE `t_sec_org_frame` DISABLE KEYS */;
-- -- INSERT INTO `t_sec_org_frame` (`id`, `parent_id`, `level`, `path`, `no`, `short_name`, `name`, `source`, `source_id`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
  -- -- (29, 11, 3, '1|11|29', 'PG-GD-SZ-AH', '深圳人力行政', '佳兆业物业集团-深圳物业分公司-行政及人力资源部', 't_org_department', 10, '', '', '', '',  NOW(), NOW(), 2),
  -- -- (30, 11, 3, '1|11|30', 'PG-GD-SZ-FM', '深圳财务', '佳兆业物业集团-深圳物业分公司-财务管理部', 't_org_department', 11, '', '', '', '',  NOW(), NOW(), 2),
  -- -- (31, 11, 3, '1|11|31', 'PG-GD-SZ-PM', '深圳采购', '佳兆业物业集团-深圳物业分公司-采购管理部', 't_org_department', 12, '', '', '', '',  NOW(), NOW(), 2),
  -- -- (32, 11, 3, '1|11|32', 'PG-GD-SZ-QC', '深圳品质', '佳兆业物业集团-深圳物业分公司-品质及客户服务部', 't_org_department', 13, '', '', '', '',  NOW(), NOW(), 1),
  -- -- (33, 11, 3, '1|11|33', 'PG-GD-SZ-SS', '深圳安全督查', '佳兆业物业集团-深圳物业分公司-安全督察部', 't_org_department', 14, '', '', '', '',  NOW(), NOW(), 1),
-- -- /*!40000 ALTER TABLE `t_sec_org_frame` ENABLE KEYS */;
-- -- (1, 'AH', '行政人力部', '行政及人力资源部', 'G,C', 0, 'Administration & Human resource Department', NOW(), NOW(), 2),
-- -- (2, 'FM', '财务部', '财务管理部', 'G,C', 0, 'Financial Management Department', NOW(), NOW(), 2),
-- -- (3, 'PM', '采购部', '采购管理部', 'G,C', 0, 'Purchase Management Department', NOW(), NOW(), 2),
-- -- (6, 'QC', '品质部', '品质及客户服务部', 'G,C', 0, 'Quality & Customer service Department', NOW(), NOW(), 1),
-- -- (8, 'SS', '安全督察部', '安全督察部', 'G,C', 0, 'Security & Supervision Department', NOW(), NOW(), 1),

-- 导入默认公司级部门
INSERT INTO `t_org_department` (`parent_id`, `department_division_id`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`)
SELECT
-- *,
	sof.id AS `parent_id`,
	dv.id AS `department_division_id`,
	0 AS `state`,
	CONCAT('佳兆业物业集团-', c.name, '-', dv.name) AS `description`,
	'' AS `ext_1`,'' AS `ext_2`,'' AS `ext_3`,'' AS `ext_4`,
	NOW() AS `meta_created`, NOW() AS `meta_updated`, dv.meta_logic_flag AS `meta_logic_flag`
FROM
	t_org_company c CROSS JOIN
	t_org_department_division dv LEFT JOIN
	t_sec_org_frame sof ON c.id = sof.source_id
WHERE
	LOCATE('C', dv.scope) > 0 AND
	sof.source = 't_org_company'
ORDER BY
	c.id, dv.id;

-- 插入org_frame
INSERT INTO `t_sec_org_frame` (`parent_id`, `level`, `path`, `no`, `short_name`, `name`, `source`, `source_id`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) 
SELECT 
-- 	*,
	d.parent_id AS `parent_id`,
	3 AS `level`,
	sof.path AS `path`,
	CONCAT(c.code, '-', dv.code) AS `no`, 
	CONCAT(REPLACE(sof.short_name, '公司',''), dv.short_name) AS `short_name`, 
	d.description AS `name`, 
	't_org_department' AS `source`, 
	d.id AS `source_id`,
	'' AS `ext_1`,'' AS `ext_2`,'' AS `ext_3`,'' AS `ext_4`,
	NOW() AS `meta_created`, NOW() AS `meta_updated`, dv.meta_logic_flag AS `meta_logic_flag`
FROM
	t_org_department d LEFT JOIN
	t_org_department_division dv ON d.department_division_id = dv.id LEFT JOIN
	t_sec_org_frame sof ON d.parent_id = sof.id LEFT JOIN
	t_org_company c ON sof.source_id = c.id
WHERE
	d.parent_id > 1 
ORDER BY
	d.id;
 	-- c.id, dv.id;
-- 补充path
UPDATE t_sec_org_frame
SET path = CONCAT(path, '|', id)
WHERE level = 3;

-- -- TRUNCATE TABLE t_bpf_project_business_format;
/*!40000 ALTER TABLE `t_bpf_project_business_format` DISABLE KEYS */;
INSERT INTO `t_bpf_project_business_format` (`id`, `code`, `short_name`, `name`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
	(1, 'HO', '住宅', '住宅小区', 0, 'Cmn HO 住宅 house', '', '', '', '', NOW(), NOW(), 1),
	(2, 'CO', '商业', '商场&超市&商业综合体', 0, 'Com CO 商业 commercial', '', '', '', '', NOW(), NOW(), 1),
	(3, 'OF', '办公', '办公写字楼', 0, 'Ofc OF 办公 office', '', '', '', '', NOW(), NOW(), 1),
	(4, 'IP', '工业园', '工业园', 0, 'Ind IP 工业园 industrial park', '', '', '', '', NOW(), NOW(), 1),
	(5, 'CS', '文体', '文化体育设施', 0, 'Cas CS 文体 culture and sports', '', '', '', '', NOW(), NOW(), 1),
	(6, 'HS', '医院', '医院', 0, 'HS 医院 hospital', '', '', '', '', NOW(), NOW(), 1),
	(7, 'BK', '银行', '银行', 0, 'BK 银行 bank', '', '', '', '', NOW(), NOW(), 1),
	(8, 'SH', '学校', '学校', 0, 'SH 学校 school', '', '', '', '', NOW(), NOW(), 1),
	(9, 'PK', '公园', '公园', 0, 'PK 公园 park', '', '', '', '', NOW(), NOW(), 1),
	(10, 'FM', '农场', '农场', 0, 'FM 农场 farm', '', '', '', '', NOW(), NOW(), 1),
	(11, 'TR', '工地', '工地', 0, 'TR 工地 construction site', '', '', '', '', NOW(), NOW(), 1),
	(12, 'UR', '旧改', '旧城改造', 0, 'UR 旧改 urban redevelopment', '', '', '', '', NOW(), NOW(), 1),
	(13, 'CF', '案场', '地产销售案场', 0, 'CF 案场 case field', '', '', '', '', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_bpf_project_business_format` ENABLE KEYS */;

-- -- TRUNCATE TABLE t_bpf_occasion_division;
/*!40000 ALTER TABLE `t_bpf_occasion_division` DISABLE KEYS */;
INSERT INTO `t_bpf_occasion_division` (`id`, `code`, `short_name`, `name`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
	(1, 'M-PM', '项目管理', '项目管理', 0, 'M-PM 项目管理 project management', '', '', '', '', NOW(), NOW(), 1),
	(2, 'M-PO', '项目经营', '项目经营', 0, 'M-PO 项目经营 project operation', '', '', '', '', NOW(), NOW(), 1),
	(3, 'M-SR', '节能降耗', '节能降耗', 0, 'M-SR 节能降耗 Saving energy and reducing consumption', '', '', '', '', NOW(), NOW(), 1),
	(4, 'M-AD', '行政', '行政', 0, 'M-AD 行政 administration', '', '', '', '', NOW(), NOW(), 1),
	(5, 'M-FD', '前台', '前台', 0, 'M-FD 前台 front desk', '', '', '', '', NOW(), NOW(), 1),
	(6, 'M-OF', '办公室', '办公室', 0, 'office', '', '', '', '', NOW(), NOW(), 1),
	(7, 'O-GT', '小区大门', '小区大门', 0, 'gate', '', '', '', '', NOW(), NOW(), 1),
	(8, 'O-EX', '出入口', '出入口', 0, 'entry & exit', '', '', '', '', NOW(), NOW(), 1),
	(9, 'O-PK', '停车场', '停车场', 0, '', 'parking', '', '', '', NOW(), NOW(), 1),
	(10, 'O-MR', '主干道', '主干道', 0, '', 'master road', '', '', '', NOW(), NOW(), 1),
	(11, 'O-WS', '水景 ', '水景 ', 0, 'waterscape', '', '', '', '', NOW(), NOW(), 1),
	(12, 'O-PA', '公共区域', '公共区域', 0, 'public area', '', '', '', '', NOW(), NOW(), 1),
	(13, 'O-SP', '游泳池', '游泳池', 0, 'swimming pool ', '', '', '', '', NOW(), NOW(), 1),
	(14, 'O-SQ', '广场 ', '广场 ', 0, 'square', '', '', '', '', NOW(), NOW(), 1),
	(15, 'O-BD', '楼栋', '楼栋', 0, 'building', '', '', '', '', NOW(), NOW(), 1),
	(16, 'O-UL', '单元大堂', '单元大堂', 0, 'Unit of the lobby', '', '', '', '', NOW(), NOW(), 1),
	(17, 'O-NP', '通告招贴', '通告招贴', 0, 'notice & post', '', '', '', '', NOW(), NOW(), 1),
	(18, 'O-ET', '电梯', '电梯', 0, 'elevator', '', '', '', '', NOW(), NOW(), 1),
	(19, 'O-HO', '房产', '房产', 0, 'house', '', '', '', '', NOW(), NOW(), 1),
	(20, 'P-CC', '控制中心', '控制中心', 0, 'center control', '', '', '', '', NOW(), NOW(), 1),
	(21, 'P-DH', '设备房', '设备房', 0, '', 'device house', '', '', '', NOW(), NOW(), 1),
	(22, 'P-WH', '仓库', '仓库', 0, 'warehouse', '', '', '', '', NOW(), NOW(), 1),
	(23, 'P-EH', '电房', '电房', 0, 'electricity house', '', '', '', '', NOW(), NOW(), 1),
	(24, 'P-KY', '钥匙管理', '钥匙管理', 0, 'key management', '', '', '', '', NOW(), NOW(), 1),
	(25, 'S-FR', '消防安全', '消防安全', 0, 'Fire safety', '', '', '', '', NOW(), NOW(), 1),
	(26, 'S-SS', '秩序安全', '秩序安全', 0, 'Order safety(security house)', '', '', '', '', NOW(), NOW(), 1),
	(27, 'S-TR', '施工安全', '施工安全', 0, 'construction safety', '', '', '', '', NOW(), NOW(), 1),
	(28, 'S-ER', '工程设施', '工程设施', 0, 'Engineering facilities', '', '', '', '', NOW(), NOW(), 1),
	(29, 'S-ED', '工程设备', '工程设备', 0, 'Engineering device', '', '', '', '', NOW(), NOW(), 1),
	(30, 'S-EV', '环境管理', '环境管理', 0, 'Environment management', '', '', '', '', NOW(), NOW(), 1),
	(31, 'S-EF', '环境设施', '环境设施', 0, 'Environmental facilities', '', '', '', '', NOW(), NOW(), 1),
	(32, 'S-OS', '作业安全', '作业安全', 0, 'operation safety', '', '', '', '', NOW(), NOW(), 1),
	(33, 'I-PS', '停车场系统', '停车场系统 ', 0, 'parking system', '', '', '', '', NOW(), NOW(), 1),
	(34, 'I-AS', '门禁系统', '门禁系统', 0, 'access control system', '', '', '', '', NOW(), NOW(), 1),
	(35, 'I-MS', '监控系统', '监控系统', 0, 'monitoring system', '', '', '', '', NOW(), NOW(), 1),
	(36, 'I-FS', '消防系统', '消防系统', 0, 'fire protection system', '', '', '', '', NOW(), NOW(), 1),
	(37, 'I-ES', '电梯系统', '电梯系统', 0, 'elevator system', '', '', '', '', NOW(), NOW(), 1),
	(38, 'I-WT', '给排水系统', '给排水系统', 0, 'water supply and drainage system', '', '', '', '', NOW(), NOW(), 1),
	(39, 'I-CM', '通讯系统', '通讯系统', 0, 'communication system', '', '', '', '', NOW(), NOW(), 1),
	(40, 'X-UT', '通用', '通用', 0, 'utility', '', '', '', '', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_bpf_occasion_division` ENABLE KEYS */;

-- 插入project_business_format_occasion_division
-- -- TRUNCATE TABLE t_bpf_project_business_format_occasion_division;
INSERT INTO `t_bpf_project_business_format_occasion_division` (`project_business_format_id`, `occasion_division_id`, `state`, `description`, `meta_created`, `meta_updated`, `meta_logic_flag`) 
SELECT 
	bpf.id as project_business_format_id, 
	od.id as occasion_division_id, 
	0 as status, 
	'' as description, 
	NOW() AS `meta_created`, 
	NOW() AS `meta_updated`, 
	od.meta_logic_flag AS `meta_logic_flag` 
FROM t_bpf_project_business_format bpf CROSS JOIN t_bpf_occasion_division od 
ORDER BY project_business_format_id, occasion_division_id;

-- 导入小区
-- JP: jzy piazza 佳兆业广场
-- JC: jzy center 佳兆业中心
-- ZG: Zhongyang Guangchang 中央广场
-- AA: 省级物业公司
-- B: building 大厦
-- Y: 1
-- E: 2
-- S: 3
-- B: 8

-- -- TRUNCATE TABLE t_bpf_property_project;
/*!40000 ALTER TABLE `t_bpf_property_project` DISABLE KEYS */;
INSERT INTO `t_bpf_property_project` (`id`, `parent_id`, `project_business_format_id`, `city_id`, `no`, `short_name`, `name`, `longitude`, `latitude`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
	(1,  11, 1, 2096, 'PG-GD-SZ-JCYU', '深圳金翠园', '深圳金翠园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(2,  11, 1, 2096, 'PG-GD-SZ-GFYU', '深圳桂芳园', '深圳桂芳园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(3,  11, 1, 2096, 'PG-GD-SZ-KEYU', '深圳可园', '深圳可园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(4,  11, 1, 2096, 'PG-GD-SZ-MCYU', '深圳茗萃园', '深圳茗萃园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(5,  11, 1, 2096, 'PG-GD-SZ-SAXD', '深圳水岸新都', '深圳水岸新都', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(6,  11, 1, 2096, 'PG-GD-SZ-XRYU', '深圳香瑞园', '深圳香瑞园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(7,  11, 1, 2096, 'PG-GD-SZ-JCSZ', '深圳佳兆业中心', '深圳佳兆业中心', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(8,  11, 1, 2096, 'PG-GD-SZ-SPYY', '深圳上品雅园', '深圳上品雅园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(9,  11, 1, 2096, 'PG-GD-SZ-DDHU', '深圳大都汇', '深圳大都汇', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(10, 11, 1, 2096, 'PG-GD-SZ-SHMC', '深圳山海美域', '深圳山海美域', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(11, 11, 1, 2096, 'PG-GD-SZ-JRGC', '深圳假日广场', '深圳假日广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(12, 11, 1, 2096, 'PG-GD-SZ-XDHU', '深圳新都汇', '深圳新都汇', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(13, 11, 1, 2096, 'PG-GD-SZ-DSXQ', '深圳东山小区', '深圳东山小区', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(14, 11, 1, 2096, 'PG-GD-SZ-ZGYI', '深圳中央广场一期', '深圳中央广场一期', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(15, 11, 1, 2096, 'PG-GD-SZ-SHZX', '深圳山海中心', '深圳山海中心', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(16, 11, 1, 2096, 'PG-GD-SZ-YFHY', '深圳悦峰花园', '深圳悦峰花园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(17, 11, 1, 2096, 'PG-GD-SZ-JPBJ', '深圳布吉佳兆业广场', '深圳布吉佳兆业广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(18, 11, 1, 2096, 'PG-GD-SZ-ZGES', '深圳中央广场二三期', '深圳中央广场二三期', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(19, 11, 1, 2096, 'PG-GD-SZ-YKHY', '深圳愉康花园', '深圳愉康花园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(20, 11, 1, 2096, 'PG-GD-SZ-NYXC', '深圳南园新村', '深圳南园新村', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(21, 11, 1, 2096, 'PG-GD-SZ-XJKO', '深圳新街口', '深圳新街口', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(22, 11, 1, 2096, 'PG-GD-SZ-JPDP', '深圳大鹏佳兆业广场', '深圳大鹏佳兆业广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(23, 11, 1, 2096, 'PG-GD-SZ-SHYU', '深圳山海苑', '深圳山海苑', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(24, 11, 1, 2096, 'PG-GD-SZ-XDCH', '深圳现代城华庭', '深圳现代城华庭', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(25, 12, 1, 2073, 'PG-GD-GZ-ZSHB', '广州中石化大厦', '广州中石化大厦', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(26, 12, 1, 2073, 'PG-GD-GZ-JHSP', '广州君汇上品', '广州君汇上品', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(27, 12, 1, 2073, 'PG-GD-GZ-JPGZ', '广州佳兆业广场', '广州佳兆业广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(28, 12, 1, 2073, 'PG-GD-GZ-BTGJ', '广州邦泰国际公寓', '广州邦泰国际公寓', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(29, 12, 1, 2073, 'PG-GD-GZ-CSGC', '广州城市广场', '广州城市广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(30, 13, 1, 2197, 'PG-GD-DG-CSLZ', '东莞城市绿洲', '东莞城市绿洲', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(31, 13, 1, 2197, 'PG-GD-DG-ZYHM', '东莞中央豪门', '东莞中央豪门', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(32, 13, 1, 2197, 'PG-GD-DG-DJWA', '东莞帝景湾', '东莞帝景湾', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(33, 13, 1, 2197, 'PG-GD-DG-DJHM', '东莞东江豪门', '东莞东江豪门', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(34, 13, 1, 2197, 'PG-GD-DG-SASC', '东莞水岸山城', '东莞水岸山城', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(35, 13, 1, 2197, 'PG-GD-DG-SAHM', '东莞水岸豪门', '东莞水岸豪门', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(36, 13, 1, 2197, 'PG-GD-DG-BHYT', '东莞碧海云天', '东莞碧海云天', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(37, 13, 1, 2197, 'PG-GD-DG-YLSH', '东莞御龙山', '东莞御龙山', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(38, 14, 1, 2156, 'PG-GD-HZ-DJXC', '惠州东江新城', '惠州东江新城', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(39, 14, 1, 2156, 'PG-GD-HZ-JCHZ', '惠州佳兆业中心', '惠州佳兆业中心', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(40, 14, 1, 2156, 'PG-GD-HZ-JZYY', '惠州佳兆业壹号', '惠州佳兆业壹号', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(41, 14, 1, 2156, 'PG-GD-HZ-KXHF', '惠东凯旋华府', '惠东凯旋华府', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(42, 14, 1, 2156, 'PG-GD-HZ-JCHS', '惠州佳兆业中心三期', '惠州佳兆业中心三期', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(43, 14, 1, 2156, 'PG-GD-HZ-YYJI', '惠州恩平山语雅景', '惠州恩平山语雅景', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(44, 15, 1, 2117, 'PG-GD-FS-JHSP', '佛山君汇上品', '佛山君汇上品', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(45, 15, 1, 2117, 'PG-GD-FS-XTKY', '佛山杏坛可园', '佛山杏坛可园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(46, 15, 1, 2117, 'PG-GD-FS-JYTX', '佛山金域天下', '佛山金域天下', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(47, 15, 1, 2117, 'PG-GD-FS-SAXD', '佛山水岸新都', '佛山水岸新都', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(48, 16, 1, 2105, 'PG-GD-ZH-SAHD', '珠海水岸华都', '珠海水岸华都', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(49, 16, 1, 2105, 'PG-GD-ZH-YJSH', '珠海御金山', '珠海御金山', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(50, 16, 1, 2105, 'PG-GD-ZH-HWBS', '珠海海湾半山', '珠海海湾半山', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(51, 17, 1, 540, 'PG-LN-AA-SAXD', '本溪水岸新都', '本溪水岸新都', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(52, 17, 1, 585, 'PG-LN-AA-JCPJ', '盘锦佳兆业中心', '盘锦佳兆业中心', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(53, 17, 1, 562, 'PG-LN-AA-YKLW', '营口龙湾', '营口龙湾', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(54, 17, 1, 524, 'PG-LN-AA-SAHF', '鞍山水岸华府', '鞍山水岸华府', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(55, 17, 1, 562, 'PG-LN-AA-JHSP', '营口君汇上品', '营口君汇上品', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(56, 17, 1, 547, 'PG-LN-AA-JZYY', '丹东佳兆业壹号', '丹东佳兆业壹号', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(57, 17, 1, 499, 'PG-LN-AA-JCSY', '沈阳佳兆业中心', '沈阳佳兆业中心', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(58, 17, 1, 498, 'PG-LN-AA-KXHY', '辽宁凯馨花园', '辽宁凯馨花园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(59, 17, 1, 524, 'PG-LN-AA-JPAS', '鞍山佳兆业广场', '鞍山佳兆业广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
  	(60, 18, 1, 513, 'PG-LN-DL-JHSP', '大连君汇上品', '大连君汇上品', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(61, 18, 1, 513, 'PG-LN-DL-JCDL', '大连佳兆业中心', '大连佳兆业中心', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(62, 19, 1, 498, 'PG-LN-SZ-DDHE', '绥中东戴河', '绥中东戴河', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(63, 20, 1, 1437, 'PG-SD-AA-SAXD', '青岛水岸新都', '青岛水岸新都', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(64, 20, 1, 1488, 'PG-SD-AA-GEFU', '潍坊高尔夫', '潍坊高尔夫', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(65, 20, 1, 1437, 'PG-SD-AA-DFYY', '青岛东方雅苑', '青岛东方雅苑', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(66, 21, 1, 240, 'PG-SX-AA-DRLS', '太原东瑞揽胜', '太原东瑞揽胜', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(67, 22, 1, 840, 'PG-SH-AA-SAHF', '上海水岸华府', '上海水岸华府', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(68, 22, 1, 840, 'PG-SH-AA-SHWA', '上海珊瑚湾', '上海珊瑚湾', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(69, 22, 1, 840, 'PG-SH-AA-SPYY', '上海尚品雅苑', '上海尚品雅苑', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(70, 22, 1, 840, 'PG-SH-AA-XYYY', '上海香溢雅园', '上海香溢雅园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(71, 22, 1, 840, 'PG-SH-AA-SAYY', '上海水岸雅苑', '上海水岸雅苑', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(72, 23, 1, 876, 'PG-JS-AA-YHGG', '江阴壹号公馆', '江阴壹号公馆', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(73, 23, 1, 876, 'PG-JS-AA-SAXD', '江阴水岸新都', '江阴水岸新都', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(74, 23, 1, 876, 'PG-JS-AA-JYKY', '江阴可园', '江阴可园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(75, 23, 1, 876, 'PG-JS-AA-JYTX', '江阴金域天下', '江阴金域天下', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(76, 23, 1, 876, 'PG-JS-AA-YFHY', '江阴御峰花园', '江阴御峰花园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(77, 23, 1, 857, 'PG-JS-AA-FHHY', '江苏凤凰湖壹号', '江苏凤凰湖壹号', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(78, 23, 1, 876, 'PG-JS-AA-SAHF', '江阴水岸华府', '江阴水岸华府', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(79, 23, 1, 876, 'PG-JS-AA-JPJY', '江阴佳兆业广场', '江阴佳兆业广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(80, 23, 1, 897, 'PG-JS-AA-JHSP', '苏州君汇上品', '苏州君汇上品', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(81, 23, 1, 963, 'PG-JS-AA-YHGG', '泰州壹号公馆', '泰州壹号公馆', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(82, 23, 1, 897, 'PG-JS-AA-YFHY', '苏州悦峰花园', '苏州悦峰花园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(83, 23, 1, 858, 'PG-JS-AA-JZYC', '南京佳兆业城市广场', '南京佳兆业城市广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(84, 23, 1, 876, 'PG-JS-AA-JZHY', '江阴金泽花园', '江阴金泽花园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(85, 23, 1, 908, 'PG-JS-AA-TYZX', '江苏南通海安体育中心', '江苏南通海安体育中心', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(86, 24, 1, 979, 'PG-ZJ-HZ-JLYY', '杭州玖珑雅苑', '杭州玖珑雅苑', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(87, 24, 1, 979, 'PG-ZJ-HZ-JHSP', '杭州君汇上品', '杭州君汇上品', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(88, 24, 1, 979, 'PG-ZJ-HZ-XXPY', '杭州西溪璞园', '杭州西溪璞园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(89, 24, 1, 1031, 'PG-ZJ-HZ-JHSP', '绍兴君汇上品', '绍兴君汇上品', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(90, 25, 1, 1800, 'PG-HB-AA-JYTX', '武汉金域天下', '武汉金域天下', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(91, 25, 1, 1800, 'PG-HB-AA-WHYH', '湖北武汉壹号', '湖北武汉壹号', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(92, 26, 1, 1919, 'PG-HN-CS-SAXD', '长沙水岸新都', '长沙水岸新都', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(93, 26, 1, 1919, 'PG-HN-CS-JHSP', '长沙君汇上品', '长沙君汇上品', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(94, 26, 1, 1929, 'PG-HN-CS-JYTX', '株洲金域天下', '株洲金域天下', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(95, 26, 1, 1919, 'PG-HN-CS-SDGC', '长沙时代广场', '长沙时代广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(96, 26, 1, 1919, 'PG-HN-CS-MXHU', '长沙云顶梅溪湖', '长沙云顶梅溪湖', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(97, 26, 1, 1919, 'PG-HN-CS-JZYB', '长沙佳兆业8号', '长沙佳兆业8号', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(98, 27, 1, 2372, 'PG-CQ-AA-JPCQ', '重庆佳兆业广场', '重庆佳兆业广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(99, 27, 1, 2372, 'PG-CQ-AA-BJXC', '重庆滨江新城', '重庆滨江新城', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(100, 27, 1, 2372, 'PG-CQ-AA-JPCE', '重庆佳兆业广场二期二标', '重庆佳兆业广场二期二标', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(101, 28, 1, 2422, 'PG-SC-CD-JZYB', '双流佳兆业八号', '双流佳兆业八号', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(102, 28, 1, 2421, 'PG-SC-CD-LJGA', '温江丽晶港', '温江丽晶港', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(103, 28, 1, 2412, 'PG-SC-CD-JSHY', '华阳君汇上品', '华阳君汇上品', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(104, 28, 1, 2504, 'PG-SC-CD-JPNJ', '南充佳兆业广场', '南充佳兆业广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(105, 28, 1, 2504, 'PG-SC-CD-JSNC', '南充君汇上品', '南充君汇上品', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(106, 28, 1, 2422, 'PG-SC-CD-XDCH', '双流现代城', '双流现代城', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(107, 28, 1, 2504, 'PG-SC-CD-NCJL', '南充君临', '南充君临', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(108, 28, 1, 2412, 'PG-SC-CD-JPCD', '成都佳兆业广场', '成都佳兆业广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(109, 28, 1, 2412, 'PG-SC-CD-WXGJ', '什邡万象国际城', '什邡万象国际城', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(110, 28, 1, 2412, 'PG-SC-CD-LJGG', '成都丽晶公馆', '成都丽晶公馆', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
	(111, 28, 1, 2412, 'PG-SC-CD-JSTH', '成都高新锦尚天华', '成都高新锦尚天华', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_bpf_property_project` ENABLE KEYS */;

-- 插入occasion
-- -- TRUNCATE TABLE t_bpf_occasion;
INSERT INTO `t_bpf_occasion` (`property_project_id`, `occasion_division_id`, `state`, `description`, `meta_created`, `meta_updated`, `meta_logic_flag`) 
SELECT 
	bp.id as property_project_id, 
	od.id as occasion_division_id, 
	0 as state, 
	'' as description, 
	NOW() AS `meta_created`, 
	NOW() AS `meta_updated`, 
	od.meta_logic_flag AS `meta_logic_flag` 
FROM t_bpf_property_project bp CROSS JOIN t_bpf_occasion_division od 
ORDER BY property_project_id, occasion_division_id;

-- -- TRUNCATE TABLE t_bpf_cmnproject;
/*!40000 ALTER TABLE `t_bpf_cmnproject` DISABLE KEYS */;
INSERT INTO `t_bpf_cmnproject` (`property_project_id`, `state`, `description`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
	(1, 0, '深圳物业分公司-深圳金翠园', NOW(), NOW(), 1),
	(2, 0, '深圳物业分公司-深圳桂芳园', NOW(), NOW(), 1),
	(3, 0, '深圳物业分公司-深圳可园', NOW(), NOW(), 1),
	(4, 0, '深圳物业分公司-深圳茗萃园', NOW(), NOW(), 1),
	(5, 0, '深圳物业分公司-深圳水岸新都', NOW(), NOW(), 1),
	(6, 0, '深圳物业分公司-深圳香瑞园', NOW(), NOW(), 1),
	(7, 0, '深圳物业分公司-深圳佳兆业中心', NOW(), NOW(), 1),
	(8, 0, '深圳物业分公司-深圳上品雅园', NOW(), NOW(), 1),
	(9, 0, '深圳物业分公司-深圳大都汇', NOW(), NOW(), 1),
	(10, 0, '深圳物业分公司-深圳山海美域', NOW(), NOW(), 1),
	(11, 0, '深圳物业分公司-深圳假日广场', NOW(), NOW(), 1),
	(12, 0, '深圳物业分公司-深圳新都汇', NOW(), NOW(), 1),
	(13, 0, '深圳物业分公司-深圳东山小区', NOW(), NOW(), 1),
	(14, 0, '深圳物业分公司-深圳中央广场一期', NOW(), NOW(), 1),
	(15, 0, '深圳物业分公司-深圳山海中心', NOW(), NOW(), 1),
	(16, 0, '深圳物业分公司-深圳悦峰花园', NOW(), NOW(), 1),
	(17, 0, '深圳物业分公司-深圳布吉佳兆业广场', NOW(), NOW(), 1),
	(18, 0, '深圳物业分公司-深圳中央广场二三期', NOW(), NOW(), 1),
	(19, 0, '深圳物业分公司-深圳愉康花园', NOW(), NOW(), 1),
	(20, 0, '深圳物业分公司-深圳南园新村', NOW(), NOW(), 1),
	(21, 0, '深圳物业分公司-深圳新街口', NOW(), NOW(), 1),
	(22, 0, '深圳物业分公司-深圳大鹏佳兆业广场', NOW(), NOW(), 1),
	(23, 0, '深圳物业分公司-深圳山海苑', NOW(), NOW(), 1),
	(24, 0, '深圳物业分公司-深圳现代城华庭', NOW(), NOW(), 1),
	(25, 0, '广州物业分公司-广州中石化大厦', NOW(), NOW(), 1),
	(26, 0, '广州物业分公司-广州君汇上品', NOW(), NOW(), 1),
	(27, 0, '广州物业分公司-广州佳兆业广场', NOW(), NOW(), 1),
	(28, 0, '广州物业分公司-广州邦泰国际公寓', NOW(), NOW(), 1),
	(29, 0, '广州物业分公司-广州城市广场', NOW(), NOW(), 1),
	(30, 0, '东莞物业分公司-东莞城市绿洲', NOW(), NOW(), 1),
	(31, 0, '东莞物业分公司-东莞中央豪门', NOW(), NOW(), 1),
	(32, 0, '东莞物业分公司-东莞帝景湾', NOW(), NOW(), 1),
	(33, 0, '东莞物业分公司-东莞东江豪门', NOW(), NOW(), 1),
	(34, 0, '东莞物业分公司-东莞水岸山城', NOW(), NOW(), 1),
	(35, 0, '东莞物业分公司-东莞水岸豪门', NOW(), NOW(), 1),
	(36, 0, '东莞物业分公司-东莞碧海云天', NOW(), NOW(), 1),
	(37, 0, '东莞物业分公司-东莞御龙山', NOW(), NOW(), 1),
	(38, 0, '惠州物业分公司-惠州东江新城', NOW(), NOW(), 1),
	(39, 0, '惠州物业分公司-惠州佳兆业中心', NOW(), NOW(), 1),
	(40, 0, '惠州物业分公司-惠州佳兆业壹号', NOW(), NOW(), 1),
	(41, 0, '惠州物业分公司-惠东凯旋华府', NOW(), NOW(), 1),
	(42, 0, '惠州物业分公司-惠州佳兆业中心三期', NOW(), NOW(), 1),
	(43, 0, '惠州物业分公司-惠州恩平山语雅景', NOW(), NOW(), 1),
	(44, 0, '佛山物业分公司-佛山君汇上品', NOW(), NOW(), 1),
	(45, 0, '佛山物业分公司-佛山杏坛可园', NOW(), NOW(), 1),
	(46, 0, '佛山物业分公司-佛山金域天下', NOW(), NOW(), 1),
	(47, 0, '佛山物业分公司-佛山水岸新都', NOW(), NOW(), 1),
	(48, 0, '珠海物业分公司-珠海水岸华都', NOW(), NOW(), 1),
	(49, 0, '珠海物业分公司-珠海御金山', NOW(), NOW(), 1),
	(50, 0, '珠海物业分公司-珠海海湾半山', NOW(), NOW(), 1),
	(51, 0, '辽宁物业分公司-本溪水岸新都', NOW(), NOW(), 1),
	(52, 0, '辽宁物业分公司-盘锦佳兆业中心', NOW(), NOW(), 1),
	(53, 0, '辽宁物业分公司-营口龙湾', NOW(), NOW(), 1),
	(54, 0, '辽宁物业分公司-鞍山水岸华府', NOW(), NOW(), 1),
	(55, 0, '辽宁物业分公司-营口君汇上品', NOW(), NOW(), 1),
	(56, 0, '辽宁物业分公司-丹东佳兆业壹号', NOW(), NOW(), 1),
	(57, 0, '辽宁物业分公司-沈阳佳兆业中心', NOW(), NOW(), 1),
	(58, 0, '辽宁物业分公司-辽宁凯馨花园', NOW(), NOW(), 1),
	(59, 0, '辽宁物业分公司-鞍山佳兆业广场', NOW(), NOW(), 1),
    (60, 0, '大连物业分公司-大连君汇上品', NOW(), NOW(), 1),
	(61, 0, '大连物业分公司-大连佳兆业中心', NOW(), NOW(), 1),
	(62, 0, '绥中物业分公司-绥中东戴河', NOW(), NOW(), 1),
	(63, 0, '山东物业分公司-青岛水岸新都', NOW(), NOW(), 1),
	(64, 0, '山东物业分公司-潍坊高尔夫', NOW(), NOW(), 1),
	(65, 0, '山东物业分公司-青岛东方雅苑', NOW(), NOW(), 1),
	(66, 0, '山西物业分公司-太原东瑞揽胜', NOW(), NOW(), 1),
	(67, 0, '上海物业分公司-上海水岸华府', NOW(), NOW(), 1),
	(68, 0, '上海物业分公司-上海珊瑚湾', NOW(), NOW(), 1),
	(69, 0, '上海物业分公司-上海尚品雅苑', NOW(), NOW(), 1),
	(70, 0, '上海物业分公司-上海香溢雅园', NOW(), NOW(), 1),
	(71, 0, '上海物业分公司-上海水岸雅苑', NOW(), NOW(), 1),
	(72, 0, '江苏物业分公司-江阴壹号公馆', NOW(), NOW(), 1),
	(73, 0, '江苏物业分公司-江阴水岸新都', NOW(), NOW(), 1),
	(74, 0, '江苏物业分公司-江阴可园', NOW(), NOW(), 1),
	(75, 0, '江苏物业分公司-江阴金域天下', NOW(), NOW(), 1),
	(76, 0, '江苏物业分公司-江阴御峰花园', NOW(), NOW(), 1),
	(77, 0, '江苏物业分公司-江苏凤凰湖壹号', NOW(), NOW(), 1),
	(78, 0, '江苏物业分公司-江阴水岸华府', NOW(), NOW(), 1),
	(79, 0, '江苏物业分公司-江阴佳兆业广场', NOW(), NOW(), 1),
	(80, 0, '江苏物业分公司-苏州君汇上品', NOW(), NOW(), 1),
	(81, 0, '江苏物业分公司-泰州壹号公馆', NOW(), NOW(), 1),
	(82, 0, '江苏物业分公司-苏州悦峰花园', NOW(), NOW(), 1),
	(83, 0, '江苏物业分公司-南京佳兆业城市广场', NOW(), NOW(), 1),
	(84, 0, '江苏物业分公司-江阴金泽花园', NOW(), NOW(), 1),
	(85, 0, '江苏物业分公司-江苏南通海安体育中心', NOW(), NOW(), 1),
	(86, 0, '杭州物业分公司-杭州玖珑雅苑', NOW(), NOW(), 1),
	(87, 0, '杭州物业分公司-杭州君汇上品', NOW(), NOW(), 1),
	(88, 0, '杭州物业分公司-杭州西溪璞园', NOW(), NOW(), 1),
	(89, 0, '杭州物业分公司-绍兴君汇上品', NOW(), NOW(), 1),
	(90, 0, '湖北物业分公司-武汉金域天下', NOW(), NOW(), 1),
	(91, 0, '湖北物业分公司-湖北武汉壹号', NOW(), NOW(), 1),
	(92, 0, '长沙物业分公司-长沙水岸新都', NOW(), NOW(), 1),
	(93, 0, '长沙物业分公司-长沙君汇上品', NOW(), NOW(), 1),
	(94, 0, '长沙物业分公司-株洲金域天下', NOW(), NOW(), 1),
	(95, 0, '长沙物业分公司-长沙时代广场', NOW(), NOW(), 1),
	(96, 0, '长沙物业分公司-长沙云顶梅溪湖', NOW(), NOW(), 1),
	(97, 0, '长沙物业分公司-长沙佳兆业8号', NOW(), NOW(), 1),
	(98, 0, '重庆物业分公司-重庆佳兆业广场', NOW(), NOW(), 1),
	(99, 0, '重庆物业分公司-重庆滨江新城', NOW(), NOW(), 1),
	(100, 0, '重庆物业分公司-重庆佳兆业广场二期二标', NOW(), NOW(), 1),
	(101, 0, '成都物业分公司-双流佳兆业八号', NOW(), NOW(), 1),
	(102, 0, '成都物业分公司-温江丽晶港', NOW(), NOW(), 1),
	(103, 0, '成都物业分公司-华阳君汇上品', NOW(), NOW(), 1),
	(104, 0, '成都物业分公司-南充佳兆业广场', NOW(), NOW(), 1),
	(105, 0, '成都物业分公司-南充君汇上品', NOW(), NOW(), 1),
	(106, 0, '成都物业分公司-双流现代城', NOW(), NOW(), 1),
	(107, 0, '成都物业分公司-南充君临', NOW(), NOW(), 1),
	(108, 0, '成都物业分公司-成都佳兆业广场', NOW(), NOW(), 1),
	(109, 0, '成都物业分公司-什邡万象国际城', NOW(), NOW(), 1),
	(110, 0, '成都物业分公司-成都丽晶公馆', NOW(), NOW(), 1),
	(111, 0, '成都物业分公司-成都高新锦尚天华', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_bpf_cmnproject` ENABLE KEYS */;

-- -- TRUNCATE TABLE t_cmn_community;
-- /*!40000 ALTER TABLE `t_cmn_community` DISABLE KEYS */;
-- INSERT INTO `t_cmn_community` (`id`, `parent_id`, `no`, `short_name`, `name`, `longitude`, `latitude`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
-- 	(1, 11, 'PG-GD-SZ-JCYU', '深圳金翠园', '深圳金翠园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(2, 11, 'PG-GD-SZ-GFYU', '深圳桂芳园', '深圳桂芳园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(3, 11, 'PG-GD-SZ-KEYU', '深圳可园', '深圳可园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(4, 11, 'PG-GD-SZ-MCYU', '深圳茗萃园', '深圳茗萃园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(5, 11, 'PG-GD-SZ-SAXD', '深圳水岸新都', '深圳水岸新都', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(6, 11, 'PG-GD-SZ-XRYU', '深圳香瑞园', '深圳香瑞园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(7, 11, 'PG-GD-SZ-JCSZ', '深圳佳兆业中心', '深圳佳兆业中心', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(8, 11, 'PG-GD-SZ-SPYY', '深圳上品雅园', '深圳上品雅园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(9, 11, 'PG-GD-SZ-DDHU', '深圳大都汇', '深圳大都汇', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(10, 11, 'PG-GD-SZ-SHMC', '深圳山海美域', '深圳山海美域', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(11, 11, 'PG-GD-SZ-JRGC', '深圳假日广场', '深圳假日广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(12, 11, 'PG-GD-SZ-XDHU', '深圳新都汇', '深圳新都汇', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(13, 11, 'PG-GD-SZ-DSXQ', '深圳东山小区', '深圳东山小区', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(14, 11, 'PG-GD-SZ-ZGYI', '深圳中央广场一期', '深圳中央广场一期', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(15, 11, 'PG-GD-SZ-SHZX', '深圳山海中心', '深圳山海中心', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(16, 11, 'PG-GD-SZ-YFHY', '深圳悦峰花园', '深圳悦峰花园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(17, 11, 'PG-GD-SZ-JPBJ', '深圳布吉佳兆业广场', '深圳布吉佳兆业广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(18, 11, 'PG-GD-SZ-ZGES', '深圳中央广场二三期', '深圳中央广场二三期', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(19, 11, 'PG-GD-SZ-YKHY', '深圳愉康花园', '深圳愉康花园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(20, 11, 'PG-GD-SZ-NYXC', '深圳南园新村', '深圳南园新村', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(21, 11, 'PG-GD-SZ-XJKO', '深圳新街口', '深圳新街口', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(22, 11, 'PG-GD-SZ-JPDP', '深圳大鹏佳兆业广场', '深圳大鹏佳兆业广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(23, 11, 'PG-GD-SZ-SHYU', '深圳山海苑', '深圳山海苑', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(24, 11, 'PG-GD-SZ-XDCH', '深圳现代城华庭', '深圳现代城华庭', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(25, 12, 'PG-GD-GZ-ZSHB', '广州中石化大厦', '广州中石化大厦', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(26, 12, 'PG-GD-GZ-JHSP', '广州君汇上品', '广州君汇上品', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(27, 12, 'PG-GD-GZ-JPGZ', '广州佳兆业广场', '广州佳兆业广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(28, 12, 'PG-GD-GZ-BTGJ', '广州邦泰国际公寓', '广州邦泰国际公寓', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(29, 12, 'PG-GD-GZ-CSGC', '广州城市广场', '广州城市广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(30, 13, 'PG-GD-DG-CSLZ', '东莞城市绿洲', '东莞城市绿洲', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(31, 13, 'PG-GD-DG-ZYHM', '东莞中央豪门', '东莞中央豪门', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(32, 13, 'PG-GD-DG-DJWA', '东莞帝景湾', '东莞帝景湾', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(33, 13, 'PG-GD-DG-DJHM', '东莞东江豪门', '东莞东江豪门', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(34, 13, 'PG-GD-DG-SASC', '东莞水岸山城', '东莞水岸山城', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(35, 13, 'PG-GD-DG-SAHM', '东莞水岸豪门', '东莞水岸豪门', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(36, 13, 'PG-GD-DG-BHYT', '东莞碧海云天', '东莞碧海云天', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(37, 13, 'PG-GD-DG-YLSH', '东莞御龙山', '东莞御龙山', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(38, 14, 'PG-GD-HZ-DJXC', '惠州东江新城', '惠州东江新城', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(39, 14, 'PG-GD-HZ-JCHZ', '惠州佳兆业中心', '惠州佳兆业中心', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(40, 14, 'PG-GD-HZ-JZYY', '惠州佳兆业壹号', '惠州佳兆业壹号', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(41, 14, 'PG-GD-HZ-KXHF', '惠东凯旋华府', '惠东凯旋华府', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(42, 14, 'PG-GD-HZ-JCHS', '惠州佳兆业中心三期', '惠州佳兆业中心三期', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(43, 14, 'PG-GD-HZ-YYJI', '惠州恩平山语雅景', '惠州恩平山语雅景', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(44, 15, 'PG-GD-FS-JHSP', '佛山君汇上品', '佛山君汇上品', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(45, 15, 'PG-GD-FS-XTKY', '佛山杏坛可园', '佛山杏坛可园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(46, 15, 'PG-GD-FS-JYTX', '佛山金域天下', '佛山金域天下', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(47, 15, 'PG-GD-FS-SAXD', '佛山水岸新都', '佛山水岸新都', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(48, 16, 'PG-GD-ZH-SAHD', '珠海水岸华都', '珠海水岸华都', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(49, 16, 'PG-GD-ZH-YJSH', '珠海御金山', '珠海御金山', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(50, 16, 'PG-GD-ZH-HWBS', '珠海海湾半山', '珠海海湾半山', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(51, 17, 'PG-LN-AA-SAXD', '本溪水岸新都', '本溪水岸新都', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(52, 17, 'PG-LN-AA-JCPJ', '盘锦佳兆业中心', '盘锦佳兆业中心', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(53, 17, 'PG-LN-AA-YKLW', '营口龙湾', '营口龙湾', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(54, 17, 'PG-LN-AA-SAHF', '鞍山水岸华府', '鞍山水岸华府', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(55, 17, 'PG-LN-AA-JHSP', '营口君汇上品', '营口君汇上品', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(56, 17, 'PG-LN-AA-JZYY', '丹东佳兆业壹号', '丹东佳兆业壹号', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(57, 17, 'PG-LN-AA-JCSY', '沈阳佳兆业中心', '沈阳佳兆业中心', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(58, 17, 'PG-LN-AA-KXHY', '辽宁凯馨花园', '辽宁凯馨花园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(59, 17, 'PG-LN-AA-JPAS', '鞍山佳兆业广场', '鞍山佳兆业广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
--   	(60, 18, 'PG-LN-DL-JHSP', '大连君汇上品', '大连君汇上品', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(61, 18, 'PG-LN-DL-JCDL', '大连佳兆业中心', '大连佳兆业中心', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(62, 19, 'PG-LN-SZ-DDHE', '绥中东戴河', '绥中东戴河', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(63, 20, 'PG-SD-AA-SAXD', '青岛水岸新都', '青岛水岸新都', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(64, 20, 'PG-SD-AA-GEFU', '潍坊高尔夫', '潍坊高尔夫', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(65, 20, 'PG-SD-AA-DFYY', '青岛东方雅苑', '青岛东方雅苑', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(66, 21, 'PG-SX-AA-DRLS', '太原东瑞揽胜', '太原东瑞揽胜', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(67, 22, 'PG-SH-AA-SAHF', '上海水岸华府', '上海水岸华府', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(68, 22, 'PG-SH-AA-SHWA', '上海珊瑚湾', '上海珊瑚湾', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(69, 22, 'PG-SH-AA-SPYY', '上海尚品雅苑', '上海尚品雅苑', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(70, 22, 'PG-SH-AA-XYYY', '上海香溢雅园', '上海香溢雅园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(71, 22, 'PG-SH-AA-SAYY', '上海水岸雅苑', '上海水岸雅苑', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(72, 23, 'PG-JS-AA-YHGG', '江阴壹号公馆', '江阴壹号公馆', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(73, 23, 'PG-JS-AA-SAXD', '江阴水岸新都', '江阴水岸新都', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(74, 23, 'PG-JS-AA-JYKY', '江阴可园', '江阴可园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(75, 23, 'PG-JS-AA-JYTX', '江阴金域天下', '江阴金域天下', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(76, 23, 'PG-JS-AA-YFHY', '江阴御峰花园', '江阴御峰花园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(77, 23, 'PG-JS-AA-FHHY', '江苏凤凰湖壹号', '江苏凤凰湖壹号', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(78, 23, 'PG-JS-AA-SAHF', '江阴水岸华府', '江阴水岸华府', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(79, 23, 'PG-JS-AA-JPJY', '江阴佳兆业广场', '江阴佳兆业广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(80, 23, 'PG-JS-AA-JHSP', '苏州君汇上品', '苏州君汇上品', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(81, 23, 'PG-JS-AA-YHGG', '泰州壹号公馆', '泰州壹号公馆', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(82, 23, 'PG-JS-AA-YFHY', '苏州悦峰花园', '苏州悦峰花园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(83, 23, 'PG-JS-AA-JZYC', '南京佳兆业城市广场', '南京佳兆业城市广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(84, 23, 'PG-JS-AA-JZHY', '江阴金泽花园', '江阴金泽花园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(85, 23, 'PG-JS-AA-TYZX', '江苏南通海安体育中心', '江苏南通海安体育中心', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(86, 24, 'PG-ZJ-HZ-JLYY', '杭州玖珑雅苑', '杭州玖珑雅苑', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(87, 24, 'PG-ZJ-HZ-JHSP', '杭州君汇上品', '杭州君汇上品', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(88, 24, 'PG-ZJ-HZ-XXPY', '杭州西溪璞园', '杭州西溪璞园', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(89, 24, 'PG-ZJ-HZ-JHSP', '绍兴君汇上品', '绍兴君汇上品', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(90, 25, 'PG-HB-AA-JYTX', '武汉金域天下', '武汉金域天下', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(91, 25, 'PG-HB-AA-WHYH', '湖北武汉壹号', '湖北武汉壹号', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(92, 26, 'PG-HN-CS-SAXD', '长沙水岸新都', '长沙水岸新都', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(93, 26, 'PG-HN-CS-JHSP', '长沙君汇上品', '长沙君汇上品', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(94, 26, 'PG-HN-CS-JYTX', '株洲金域天下', '株洲金域天下', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(95, 26, 'PG-HN-CS-SDGC', '长沙时代广场', '长沙时代广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(96, 26, 'PG-HN-CS-MXHU', '长沙云顶梅溪湖', '长沙云顶梅溪湖', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(97, 26, 'PG-HN-CS-JZYB', '长沙佳兆业8号', '长沙佳兆业8号', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(98, 27, 'PG-CQ-AA-JPCQ', '重庆佳兆业广场', '重庆佳兆业广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(99, 27, 'PG-CQ-AA-BJXC', '重庆滨江新城', '重庆滨江新城', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(100, 27, 'PG-CQ-AA-JPCE', '重庆佳兆业广场二期二标', '重庆佳兆业广场二期二标', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(101, 28, 'PG-SC-CD-JZYB', '双流佳兆业八号', '双流佳兆业八号', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(102, 28, 'PG-SC-CD-LJGA', '温江丽晶港', '温江丽晶港', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(103, 28, 'PG-SC-CD-JSHY', '华阳君汇上品', '华阳君汇上品', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(104, 28, 'PG-SC-CD-JPNJ', '南充佳兆业广场', '南充佳兆业广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(105, 28, 'PG-SC-CD-JSNC', '南充君汇上品', '南充君汇上品', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(106, 28, 'PG-SC-CD-XDCH', '双流现代城', '双流现代城', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(107, 28, 'PG-SC-CD-NCJL', '南充君临', '南充君临', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(108, 28, 'PG-SC-CD-JPCD', '成都佳兆业广场', '成都佳兆业广场', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(109, 28, 'PG-SC-CD-WXGJ', '什邡万象国际城', '什邡万象国际城', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(110, 28, 'PG-SC-CD-LJGG', '成都丽晶公馆', '成都丽晶公馆', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1),
-- 	(111, 28, 'PG-SC-CD-JSTH', '成都高新锦尚天华', '成都高新锦尚天华', '', '', 0, '', '', '', '', '', NOW(), NOW(), 1);
-- /*!40000 ALTER TABLE `t_cmn_community` ENABLE KEYS */;

-- 插入org_frame
INSERT INTO `t_sec_org_frame` (`parent_id`, `level`, `path`, `no`, `short_name`, `name`, `source`, `source_id`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) 
SELECT 
-- 	*,
	bp.parent_id AS `parent_id`,
	3 AS `level`,
	sof.path AS `path`,
	bp.no AS `no`, 
	bp.short_name AS `short_name`, 
	bp.name AS `name`, 
	't_bpf_cmnproject' AS `source`, 
	bp.id AS `source_id`,
	'' AS `ext_1`,'' AS `ext_2`,'' AS `ext_3`,'' AS `ext_4`,
	NOW() AS `meta_created`, NOW() AS `meta_updated`, bp.meta_logic_flag AS `meta_logic_flag`
FROM
	t_bpf_property_project bp LEFT JOIN
	t_sec_org_frame sof ON bp.parent_id = sof.id LEFT JOIN
	t_org_company c ON sof.source_id = c.id;

-- 补充path
UPDATE t_sec_org_frame
SET path = CONCAT(path, '|', id)
WHERE source = 't_bpf_cmnproject';

-- 导入默认项目级部门
INSERT INTO `t_org_department` (`parent_id`, `department_division_id`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`)
SELECT
-- *,
	sof.id AS `parent_id`,
	dv.id AS `department_division_id`,
	0 AS `state`,
	CONCAT(sofc.name, '-', bp.name, '-', dv.name) AS `description`,
	'' AS `ext_1`,'' AS `ext_2`,'' AS `ext_3`,'' AS `ext_4`,
	NOW() AS `meta_created`, NOW() AS `meta_updated`, dv.meta_logic_flag AS `meta_logic_flag`
FROM
	t_bpf_property_project bp CROSS JOIN
	t_org_department_division dv LEFT JOIN
	t_sec_org_frame sof ON bp.id = sof.source_id LEFT JOIN
	t_sec_org_frame sofc ON bp.parent_id = sofc.id
WHERE
	LOCATE('P', dv.scope) > 0 AND
	sof.source = 't_bpf_cmnproject'
ORDER BY
	bp.id, dv.id;

-- 插入org_frame
INSERT INTO `t_sec_org_frame` (`parent_id`, `level`, `path`, `no`, `short_name`, `name`, `source`, `source_id`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) 
SELECT 
-- 	*,
	d.parent_id AS `parent_id`,
	4 AS `level`,
	sof.path AS `path`,
	CONCAT(bp.no, '-', dv.code) AS `no`, 
	CONCAT(REPLACE(sof.short_name, '公司',''), dv.short_name) AS `short_name`, 
	d.description AS `name`, 
	't_org_department' AS `source`, 
	d.id AS `source_id`,
	'' AS `ext_1`,'' AS `ext_2`,'' AS `ext_3`,'' AS `ext_4`,
	NOW() AS `meta_created`, NOW() AS `meta_updated`, dv.meta_logic_flag AS `meta_logic_flag`
FROM
	t_org_department d LEFT JOIN
	t_org_department_division dv ON d.department_division_id = dv.id LEFT JOIN
	t_sec_org_frame sof ON d.parent_id = sof.id LEFT JOIN
	t_bpf_property_project bp ON sof.source_id = bp.id
WHERE
	d.parent_id > 118
ORDER BY
	d.id;

-- 补充path
UPDATE t_sec_org_frame
SET path = CONCAT(path, '|', id)
WHERE level = 4;

-- 部门
-- -----------------------------------------------------------------------------------
-- 岗位

-- -- TRUNCATE TABLE t_org_position
-- /*!40000 ALTER TABLE `t_org_position` DISABLE KEYS */;
-- INSERT INTO `t_org_position` (`id`, `department_id`, `position_division_id`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
-- (1, 1, 1, 0, ' ', '', '', '', '', '2018-07-21 16:07:01', '2018-07-21 16:07:01', 0);
-- /*!40000 ALTER TABLE `t_org_position` ENABLE KEYS */;
-- 集团部门岗位
INSERT INTO `t_org_position` (`department_id`, `position_division_id`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`)
SELECT
-- 	*,
d.id AS `department_id`,
pd.id AS `position_division_id`,
0 AS `state`,
CONCAT(d.description, '-', pd.short_name) AS `description`,
'' AS `ext_1`,'' AS `ext_2`,'' AS `ext_3`,'' AS `ext_4`,
NOW() AS `meta_created`, NOW() AS `meta_updated`, pd.meta_logic_flag AS `meta_logic_flag`
FROM
t_org_department d CROSS JOIN
t_org_position_division pd
WHERE
	LOCATE('G', pd.scope) > 0 AND d.parent_id = 1
ORDER BY
  d.id, pd.id;
  
-- 分公司部门岗位
INSERT INTO `t_org_position` (`department_id`, `position_division_id`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`)
SELECT
-- 	*,
d.id AS `department_id`,
pd.id AS `position_division_id`,
0 AS `state`,
CONCAT(d.description, '-', pd.short_name) AS `description`,
'' AS `ext_1`,'' AS `ext_2`,'' AS `ext_3`,'' AS `ext_4`,
NOW() AS `meta_created`, NOW() AS `meta_updated`, pd.meta_logic_flag AS `meta_logic_flag`
FROM
t_org_department d INNER JOIN
t_sec_org_frame sof ON sof.source = 't_org_department' AND d.id = sof.source_id AND sof.`level` = 3 CROSS JOIN
t_org_position_division pd
WHERE
	LOCATE('C', pd.scope) > 0
ORDER BY
  d.id, pd.id;
  
-- 小区部门岗位
INSERT INTO `t_org_position` (`department_id`, `position_division_id`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`)
SELECT
-- 	*,
-- 	dd.id, 	
	d.id AS `department_id`, 
	pd.id AS `position_division_id`, 
	0 AS `state`,
	CONCAT(d.description, '-', pd.short_name) AS `description`,
	'' AS `ext_1`,'' AS `ext_2`,'' AS `ext_3`,'' AS `ext_4`,
	NOW() AS `meta_created`, NOW() AS `meta_updated`, pd.meta_logic_flag AS `meta_logic_flag` 
FROM
	t_org_department d LEFT JOIN
	t_org_department_division dd ON d.department_division_id = dd.id INNER JOIN
	t_sec_org_frame sof ON sof.source = 't_org_department' AND d.id = sof.source_id AND sof.`level` = 4 CROSS JOIN 
	t_org_position_division pd 
WHERE
	LOCATE('P', pd.scope) > 0 AND
	(
		(dd.id = 10 AND pd.id in (4,5)) OR
		(dd.id = 11 AND pd.id in (1,6,7)) OR
		(dd.id = 12 AND pd.id in (1,8,9)) OR
		(dd.id = 13 AND pd.id in (1,8,10)) OR
		(dd.id = 14 AND pd.id in (1,3))
	)
ORDER BY
  d.id, pd.id;

  
-- 组织架构
-- -----------------------------------------------------------------------------------
-- 房产

-- =================================================================
-- t_sec_sys_frame
-- =================================================================
