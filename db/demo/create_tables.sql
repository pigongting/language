-- =============================================================================
-- 表字段排序
-- ID
-- 外键ID
--     主表
--     关联表
--         区分度
--         冗余
-- 类别/类型
-- no/name
-- 属性
--     区分度
--     数据类型
--     业务含义
-- 状态/描述
-- 扩展
-- 元数据
-- =============================================================================

DROP TABLE `t_wfs_work_item_media`t_wfs_work_item;                                  -- 品质巡查-工作项媒体表
DROP TABLE `t_wfs_work_item_assign_record_media`;                    -- 品质巡查-工作项分配记录媒体表
DROP TABLE `t_wfs_work_item_assign_record`;                          -- 品质巡查-工作项分配记录表
DROP TABLE `t_wfs_work_item_assign`;                                 -- 品质巡查-工作项分配表
DROP TABLE `t_wfs_work_item`;                                        -- 品质巡查-工作项表

DROP TABLE `t_qcs_task_item`;                                        -- 品质巡查-任务项表
DROP TABLE `t_qcs_task_item_division_media`;                         -- 品质巡查-任务项划分媒体表
DROP TABLE `t_qcs_task_item_division_attachment`;                    -- 品质巡查-任务项划分附加属性表
DROP TABLE `t_qcs_task_division_item_duty`;                          -- 品质巡查-任务划分项-(部门岗位)技能表

DROP TABLE `t_qcs_task_division_task_item_division`;                 -- 品质巡查-任务划分-任务项划分表
DROP TABLE `t_qcs_task_item_division_duty`;                          -- 品质巡查-任务项划分-(部门岗位)技能表
DROP TABLE `t_qcs_qas_task_employee`;                                -- 品质巡查(核查)-任务-员工表
DROP TABLE `t_qcs_qas_employee_project`;                             -- 品质巡查(核查)员工-项目表
DROP TABLE `t_qcs_qas_task_item`;                                    -- 品质巡查(核查)品质核查任务项表
DROP TABLE `t_qcs_task_item_duty`;              					           -- 品质巡查-任务项-(部门岗位)技能表
DROP TABLE `t_qcs_task_item_division`;                               -- 品质巡查-任务项划分表
DROP TABLE `t_qcs_task_item_division_category`;                      -- 品质巡查-任务项划分分类表

DROP TABLE `t_qcs_task`;                                             -- 品质巡查-任务表
DROP TABLE `t_qcs_property_project_task_item_division`;              -- 品质巡查-物业项目-任务划分表
DROP TABLE `t_qcs_task_division`;                                    -- 品质巡查-任务划分表
DROP TABLE `t_qcs_task_division_category`;                           -- 品质巡查-任务划分分类表

DROP TABLE `t_hrs_shift_period_template`;                            -- HR系统-排班班次时间模板表
DROP TABLE `t_hrs_shift_template`;                                   -- HR系统-排班班次模板表
DROP TABLE `t_hrs_schedule`;                                         -- HR系统-排班表
DROP TABLE `t_hrs_shift_period`;                                     -- HR系统-排班班次时间表
DROP TABLE `t_hrs_shift`;                                            -- HR系统-排班班次表
DROP TABLE `t_hrs_department_position_duty`;                         -- HR系统-部门岗位职责表
DROP TABLE `t_hrs_duty_division`;                                    -- HR系统-职责划分表
DROP TABLE `t_hrs_employee_duty`;                                    -- HR系统-员工职责表

DROP TABLE `t_pim_property_project_basicinfo`;                       -- 品质项目基础信息归档表
DROP TABLE `t_pim_property_project_auditing`;                        -- 品质项目基础信息审批表
DROP TABLE `t_pim_property_project_basicinfo_expand_property`;       -- 品质项目基础信息归档-扩展属性表
DROP TABLE `t_pim_property_project_auditing_expand_property`;        -- 品质项目基础信息审批-扩展属性表
DROP TABLE `t_pim_property_project_basicinfo_attachment`;            -- 品质项目基础信息归档-附件表
DROP TABLE `t_pim_property_project_auditing_attachment`;             -- 品质项目基础信息审批-附件表
DROP TABLE `t_pim_property_project_basicinfo_committee`;             -- 品质项目基础信息归档-业委会信息表
DROP TABLE `t_pim_property_project_auditing_committee`;              -- 品质项目基础信息审批-业委会信息表
DROP TABLE `t_pim_property_project_basicinfo_contract`;              -- 品质项目基础信息归档-合同信息表
DROP TABLE `t_pim_property_project_auditing_contract`;               -- 品质项目基础信息审批-合同信息表
DROP TABLE `t_pim_property_project_basicinfo_operation_logs`;        -- 品质项目基础信息归档-操作记录表
DROP TABLE `t_pim_property_project_auditing_operation_logs`;         -- 品质项目基础信息审批-操作记录表
DROP TABLE `t_pim_property_project_basicinfo_auditing_logs`;         -- 品质项目基础信息审批-审批记录表


DROP TABLE `t_was_property_project_was_setting`;                     -- 工单派单-项目-工单派单-设置
DROP TABLE `t_was_worksheet_division_category`;                      -- 工单派单-工单划分分类表
DROP TABLE `t_was_worksheet_division`;                               -- 工单派单-工单划分表
DROP TABLE `t_was_duty`;                                             -- 工单派单-工单职责表
DROP TABLE `t_was_worksheet_media`;                                  -- 工单派单-工单媒体表
DROP TABLE `t_was_worksheet_revisit`;                                -- 工单派单-工单回访表
DROP TABLE `t_was_worksheet_complaint`;                              -- 工单派单-投诉工单表
DROP TABLE `t_was_worksheet`;                                        -- 工单派单-工单表
DROP TABLE `t_wfs_wic_workflow_defination`;                          -- 工单派单-投诉类工单无效申诉-流程定义表
DROP TABLE `t_wfs_wic_workflow_defination_node`;                     -- 工单派单-投诉类工单无效申诉-流程节点表
DROP TABLE `t_wfs_wic_workflow`;                                     -- 工单派单-投诉类工单无效申诉-工作流表
DROP TABLE `t_wfs_wic_workflow_node`;                                -- 工单派单-投诉类工单无效申诉-工作流节点表
DROP TABLE `t_wfs_wic_workflow_node_media`;                          -- 工单派单-投诉类工单无效申诉-工作流节点-媒体表

DROP TABLE `t_cim_property_project_cim_setting`;
DROP TABLE `t_cim_task`;
DROP TABLE `t_cim_task_item`;
DROP TABLE `t_cim_task_item_worksheet`;
DROP TABLE `t_cim_task_item_revisit`;

-- ----------------------------
-- (品质巡查)任务项划分-分类表 (即巡查标准分类，由物业集团陈子源提供)
-- ----------------------------
CREATE TABLE `t_qcs_task_item_division_category` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `parent_id` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '父级id',
  `type` INT(20) NOT NULL DEFAULT 0 COMMENT '0-全部 1-品质巡查 2-品质核查',

  `level` INT(11) NOT NULL DEFAULT 0 COMMENT '层级',
  `path` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '路径',

  `code` VARCHAR(63) NOT NULL COMMENT 'CODE',
  `name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '名称',

  `priority` INT(11) NOT NULL DEFAULT 0 COMMENT '排序优先级',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 0-全部, 1-启用, 2-禁用',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)任务项划分-分类';

-- ----------------------------
-- (品质巡查)任务划分-分类表
-- ----------------------------
CREATE TABLE `t_qcs_task_division_category` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `parent_id` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '父级id',
  `level` INT(11) NOT NULL DEFAULT 0 COMMENT '层级',
  `path` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '路径',

  `code` VARCHAR(63) NOT NULL COMMENT 'CODE',
  `name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '名称',

  `priority` INT(11) NOT NULL DEFAULT 0 COMMENT '排序优先级',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 0-全部, 1-启用, 2-禁用',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)任务划分-分类';

-- ----------------------------
-- (品质巡查) 巡查标准关联业态表
-- ----------------------------
-- CREATE TABLE `t_qcs_project_business_format_task_item_division` (
--   `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
--
--   `task_item_division_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '巡查标准id', -- t_qcs_task_item_division.id
--   `project_business_format_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '业态id', -- t_pbf_project_business_format.id
--
--   `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
--   `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
--   `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查) 巡查标准关联业态表';

-- ----------------------------
-- (品质巡查)任务项划分表 (即巡查标准)
-- ----------------------------
CREATE TABLE `t_qcs_task_item_division` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `category_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '分类id', -- t_qcs_task_item_division_category.id
  `type` INT(20) NOT NULL DEFAULT 0 COMMENT '0-全部 1-品质巡查 2-品质核查',

  `code` VARCHAR(63) NOT NULL COMMENT 'CODE',
  `name` VARCHAR(63) NOT NULL COMMENT '名称',	-- 原来叫title

  -- `project_business_format_ids` VARCHAR(63) NOT NULL DEFAULT '0' COMMENT '业态标签，由业态ID以逗号,隔开。0-表示全部',

  `specification` TEXT NOT NULL DEFAULT '' COMMENT '使用说明',

  `qrcode` VARCHAR(127) NOT NULL DEFAULT '' COMMENT '二维码图片地址',
  `score` INT(11) NOT NULL DEFAULT 0 COMMENT '分值',

  `required_upload_media_type` INT(11) NOT NULL DEFAULT 0 COMMENT '要求上传的媒体 0-全部，既可以是视频又可以是图, 1-不需要上传, 2-图片, 3-视频',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)任务项划分表 (即巡查标准)';

-- ----------------------------
-- (品质巡查)任务划分-附加属性表
-- t_qcs_quality_task_division_check_requirement
-- ----------------------------
CREATE TABLE `t_qcs_task_item_division_attachment` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `task_item_division_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务项划分表id',    -- t_qcs_task_item_division.id

  `type` INT(11) NOT NULL DEFAULT 0 COMMENT '类型: 1-核查标准(文字版), 2-验证要求, 3-适用范围, 4-计分规则, 99-其它',
  `content`  TEXT NOT NULL COMMENT '内容',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)任务划分-附加属性表';

-- ----------------------------
-- (品质巡查)任务项划分-媒体表
-- ----------------------------
CREATE TABLE `t_qcs_task_item_division_media` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `task_item_division_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务项划分表id',

  `type` INT(11) NOT NULL DEFAULT 0 COMMENT '类型: 1-文字, 2-图片, 3-声音, 4-视频, 5-链接, 99-其它',

  `url` VARCHAR(127) NOT NULL DEFAULT '' COMMENT '媒体Url',
  `priority` INT(11) NOT NULL DEFAULT 0 COMMENT '排序优先级',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)任务项划分-媒体表';

-- ----------------------------
-- (品质巡查)任务项划分技能表 (即部门岗位与标准对应)
-- ----------------------------
CREATE TABLE `t_qcs_task_item_division_duty` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `task_item_division_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务项划分表id',   -- task_item_division.id
  `department_position_duty_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '部门岗位职责表id',

  `generate_regular` VARCHAR(255) NOT NULL COMMENT '规则', -- linux crontab规则

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)任务项划分技能表 (即部门岗位与标准对应)';

-- ----------------------------
-- (品质巡查)物业项目-任务项划分关联表 (即项目与巡查标准对应)
-- ----------------------------
CREATE TABLE `t_qcs_property_project_task_item_division` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `property_project_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '物业项目id',

  `task_item_division_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务项划分表id',

  `path` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '路径',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)物业项目-任务项划分关联表(即项目与巡查标准对应)';

-- ----------------------------
-- (品质巡查)场合表
-- ----------------------------
CREATE TABLE `t_qcs_dimension` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `property_project_d` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务项划分表id',
  `task_division_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务划分表id',   -- task_division.id

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)场合表';

CREATE TABLE `t_qcs_task_item_division_advice` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `task_item_division_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '分类id', -- t_qcs_task_item_division.id

  `company_name` VARCHAR(63) NOT NULL DEFAULT '0' COMMENT '公司名称',

  `property_project_name` VARCHAR(63) NOT NULL DEFAULT '0' COMMENT '项目名称',

  `employee_name` VARCHAR(63) NOT NULL DEFAULT '0' COMMENT '员工名称',

  `employee_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '员工id',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)任务项划分表建议 (即巡查标准建议)';

CREATE TABLE `t_qcs_task_item_division_advice_media` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `task_item_division_advice_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '巡查标准建议表id',

  `type` INT(11) NOT NULL DEFAULT 0 COMMENT '类型: 1-图片, 2-视频, 99-其它',

  `url` VARCHAR(127) NOT NULL DEFAULT '' COMMENT '媒体Url',
  `priority` INT(11) NOT NULL DEFAULT 0 COMMENT '排序优先级',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)巡查标准建议媒体表';

CREATE TABLE `t_qcs_generate_regular_preset` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '名称',
  `generate_regular` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '生成规则',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='品质巡查-生成规则预设表';






-- ----------------------------
-- (品质巡查)任务划分表
-- TODO: t_qcs_task_division_shadow (id, source_id, source_content..., meta_created)
-- ----------------------------
CREATE TABLE `t_qcs_task_division` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `category_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '分类id',

  `code` VARCHAR(63) NOT NULL DEFAULT '' COMMENT 'CODE',
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '名称',

  `type` INT(11) NOT NULL DEFAULT 0 COMMENT '生成方式 1:临时 2:固定 3:周期规则',
  `level` INT(11) NOT NULL DEFAULT 0 COMMENT '生成方式 1:集团任务 2:分公司任务 3:项目任务',

  `start_date` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '开始日期',
  `end_date` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '结束日期',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '是否有效: 0-all, 1-disabled 2-enabled',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)任务划分表';

-- ----------------------------
-- (品质巡查)品质巡查-任务划分-任务项划分表
-- ----------------------------
CREATE TABLE `t_qcs_task_division_task_item_division` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `task_division_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务划分表id',   -- t_qcs_task_division.id
  `task_item_division_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务项划分表id',   -- task_item_division.id

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)品质巡查-任务划分-任务项划分表';

-- ----------------------------
-- (品质巡查)任务划分项技能表
-- ----------------------------
CREATE TABLE `t_qcs_task_division_item_duty` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `task_division_item_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务划分项表id',   -- task_item_division.id
  `department_position_duty_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '部门岗位职责表id',
  `generate_regular` VARCHAR(255) NOT NULL COMMENT '规则', -- linux crontab规则

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)任务划分项技能表';

-- ----------------------------
-- (品质巡查)任务表
-- TODO: state字段需要根据实际任务场景调整优化
-- ----------------------------
CREATE TABLE `t_qcs_task` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `no` VARCHAR(63) NOT NULL DEFAULT 0 COMMENT 'No.',
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '名称',

  `category_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '分类id', -- 管理维度

  `generate_method` INT(11) NOT NULL DEFAULT 0 COMMENT '生成方式 1:临时 2:固定 3:周期规则', -- generate_method -- type变成 qcs:品质巡查 qas:品质核查
  `type` INT(11) NOT NULL DEFAULT 0 COMMENT '任务类型 1:qcs:品质巡查 2:qas:品质核查 3:专项任务',
  `level` INT(11) NOT NULL DEFAULT 0 COMMENT '任务级别 1:集团任务 2:分公司任务 3:项目任务',

  `task_division_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务划分表id', -- 模板任务

  `start_date` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '开始日期',
  `end_date` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '结束日期',

  `created_by` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '由谁生成',	-- 0表示系统，否则就是员工id
  `created_in` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '生成时间',

  -- `generate_time`  DATETIME  NOT NULL COMMENT '生成时间',

  `emergency_level` INT(11) NOT NULL DEFAULT 1 COMMENT '任务紧急程度优先级: 1-一般, 2-中, 3-高 4-紧急',

  `required_time` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '要求完成时间',
  `finished_time` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '实际完成时间',   -- 临时任务过期可完成 常规任务过期不可完成

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '任务状态 0-all, 1-待办, 2-处理中, 3-已上报(任务项才有), 4-已完成, 5-需整改, 6-已核查, 7-已关闭, 8-未下发, 9-已下发', -- 8,9只在核查任务里有
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)任务表';

-- ----------------------------
-- (品质巡查)任务项表
-- ----------------------------
CREATE TABLE `t_qcs_task_item` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `task_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务表id',    -- t_qcs_task.id
  `task_division_item_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务划分项表id',   -- t_qcs_task_division_item.id
  `task_item_division_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务项划分表id',   -- task_item_division.id

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)任务项表';

-- ----------------------------
-- (品质巡查)(巡查)任务项-职责表
-- ----------------------------
CREATE TABLE `t_qcs_task_item_duty` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `task_item_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务项表id',   -- task_item_division.id
  `department_position_duty_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '部门岗位职责表id',
  `generate_regular` VARCHAR(255) NOT NULL COMMENT '规则', -- linux crontab规则

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)(巡查)任务项-职责表';

-- ----------------------------
-- (品质巡查)(核查)任务-员工表
-- ----------------------------
CREATE TABLE `t_qcs_qas_task_employee` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `task_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务表id',   -- t_qcs_task.id
  `employee_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '员工id',
  `department_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '部门id',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)(核查)任务-员工表';

-- ----------------------------
-- (品质巡查)(核查)员工-项目表
-- ----------------------------
CREATE TABLE `t_qcs_qas_employee_project` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `task_employee_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务-员工表id',   -- t_qcs_qas_task_employee.id
  `property_project_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '项目id',
  `org_frame_path` varchar(63) NOT NULL DEFAULT '' COMMENT '组织架构path',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)(核查)员工-项目表';

-- ----------------------------
-- (品质巡查)(核查)品质核查任务项表
-- ----------------------------
CREATE TABLE `t_qcs_qas_task_item` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `task_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务表id',   -- t_qcs_task.id
  `task_item_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务项表id',   -- t_qcs_task_item.id
  `property_project_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '项目id',
  `employee_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '员工id',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)(核查)品质核查任务项表';

-- ----------------------------
-- (品质巡查)工作项表
-- ----------------------------
CREATE TABLE `t_wfs_work_item` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `type` INT(11) NOT NULL DEFAULT 0 COMMENT '类型 1:qcs:品质巡查 2:qas:品质核查 3:专项任务 4:工单派单 5:客户拜访',    -- 日常任务: 1  主动任务: 3
  `employee_type` INT(11) NOT NULL DEFAULT 0 COMMENT '员工类型 0:全部 1:责任人 2:协助人',

  `task_item_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务项表id',   -- t_qcs_task_item.id
  `created_in` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '生成时间',

  `source` VARCHAR (63) NOT NULL DEFAULT '' COMMENT 'task_item_duty, qas_task_item',
  `source_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT 'sourceId',

  `name` VARCHAR(63) NOT NULL DEFAULT 0 COMMENT '名称',   -- (冗余字段)

  `assign_by_employee_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '分派任务的员工id',
  `assign_by_employee_name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '员工用户名',    --  冗余字段

  `received_time` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '接收时间',
  `required_time` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '要求完成时间',
  `finished_time` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '实际完成时间',
  `audited_time` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '核查时间',

  `audit_state` INT(11) NOT NULL DEFAULT 0 COMMENT '核查状态 0-all, 1-待办, 2-已完成, 3-不合格, 4-合格 6-已关闭 7-已上报',

  `required_upload_media_type` INT(11) NOT NULL DEFAULT 0 COMMENT '要求上传的媒体 0-全部，既可以是视频又可以是图, 1-不需要上传, 2-图片, 3-视频',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)工作项表';

-- ----------------------------
-- (品质巡查)工作项-媒体表
-- ----------------------------
CREATE TABLE `t_wfs_work_item_media` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `work_item_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '工作项表id',   -- t_qcs_work_item.id
  `employee_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '员工id',

  `origin_type` INT(11) NOT NULL DEFAULT 0 COMMENT '类型: 1-现场图片， 2-完成图片',

  `type` INT(11) NOT NULL DEFAULT 0 COMMENT '类型: 1-文字, 2-图片, 3-声音, 4-视频, 5-链接, 99-其它',

  `url` VARCHAR(127) NOT NULL DEFAULT '' COMMENT '媒体Url',
  `priority` INT(11) NOT NULL DEFAULT 0 COMMENT '排序优先级',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)工作项-媒体表';

-- ----------------------------
-- (品质巡查)工作项分配表
-- ----------------------------
CREATE TABLE `t_wfs_work_item_assign` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `type` INT(11) NOT NULL DEFAULT 0 COMMENT '类型 0-全部，1-新建，2-分派，3-上报，4-完成，5-审批，6-关闭，7-转单，8-延期',
  `assign_by` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '由谁分派',
  `assign_by_username` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '分派人姓名',

  `work_item_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '工作项表id',   -- t_qcs_work_item.id
  `employee_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '接收任务的员工id',
  `username` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '接收任务的员工用户名',    --  冗余字段
  `org_frame_path` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '组织架构path',    --  冗余字段
  `position_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '岗位ID',    --  冗余字段
  -- `assign_to_employee_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '接收任务的员工id',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)工作项分配表';

CREATE TABLE `t_wfs_work_item_assign_record_media` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `work_item_assign_record_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '工作项分配记录表id',

  `url` VARCHAR(127) NOT NULL DEFAULT '' COMMENT '媒体Url',
  `priority` INT(11) NOT NULL DEFAULT 0 COMMENT '排序优先级',

  `type` INT(11) NOT NULL DEFAULT 0 COMMENT '类型: 1-文字, 2-图片, 3-声音, 4-视频, 5-链接, 99-其它',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)工作项分配-媒体表';

-- ----------------------------
-- (品质巡查)工作项分配记录表
-- ----------------------------
CREATE TABLE `t_wfs_work_item_assign_record` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `work_item_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '工作项表id',   -- t_qcs_work_item.id
  `assign_by` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '分派任务的员工id',    --  0表示系统分配
  `assign_by_username` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '分派任务的员工用户名',    --  冗余字段
  `assign_to` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '接收任务的员工id',
  `assign_to_username` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '接收任务的员工用户名',    --  冗余字段

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 1-待办 2-已完成 3-需整改 4-已合格 6-已关闭 7-已上报 11-已分派 12-有亮点 21-过期完成',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)工作项分配-记录表';

CREATE TABLE `t_wfs_work_item_auditing_logs` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `work_item_id` BIGINT(20) NOT NULL COMMENT '工作项id(t_qcs_work_item.id)',

  `user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '审批者id',
  `user_name` VARCHAR(63) NOT NULL DEFAULT 0 COMMENT '审批者名称(冗余字段)',

  `audit_state`  INT(11)  NOT NULL DEFAULT 0 COMMENT '审批状态（1: 通过，2: 驳回，......）',
  `content` text  NOT NULL DEFAULT '' COMMENT '审批意见/整改内容',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',

  PRIMARY KEY (`id`),
  KEY `index_work_item_id` (`work_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='工作项审批记录表';



CREATE TABLE `t_hrs_shift_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL DEFAULT '' COMMENT '班次名称',
  `meta_created` datetime NOT NULL COMMENT '创建时间',
  `meta_updated` datetime NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` int(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=691 DEFAULT CHARSET=utf8 COMMENT='品质巡查-排班班次模板表';

CREATE TABLE `t_hrs_shift_period_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shift_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '班次id',
  `start_time` varchar(63) NOT NULL DEFAULT '' COMMENT '开始上班时间',
  `minutes` int(11) NOT NULL DEFAULT 0 COMMENT '上班时长',
  `meta_created` datetime NOT NULL COMMENT '创建时间',
  `meta_updated` datetime NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` int(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=691 DEFAULT CHARSET=utf8 COMMENT='品质巡查-排班班次时间模板表';

CREATE TABLE `t_hrs_shift` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '班次名称',
  `property_project_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '项目id',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='品质巡查-排班班次表';

CREATE TABLE `t_hrs_shift_period` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `shift_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '班次id',
  `start_time` VARCHAR(63) NOT NULL COMMENT '开始上班时间',
  `minutes` INT(11) NOT NULL DEFAULT 0 COMMENT '上班时长',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='品质巡查-排班班次时间表';

CREATE TABLE `t_hrs_schedule` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `employee_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '员工id',

  `start_date` DATETIME NOT NULL COMMENT '起始时间',

  `position_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '岗位id', -- 岗位(预留字段)
  `shift_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '班次id',
  `period` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '班次期间',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态: 1. 正常 2. 换班(别人代替自己上班) 3. 替班（自己代替别人上班）',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='品质巡查-员工排班表';

CREATE TABLE `t_hrs_department_position_duty` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `department_position_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '部门划分',
  `duty_division_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '职责划分',

  `scope` VARCHAR (63) NOT NULL DEFAULT '' COMMENT 'G,C,P',

  `state` INT(11) NOT NULL DEFAULT 0,
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` int(11) NOT NULL DEFAULT 0 COMMENT '是否已经逻辑删除 1已删除  0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='部门岗位职责表';

CREATE TABLE `t_hrs_duty_division` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `category_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '分类id',
  `module_id` int(11) NOT NULL DEFAULT 0 COMMENT '模块Id,0-全部 1-通用 111-工单派单',

  `code` VARCHAR(31) NOT NULL DEFAULT '' COMMENT '代码',
  `short_name` VARCHAR(31) NOT NULL DEFAULT '' COMMENT '简称',
  `name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '名称',

  `state` INT(11) NOT NULL DEFAULT 0,
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) NOT NULL DEFAULT 0 COMMENT '是否已经逻辑删除 1已删除  0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='职责类别表';

CREATE TABLE `t_hrs_employee_duty` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `employee_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '员工ID',
  `department_position_duty_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '部门岗位职责id',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态:1-可用, 2-过期, 3-失效, 99-其它',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 0 COMMENT '是否已经逻辑删除 1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='员工-职责表';

CREATE TABLE `t_pim_property_project_basicinfo` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `city_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '项目城市id',
  `city_name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '城市名称(冗余字段)',

  `county_name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '区县名称',
  `address` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '地址',
  `period` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '期别',
  `location` INT(11) NOT NULL DEFAULT 0 NOT NULL COMMENT '地段 0-全部 1-市中心，2-市内，3-郊区', -- 枚举

  `company_id` BIGINT(20) NOT NULL COMMENT '公司id',
  `company_name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '公司名称(冗余字段)',

  `region1` INT(11) NOT NULL DEFAULT 0 COMMENT '区域一id(冗余字段)', -- t_org_region.id type=1
  `region1_name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '区域一名称(冗余字段)',
  `region2` INT(11) NOT NULL DEFAULT 0 COMMENT '区域二id(冗余字段)', -- t_org_region.id type=2
  `region2_name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '区域二名称(冗余字段)',

  `short_name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '简称(项目名称)',
  `name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '名称(官方项目名称)',

  `phase` INT(11) NOT NULL DEFAULT 0 COMMENT '项目阶段 (1: 常规，2：前期，11：常规已开发完，12：常规滚动开发，21：前期未动工，22：前期施工中，23：前期旧改，24：前期案场)',
  `market_field` INT(11) NOT NULL DEFAULT 0 COMMENT '营销案场 (1: 是, 2: 否)',

  `pim_biz_type` INT(11) NOT NULL DEFAULT 0 COMMENT '项目业态(1: 住宅, 2: 商业, 3: 写字楼, 4: 文体, 5: 医院, 6: 银行, 7: 学校, 8:公园, 9: 工业园, 10: 农场, 11: 工地, 12: 旧改, 13: 案场)',
  `pim_biz_type_desc` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '项目业态-备注',

  `land_purpose_type` INT(11) NOT NULL DEFAULT 0 COMMENT '用地性质',

  `house_count_planning` INT(11) NOT NULL DEFAULT 0 COMMENT '规划户数',
  `house_count_signed` INT(11) NOT NULL DEFAULT 0 COMMENT '已签户数',
  `house_count_joined` INT(11) NOT NULL DEFAULT 0 COMMENT '已入伙户数',
  `house_joined_date` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '入伙时间',

  `building_count` INT(11) NOT NULL DEFAULT 0 COMMENT '楼栋数',
  `elevator_count` INT(11) NOT NULL DEFAULT 0 COMMENT '电梯数',
  `brake_count` INT(11) NOT NULL DEFAULT 0 COMMENT '道闸数',

  `pedestrian_entrance_count` INT(11) NOT NULL DEFAULT 0 COMMENT '人行出入口数',
  `garage_entrance_count` INT(11) NOT NULL DEFAULT 0 COMMENT '车行出入口数',
  `entrance_count` INT(11) NOT NULL DEFAULT 0 COMMENT '人车混行出入口数',

  `obtain_day` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '取得时间',
  `obtain_day_desc` TEXT NOT NULL DEFAULT '' COMMENT '取得时间备注',

  `collect_fee_from_developer` INT(11) NOT NULL DEFAULT 0 COMMENT '与开发商签订 (1: 包干制, 2: 酬金制, 3: 包干制和酬金制)',
  `collect_fee_from_owner` INT(11) NOT NULL DEFAULT 0 COMMENT '与小区业主约定 (1: 包干制, 2: 酬金制, 3: 包干制和酬金制)',
  `collect_fee_desc` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '收费方式备注',

  `value_added_fee_desc` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '收费标准备注',
  `parking_temporary_fee_desc` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '临时停车备注',

  -- 面积信息
  `acreage_total` DECIMAL(12, 4) NOT NULL DEFAULT 0 COMMENT '总建筑面积',
  `acreage_contract` DECIMAL(12, 4) NOT NULL DEFAULT 0 COMMENT '合约总建筑面积',
  `acreage_deliveried` DECIMAL(12, 4) NOT NULL DEFAULT 0 COMMENT '已交付面积',
  `acreage_no_deliveried` DECIMAL(12, 4) NOT NULL DEFAULT 0 COMMENT '未交付面积',
  `acreage_charge` DECIMAL(12, 4) NOT NULL DEFAULT 0 COMMENT '收费面积',
  `acreage_deliveried_desc` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '已交付面积情况备注',

  `submit_by_user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '提交者id',
  `created_by` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '添加人姓名',

  `listed_scope` INT(6) NOT NULL DEFAULT 0 COMMENT '是否上市范围 (1: 是, 2: 否)',

  `submit_time` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '提交时间',

  `withdrawal` int(11) NOT NULL DEFAULT 0 COMMENT '是否已撤场 (1: 未撤场, 2: 已撤场)',
  `withdrawal_time` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '撤场时间',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态(1: 未提交(草稿)，2: 待初审，3: 已初审，4: 待复审，5: 已复审，6: 归档, 7: 初审终止, 8: 复审终止)',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  -- 扩展信息
  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='品质项目基础信息表';

CREATE TABLE `t_pim_property_project_auditing` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `city_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '项目城市id',
  `city_name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '城市名称(冗余字段)',

  `county_name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '区县名称',
  `address` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '地址',
  `period` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '期别',
  `location` INT(11) NOT NULL DEFAULT 0 NOT NULL COMMENT '地段 0-全部 1-市中心，2-市内，3-郊区', -- 枚举

  `company_id` BIGINT(20) NOT NULL COMMENT '公司id',
  `company_name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '公司名称(冗余字段)',

  `region1` INT(11) NOT NULL DEFAULT 0 COMMENT '区域一id(冗余字段)', -- t_org_region.id type=1
  `region1_name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '区域一名称(冗余字段)',
  `region2` INT(11) NOT NULL DEFAULT 0 COMMENT '区域二id(冗余字段)', -- t_org_region.id type=2
  `region2_name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '区域二名称(冗余字段)',

  `short_name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '简称(项目名称)',
  `name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '名称(官方项目名称)',

  `phase` INT(11) NOT NULL DEFAULT 0 COMMENT '项目阶段 (1: 常规，2：前期，11：常规已开发完，12：常规滚动开发，21：前期未动工，22：前期施工中，23：前期旧改，24：前期案场)',
  `market_field` INT(11) NOT NULL DEFAULT 0 COMMENT '营销案场 (1: 是, 2: 否)',

  `pim_biz_type` INT(11) NOT NULL DEFAULT 0 COMMENT '项目业态(1: 住宅, 2: 商业, 3: 写字楼, 4: 文体, 5: 医院, 6: 银行, 7: 学校, 8:公园, 9: 工业园, 10: 农场, 11: 工地, 12: 旧改, 13: 案场)',
  `pim_biz_type_desc` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '项目业态-备注',

  `land_purpose_type` INT(11) NOT NULL DEFAULT 0 COMMENT '用地性质',

  `house_count_planning` INT(11) NOT NULL DEFAULT 0 COMMENT '规划户数',
  `house_count_signed` INT(11) NOT NULL DEFAULT 0 COMMENT '已签户数',
  `house_count_joined` INT(11) NOT NULL DEFAULT 0 COMMENT '已入伙户数',
  `house_joined_date` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '入伙时间',

  `building_count` INT(11) NOT NULL DEFAULT 0 COMMENT '楼栋数',
  `elevator_count` INT(11) NOT NULL DEFAULT 0 COMMENT '电梯数',
  `brake_count` INT(11) NOT NULL DEFAULT 0 COMMENT '道闸数',

  `pedestrian_entrance_count` INT(11) NOT NULL DEFAULT 0 COMMENT '人行出入口数',
  `garage_entrance_count` INT(11) NOT NULL DEFAULT 0 COMMENT '车行出入口数',
  `entrance_count` INT(11) NOT NULL DEFAULT 0 COMMENT '人车混行出入口数',

  `obtain_day` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '取得时间',
  `obtain_day_desc` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '取得时间备注',

  `collect_fee_from_developer` INT(11) NOT NULL DEFAULT 0 COMMENT '与开发商签订 (1: 包干制, 2: 酬金制)',
  `collect_fee_from_owner` INT(11) NOT NULL DEFAULT 0 COMMENT '与小区业主约定 (1: 包干制, 2: 酬金制, 3: 包干制和酬金制)',
  `collect_fee_desc` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '收费方式备注',

  `value_added_fee_desc` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '收费标准备注',
  `parking_temporary_fee_desc` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '临时停车备注',

  -- 面积信息
  `acreage_total` DECIMAL(12, 4) NOT NULL DEFAULT 0 COMMENT '总建筑面积',
  `acreage_contract` DECIMAL(12, 4) NOT NULL DEFAULT 0 COMMENT '合约总建筑面积',
  `acreage_deliveried` DECIMAL(12, 4) NOT NULL DEFAULT 0 COMMENT '已交付面积',
  `acreage_no_deliveried` DECIMAL(12, 4) NOT NULL DEFAULT 0 COMMENT '未交付面积',
  `acreage_charge` DECIMAL(12, 4) NOT NULL DEFAULT 0 COMMENT '收费面积',
  `acreage_deliveried_desc` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '已交付面积情况备注',

  `submit_by_user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '提交者id',
  `created_by` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '添加人姓名',

  `listed_scope` INT(6) NOT NULL DEFAULT 0 COMMENT '是否上市范围 (1: 是, 2: 否)',

  `submit_time` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '提交时间',

  `withdrawal` int(11) NOT NULL DEFAULT 0 COMMENT '是否已撤场 (1: 未撤场, 2: 已撤场)',
  `withdrawal_time` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '撤场时间',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态(1: 未提交(草稿)，2: 待初审，3: 已初审，4: 待复审，5: 已复审，6: 归档, 7: 初审终止, 8: 复审终止)',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  -- 扩展信息
  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='品质项目基础信息审批表';

CREATE TABLE `t_pim_property_project_basicinfo_expand_property` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `basicinfo_id` BIGINT(20) NOT NULL COMMENT '项目基础信息id(t_pim_property_project_basicinfo.id)',

  `sys_dictionary_id` VARCHAR(63) NOT NULL COMMENT '字典类型ID', -- t_sys_dictionary.id

  `key_name` VARCHAR(31) NOT NULL DEFAULT '' COMMENT '键(值)',  -- t_sys_dictionary.id
  `value` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '值(输入框内容)',

  `state` INT(11) NOT NULL DEFAULT 0,
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',

  PRIMARY KEY (`id`),
  KEY `index_basicinfo_id` (`basicinfo_id`),
  KEY `index_value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='品质项目拓展属性表';

CREATE TABLE `t_pim_property_project_auditing_expand_property` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `auditing_id` BIGINT(20) NOT NULL COMMENT '项目基础信息id(t_pim_property_project_auditing.id)',

  `sys_dictionary_id` VARCHAR(63) NOT NULL COMMENT '字典类型ID', -- t_sys_dictionary.id

  `key_name` VARCHAR(31) NOT NULL DEFAULT '' COMMENT '键(值)',  -- t_sys_dictionary.id
  `value` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '值(输入框内容)',

  `state` INT(11) NOT NULL DEFAULT 0,
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',

  PRIMARY KEY (`id`),
  KEY `index_auditing_id` (`auditing_id`),
  KEY `index_value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='品质项目拓展属性表';

CREATE TABLE `t_pim_property_project_basicinfo_attachment` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `basicinfo_id` BIGINT(20) NOT NULL COMMENT '项目基础信息id(t_pim_property_project_basicinfo.id)',

  `key_name` VARCHAR(31) NOT NULL DEFAULT '' COMMENT '键(值)',
  `value` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '值(资源相对路径)',

  `state` INT(11) NOT NULL DEFAULT 0,
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',

  PRIMARY KEY (`id`),
  KEY `index_basicinfo_id` (`basicinfo_id`),
  KEY `index_value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='品质项目附件表';

CREATE TABLE `t_pim_property_project_auditing_attachment` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `auditing_id` BIGINT(20) NOT NULL COMMENT '项目基础信息id(t_pim_property_project_auditing.id)',

  `key_name` VARCHAR(31) NOT NULL DEFAULT '' COMMENT '键(值)',
  `value` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '值(资源相对路径)',

  `state` INT(11) NOT NULL DEFAULT 0,
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',

  PRIMARY KEY (`id`),
  KEY `index_auditing_id` (`auditing_id`),
  KEY `index_value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='品质项目附件表';

CREATE TABLE `t_pim_property_project_basicinfo_committee` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `basicinfo_id` BIGINT(20) NOT NULL COMMENT '项目基础信息id(t_pim_property_project_basicinfo.id)',

  `created_date` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '成立时间',
  `created_date_limit` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '成立期限',
  `created_term` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '成立届期',
  `risk_control` INT(6) NOT NULL DEFAULT 0 COMMENT '业委会状态 (1: 可控, 2: 不可控, 3: 严重不可控)',
  `sign_contract` INT(6) NOT NULL DEFAULT 0 COMMENT '与业委会是否签订合同 (1: 是, 2: 否)',

  `state` INT(6) NOT NULL DEFAULT 0 COMMENT '业委会状态 (1: 已成立, 2: 未启动, 3: 临时业委会, 4: 筹备中, 5: 原成立，现解散)',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',

  PRIMARY KEY (`id`),
  KEY `index_basicinfo_id` (`basicinfo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='品质项目业委会表';

CREATE TABLE `t_pim_property_project_auditing_committee` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `auditing_id` BIGINT(20) NOT NULL COMMENT '项目基础信息id(t_pim_property_project_auditing.id)',

  `created_date` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '成立时间',
  `created_date_limit` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '成立期限',
  `created_term` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '成立届期',
  `risk_control` INT(6) NOT NULL DEFAULT 0 COMMENT '业委会状态 (1: 可控, 2: 不可控, 3: 严重不可控)',
  `sign_contract` INT(6) NOT NULL DEFAULT 0 COMMENT '与业委会是否签订合同 (1: 是, 2: 否)',

  `state` INT(6) NOT NULL DEFAULT 0 COMMENT '业委会状态 (1: 已成立, 2: 未启动, 3: 临时业委会, 4: 筹备中, 5: 原成立，现解散)',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',

  PRIMARY KEY (`id`),
  KEY `index_auditing_id` (`auditing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='品质项目业委会表';

CREATE TABLE `t_pim_property_project_basicinfo_contract` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `basicinfo_id` BIGINT(20) NOT NULL COMMENT '项目基础信息id(t_pim_property_project_basicinfo.id)',

  -- 合同信息
  `obtain_way` INT(6) NOT NULL DEFAULT 0 COMMENT '获聘方式 (1: 直接委托, 2: 公开招投标, 3: 工作站选聘)',
  `type` INT(6) NOT NULL DEFAULT 0 COMMENT '物业合同类别 (1: 前期物业服务合同, 2: 物业管理服务合同, 3: 顾问服务合同, 4: 营销配合服务合同, 5: 前期劳务服务合同)',
  `entrusted` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '受托方',
  `delegate` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '委托方',
  `start` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '合同开始日期',
  `end` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '合同截止日期',
  `service_nature` INT(6) NOT NULL DEFAULT 0 COMMENT '合同服务性质 (1: 全委服务, 2: 专项服务)',
  `pim_develop_by` INT(6) NOT NULL DEFAULT 0 COMMENT '是否佳兆业开发 (1: inner(是), 2: outer(否))',
  `pim_address` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '项目地址',
  `pim_operation_type` INT(11) NOT NULL DEFAULT 0 COMMENT '项目性质(1: 自持, 2: 外接)',
  `renewal` INT(6) NOT NULL DEFAULT 0 COMMENT '合同续签条款 (1: 至甲方选聘服务企业或业委会成立, 2: 自动延期至选聘新服务企业)',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',

  PRIMARY KEY (`id`),
  KEY `index_basicinfo_id` (`basicinfo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='品质项目合同信息表';

CREATE TABLE `t_pim_property_project_auditing_contract` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `auditing_id` BIGINT(20) NOT NULL COMMENT '项目基础信息id(t_pim_property_project_auditing.id)',

  -- 合同信息
  `obtain_way` INT(6) NOT NULL DEFAULT 0 COMMENT '获聘方式 (1: 直接委托, 2: 公开招投标, 3: 工作站选聘)',
  `type` INT(6) NOT NULL DEFAULT 0 COMMENT '物业合同类别 (1: 前期物业服务合同, 2: 物业管理服务合同, 3: 顾问服务合同, 4: 营销配合服务合同, 5: 前期劳务服务合同)',
  `entrusted` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '受托方',
  `delegate` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '委托方',
  `start` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '合同开始日期',
  `end` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '合同截止日期',
  `service_nature` INT(6) NOT NULL DEFAULT 0 COMMENT '合同服务性质 (1: 全委服务, 2: 专项服务)',
  `pim_develop_by` INT(6) NOT NULL DEFAULT 0 COMMENT '是否佳兆业开发 (1: inner(是), 2: outer(否))',
  `pim_address` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '项目地址',
  `pim_operation_type` INT(11) NOT NULL DEFAULT 0 COMMENT '项目性质(1: 自持, 2: 外接)',
  `renewal` INT(6) NOT NULL DEFAULT 0 COMMENT '合同续签条款 (1: 至甲方选聘服务企业或业委会成立, 2: 自动延期至选聘新服务企业)',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',

  PRIMARY KEY (`id`),
  KEY `index_auditing_id` (`auditing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='品质项目合同信息表';

CREATE TABLE `t_pim_property_project_basicinfo_operation_logs` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `basicinfo_id` BIGINT(20) NOT NULL COMMENT '项目基础信息id(t_pim_property_project_basicinfo.id)',

  `user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '操作者id',
  `user_name` VARCHAR (63) NOT NULL DEFAULT 0 COMMENT '操作者名称(冗余字段)',

  `content` text  NOT NULL DEFAULT '' COMMENT '操作内容',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',

  PRIMARY KEY (`id`),
  KEY `index_basicinfo_id` (`basicinfo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='品质项目操作记录表';

CREATE TABLE `t_pim_property_project_auditing_operation_logs` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `auditing_id` BIGINT(20) NOT NULL COMMENT '项目基础信息id(t_pim_property_project_auditing.id)',

  `user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '操作者id',
  `user_name` VARCHAR (63) NOT NULL DEFAULT 0 COMMENT '操作者名称(冗余字段)',

  `content` text  NOT NULL DEFAULT '' COMMENT '操作内容',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',

  PRIMARY KEY (`id`),
  KEY `index_auditing_id` (`auditing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='品质项目操作记录表';

CREATE TABLE `t_pim_property_project_basicinfo_auditing_logs` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `auditing_id` BIGINT(20) NOT NULL COMMENT '项目基础信息id(t_pim_property_project_basicinfo_auditing.id)',

  `user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '审批者id',
  `user_name` VARCHAR(63) NOT NULL DEFAULT 0 COMMENT '审批者名称(冗余字段)',

  `step` INT(11)  NOT NULL DEFAULT 0 COMMENT '审批阶段（1: 初审，2: 复审，3: 终审，......）',
  `audit_state`  INT(11)  NOT NULL DEFAULT 0 COMMENT '审批状态（1: 通过，2: 驳回，3: 终止，......）',
  `content` text  NOT NULL DEFAULT '' COMMENT '审批意见内容',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',

  PRIMARY KEY (`id`),
  KEY `index_auditing_id` (`auditing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='品质项目审批记录表';

CREATE TABLE `t_hrs_duty_division_category` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `parent_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '父级id',
  `level` INT(11) NOT NULL DEFAULT 0 COMMENT '层级',
  `path` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '路径',

  `code` VARCHAR(63) NOT NULL COMMENT 'CODE',
  `name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '名称',

  `priority` INT(11) NOT NULL DEFAULT 0 COMMENT '排序优先级',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 0-全部, 1-启用, 2-禁用',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(工单派单)职责划分分类表';

CREATE TABLE `t_was_property_project_was_setting` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `property_project_id` BIGINT(20) NOT NULL COMMENT '项目id',
  `was_enable_state` INT(11) NOT NULL DEFAULT 0 COMMENT '项目工单派单模块启用状态 0-全部 1-未启用 2-已启用',

  `assign_mode` INT(11) NOT NULL DEFAULT 1 COMMENT '分配模式 0-全部 1-统一分配 2-根据专业分配模式',

  `transfer_mode` INT(11) NOT NULL DEFAULT 2 COMMENT '转单模式 0-全部 1-未启用 2-已启用',
  `transfer_times` INT(11) NOT NULL DEFAULT 2 COMMENT '可转单次数',

  `auditing_mode` INT(11) NOT NULL DEFAULT 1 COMMENT '工单审批 0-全部 1-未启用 2-已启用',
  `auditing_was_type` INT(11) NOT NULL DEFAULT 2 COMMENT '审批工单类型 1-全部 2-投诉单',

  `user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '操作者id',
  `user_name` VARCHAR (63) NOT NULL DEFAULT 0 COMMENT '操作者名称(冗余字段)',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(工单派单)项目-工单派单-设置';

CREATE TABLE `t_was_assign_setting` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `setting_id` BIGINT(20) NOT NULL COMMENT '设置id',

  `property_project_id` BIGINT(20) NOT NULL COMMENT '项目id',
  `division_category_id` BIGINT(20) NOT NULL COMMENT '工单分类id',
  `department_id` BIGINT(20) NOT NULL COMMENT '部门id',
  `department_name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '部门名称',
  `position_id` BIGINT(20) NOT NULL COMMENT '岗位id',
  `position_name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '岗位名称',
  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(工单派单)项目-工单派单-专员分配模式设置';

CREATE TABLE `t_was_worksheet_division_category` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `k_saas_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT 'k_saas_id',
  `sy_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '思源id',
  `type` INT(11) NOT NULL DEFAULT 0 COMMENT '类型：0-全部 1-投诉类 2-非投诉类',

  `parent_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '父级id',
  `level` INT(11) NOT NULL DEFAULT 0 COMMENT '层级',
  `path` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '路径',

  `handle_time` INT(4) NOT NULL DEFAULT 3 COMMENT '处理时长',
  `unit` INT(4) NOT NULL DEFAULT 2 COMMENT '工单时长单位: 1小时 2天 3分钟',

  `code` VARCHAR(63) NOT NULL COMMENT 'CODE',
  `name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '名称',

  `priority` INT(11) NOT NULL DEFAULT 0 COMMENT '排序优先级',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 0-全部, 1-启用, 2-禁用',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(工单派单)工单划分分类表';

CREATE TABLE `t_was_worksheet_division` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `k_saas_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT 'k_saas_id',
  `sy_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '思源id',
  `category_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '分类id',

  `handle_time` INT(4) NOT NULL DEFAULT 3 COMMENT '处理时长',
  `unit` INT(4) NOT NULL DEFAULT 2 COMMENT '工单时长单位: 1小时 2天 3分钟',

  `code` VARCHAR(63) NOT NULL COMMENT 'CODE',
  `name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '名称',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 0-全部, 1-启用, 2-禁用',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(工单派单)工单划分表';

CREATE TABLE `t_was_duty` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `worksheet_division_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '工单划分id',
  `hrs_duty_division_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '职责划分id',  -- t_hrs_duty_division.id

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 0-全部, 1-启用, 2-禁用',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(工单派单)工单职责表';

CREATE TABLE `t_was_worksheet` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `property_project_id` BIGINT(20) NOT NULL COMMENT '项目id',
  `property_project_name` VARCHAR(63) NOT NULL COMMENT '项目名称',
  `group_id` BIGINT(20) NOT NULL COMMENT '组团id',
  `building_id` BIGINT(20) NOT NULL COMMENT '业主楼栋id',
  `building_name` VARCHAR(63) NOT NULL COMMENT '楼栋名称',
  `house_id` BIGINT(20) NOT NULL COMMENT '业主房间id',
  `house_name` VARCHAR(63) NOT NULL COMMENT '房间栋名称',
  `phone_1` VARCHAR(63) NOT NULL COMMENT '业主联系方式1',
  `phone_2` VARCHAR(63) NOT NULL COMMENT '业主联系方式2',
  `owner_name` VARCHAR(63) NOT NULL COMMENT '业主姓名',
  `resident_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '业主id',
  `worksheet_division_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '工单划分id',

  `order_no` VARCHAR(63) NOT NULL COMMENT '工单号',

  `sy_sync_status` INT(11) NOT NULL DEFAULT 0 '思源同步状态 0未同步 1是新增同步失败 2新增同步成功 3完成成功 5无效投诉状态更新成功',

  `create_by` BIGINT(20) NOT NULL COMMENT '发布人ID',
  `create_by_name` VARCHAR(63) NOT NULL COMMENT '发布人名称',
  `created_in` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '生成时间',

  `start_time` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '任务开始时间',
  `end_time` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '规定完成时间',

  `visit_time` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '预约上门时间',
  `extension_time` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '任务延长时间',

  `require_time` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '要求完成时间',
  `complete_time` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '实际完成时间',

  `range_type` INT(11) NOT NULL DEFAULT 0 COMMENT '所属区域 1、居家维修 2、公共区域 3、其他',
  `origin_type` INT(11) NOT NULL DEFAULT 0 COMMENT '任务来源  1、代客报修 2、400电话 3、集团控股400 4、小区管家 5、内部员工 6、外部客户 7、K生活',

  `code` VARCHAR(63) NOT NULL COMMENT 'CODE',
  `name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '名称',

  `required_upload_media_type` INT(11) NOT NULL DEFAULT 0 COMMENT '要求上传的媒体 0-全部，既可以是视频又可以是图, 1-不需要上传, 2-图片, 3-视频',

  `transfer_times` INT(11) NOT NULL DEFAULT 0 COMMENT '转单次数',
  `delay_time` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '延期时间',
  `delay_apply_time` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '延期申请时间',
  `delay_description` TEXT NOT NULL DEFAULT '' COMMENT '延期理由',

  `accept_type` INT(11) NOT NULL DEFAULT '3' COMMENT '接单情况 1-按时接单 2-超时接单 3-30分钟内未接单 4-30分钟外未接单',
  -- `worksheet_state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 0-全部, 1-已发布, 2-已分派 3-已转单 4-已完成 5-已回访 6-已转单 7-已申请无效',
  `worksheet_state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 1-已发布 2-已分派 3-需整改 4-已完成 5-已合格 6-已关闭 7-已上报 8-申请延期 9-已转单 10-已回访 11-申请无效投诉 12-有效投诉 13-无效投诉',
  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 0-全部, 1-启用, 2-禁用',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(工单派单)工单表';

CREATE TABLE `t_was_worksheet_syn` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `worksheet_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '工单id',

  `syid` varchar(50) NOT NULL COMMENT '思源工单id',
  `sy_work_ord` varchar(50) NOT NULL COMMENT '思源工单号',
  `workpos` varchar(100) NOT NULL COMMENT '工作位置  有房号是房号  没有则不填',
  `sy_question_id` varchar(50) NOT NULL COMMENT '思源工单问题id',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79476 DEFAULT CHARSET=utf8 COMMENT='(工单派单)工单任务同步延伸表';

CREATE TABLE `t_was_worksheet_media` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `worksheet_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '工单id',

  `origin_type` INT(11) NOT NULL DEFAULT 0 COMMENT '类型: 1-现场图片， 2-签名照片',

  `type` INT(11) NOT NULL DEFAULT 0 COMMENT '类型: 1-文字, 2-图片, 3-声音, 4-视频, 5-链接, 99-其它',

  `url` VARCHAR(127) NOT NULL DEFAULT '' COMMENT '媒体Url',
  `priority` INT(11) NOT NULL DEFAULT 0 COMMENT '排序优先级',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(工单派单)工单媒体表';

CREATE TABLE `t_was_worksheet_employee` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `type` INT(11) NOT NULL DEFAULT 0 COMMENT '类型: 1-责任人, 2-协助人',

  `worksheet_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '工单id',

  `employee_id` INT(11) NOT NULL DEFAULT 0 COMMENT '员工ID',
  `employee_name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '员工姓名', -- 冗余字段`

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(工单派单)工单-员工表';

CREATE TABLE `t_was_worksheet_revisit` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `worksheet_id` BIGINT(20) NOT NULL COMMENT '工单id',

  `revisit_time` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '回访时间',
  `revisit_by_name` VARCHAR(63) NOT NULL COMMENT '回访人员姓名',

  `satisfaction` INT(11) NOT NULL DEFAULT 0 COMMENT '回访满意度 0-全部 1-非常满意  2-满意  3-一般  4-不满意  5-非常不满意',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 0-全部, 1-成功, 2-失败',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(工单派单)工单回访表';

CREATE TABLE `t_was_worksheet_complaint` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `worksheet_id` BIGINT(20) NOT NULL COMMENT '工单id',

  `by_the_complainant` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '被投诉人ID',
  `by_the_complainant_username` VARCHAR(256) NOT NULL COMMENT '被投诉人姓名',
  `created_in` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '报事时间/投诉时间',

  `department_id` BIGINT(20) NOT NULL DEFAULT '' COMMENT '被投诉的部门ID',
  `department_name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '被投诉的部门',

  `satisfaction` INT(11) NOT NULL DEFAULT '0' COMMENT '投诉处理满意度 0-全部 1-满意 2-一般 3-不满意',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 0-全部, 1-启用, 2-禁用',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(工单派单)工单-投诉类工单扩展表';

-- wic: worksheet_invalidate_complaint
CREATE TABLE `t_wfs_wic_workflow_defination` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `type` INT(11) NOT NULL DEFAULT '1' COMMENT '类型 0-全部 1-集团默认 2-小区自定义',

  `property_project_id` BIGINT(20) NOT NULL COMMENT '项目id',

  -- `code` VARCHAR(63) NOT NULL COMMENT 'CODE',
  `name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '流程节点名称',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '无效投诉状态 0-全部 1已发起投诉 2已通过 3已拒绝 4已关闭',
  `description` VARCHAR(255) NOT NULL COMMENT '申请无效投诉的描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(工单派单)投诉类工单无效申诉-流程定义表';

-- wic: worksheet_invalidate_complaint
CREATE TABLE `t_wfs_wic_workflow_defination_node` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `workflow_defination_id` BIGINT(20) NOT NULL COMMENT '流程定义id',  -- t_wfs_wic_workflow_defination.id

  `type` INT(11) NOT NULL DEFAULT '1' COMMENT '类型 0-全部 1-start 2-normal 3-end',

  -- `code` VARCHAR(63) NOT NULL COMMENT 'CODE',
  `name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '流程节点名称',

  `next_node_yes_id` BIGINT(20) NOT NULL COMMENT '下一个节点id', -- 不考虑回溯与分支，只有通过/不通过两种分支
  `next_node_no_id` BIGINT(20) NOT NULL COMMENT '下一个节点id', -- 不考虑回溯与分支，只有通过/不通过两种分支

  `can_closed` INT(11) NOT NULL DEFAULT 0 COMMENT '是否可以关闭投诉 0-全部 1-可以 2-不可以',
  `can_edit` INT(11) NOT NULL DEFAULT 0 COMMENT '节点是否可以编辑 0-全部 1-可以新增节点 2-不可以 3-可以删除节点',

  `department_id` BIGINT(20) DEFAULT 0 COMMENT '部门id',
  `position_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '职位id',
  `employee_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '员工id',
  `employee_name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '员工姓名', -- 冗余字段

  `scope` VARCHAR(63) NOT NULL DEFAULT '' COMMENT 'scope, G-集团， C-分公司， P-项目',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '无效投诉状态 0-全部 1已发起投诉 2已通过 3已拒绝 4已关闭',
  `description` VARCHAR(255) NOT NULL COMMENT '申请无效投诉的描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
)  ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(工单派单)投诉类工单无效申诉-流程定义节点表';

-- wic: worksheet_invalidate_complaint
CREATE TABLE `t_wfs_wic_workflow` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `workflow_defination_id` BIGINT(20) NOT NULL COMMENT '流程定义id',
  `workflow_defination_node_id` BIGINT(20) NOT NULL COMMENT '流程定义节点id',
  `worksheet_id` BIGINT(20) NOT NULL COMMENT '工单表id',

  `launch_by_employee_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '发起员工id',
  `launch_by_employee_name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '发起员工姓名', -- 冗余字段

  `current_node_id` BIGINT(20) NOT NULL COMMENT '当前t_wfs_wic_workflow_defination_node节点id',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '流程实例状态 0-全部 1-已申请 2-审批中 3-已通过 4-已拒绝 5-已中止 6-已关闭',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(工单派单)投诉类工单无效申诉-工作流表';

-- wic: worksheet_invalidate_complaint
CREATE TABLE `t_wfs_wic_workflow_node` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `workflow_id` BIGINT(20) NOT NULL COMMENT '流程id', -- t_was_wic_workflow.id

  `type` INT(11) NOT NULL DEFAULT 0 COMMENT '类型 1-申请 2-审批',

  `employee_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '(操作者)员工id',
  `employee_name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '(操作者)员工姓名', -- 冗余字段
  `audit_action` INT(11) NOT NULL DEFAULT 0 COMMENT '节点状态 0-全部 1-不通过 2-通过',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '节点状态 0-全部 1-未处理 2-已处理',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(工单派单)投诉类工单无效申诉-工作流节点表';

-- wic: worksheet_invalidate_complaint
CREATE TABLE `t_wfs_wic_workflow_node_media` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `workflow_node_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '投诉类工单无效申诉-工作流节点表id',  -- t_was_wic_workflow_node.id

  `type` INT(11) NOT NULL DEFAULT 0 COMMENT '类型: 1-文字, 2-图片, 3-声音, 4-视频, 5-链接, 99-其它',

  `url` VARCHAR(127) NOT NULL DEFAULT '' COMMENT '媒体Url',
  `priority` INT(11) NOT NULL DEFAULT 0 COMMENT '排序优先级',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(工单派单)投诉类工单无效申诉-工作流节点-媒体表';

CREATE TABLE `t_cim_property_project_cim_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,

  `company_id` bigint(20) NOT NULL COMMENT '公司id',
  `company_name` varchar(63) NOT NULL DEFAULT '' COMMENT '公司名称(冗余字段)',

  `property_project_id` bigint(20) NOT NULL COMMENT '项目id',
  `property_project_name` varchar(63) NOT NULL DEFAULT '' COMMENT '项目名称(冗余字段)',

  `date` datetime NOT NULL COMMENT '日期',

  `amount` int(11) NOT NULL DEFAULT 0 COMMENT '需拜访的业主户数数量',
  `total_assign_amount` int(11) NOT NULL DEFAULT 0 COMMENT '已分派总数量',

  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '操作者id',
  `user_name` varchar(63) NOT NULL DEFAULT '' COMMENT '操作者名称(冗余字段)',

  `meta_created` datetime NOT NULL COMMENT '创建时间',
  `meta_updated` datetime NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` int(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1525 DEFAULT CHARSET=utf8 COMMENT='(客户拜访)项目-客户拜访-设置';

CREATE TABLE `t_cim_task` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `setting_id` bigint(20) NOT NULL COMMENT '配置id',

  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '名称',

  `assign_amount` INT(11) NOT NULL DEFAULT 0 COMMENT '分配数量',
  `complete_amount` INT(11) NOT NULL DEFAULT 0 COMMENT '完成拜访数量',

  `required_time` DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '要求完成时间',

  `create_by` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '分派任务的员工id',
  `assign_by_username` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '员工用户名',    --  冗余字段

  `employee_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '员工id',
  `employee_name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '拜访责任人-员工姓名',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '任务状态 0-all',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)任务表';

CREATE TABLE `t_cim_task_item` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `cim_task_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务ID', -- t_cim_task.id
  `resident_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '业主id',
  `resident_name` VARCHAR(63) NOT NULL DEFAULT 0 COMMENT '业主姓名',
  `resident_phone` VARCHAR(20) NOT NULL DEFAULT 0 COMMENT '业主电话',
  `resident_address` VARCHAR(255) NOT NULL DEFAULT 0 COMMENT '业主地址',

  `visit_phone` VARCHAR(32)  NOT NULL DEFAULT '' COMMENT '被拜访人电话',
  `visit_name` VARCHAR(63)  NOT NULL DEFAULT '' COMMENT '被拜访人',
  `visit_time` DATETIME  NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '拜访时间',

  `satisfaction` INT(11) NOT NULL DEFAULT 0 COMMENT '回访满意度 0-全部 1-非常满意  2-满意  3-一般  4-不满意  5-非常不满意',
  `signature` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '业主签名',

  `revisit_state` INT(11) NOT NULL DEFAULT 1 COMMENT '回访状态 0-all, 1-未回访，2-已回访',
  `revisit_name` VARCHAR(63)  NOT NULL DEFAULT '' COMMENT '回访人',
  `revisit_date` DATETIME  NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '回访时间',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '任务状态 0-all',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)任务明细表';

CREATE TABLE `t_cim_task_item_worksheet` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `cim_task_item_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务项ID', -- t_cim_task_item.id
  `worksheet_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '工单id',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '任务状态 0-all',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='(品质巡查)任务表';

CREATE TABLE `t_cim_task_item_revisit` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `cim_task_item_id` BIGINT(20) NOT NULL COMMENT '任务明细表ID',

  -- `key_name` VARCHAR(31) NOT NULL DEFAULT '' COMMENT '键(值)',
  -- `value` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '值(资源相对路径)',

  `have_time` INT(11) NOT NULL DEFAULT 0 COMMENT '是否有时间 0-all 1-方便回访 2-不方便 3-不希望回访',
  `visited` INT(11) NOT NULL DEFAULT 0 COMMENT '是否回访过 0-all 1-是 2- 否',
  `satisfaction` INT(11) NOT NULL DEFAULT 0 COMMENT '满意度 0-all 1-满意 2-不满意',

  `state` INT(11) NOT NULL DEFAULT 0,
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='任务明细回访表';


CREATE TABLE `t_app_feedback` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `uid` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `employee_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '员工id',
  `content` VARCHAR(255) NOT NULL COMMENT '内容',
  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',
  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='app意见反馈表';






