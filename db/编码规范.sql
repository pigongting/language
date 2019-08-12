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

-- 模块缩写
-- saas:software as a service 软件即服务(SAAS)
-- cms:content management system 内容管理系统 新闻/通知/提醒/告示

-- org:orginization     组织
-- biz:business         业务
-- dtb:distribution     渠道 销售渠道, 代理/商家
-- pay:payment          支付
-- flo:flow             流程
-- sys:system           系统
-- sec:security         安全
-- mem:member           会员
-- fin:financial        财务
-- lgc:logistics        物流
-- sta:storage          仓储
-- stc:statistics       统计
-- log:log              日志
-- app:app              移动端APP

-- k-saas-ternant
-- cmn:community        小区
-- pms:Packing Management System 道闸 车场管理系统
-- acs:Access Control System 门禁 访问控制系统
-- vms:Vedio Mirror System 监控 视频监控系统
-- sht:Smart Home Device 智能家居

-- k-service
-- qcs:quality control system 品质巡查
-- was:workSheets asign system 工单派单
-- eaf:equipment and facilities 设备设施

-- k-life
-- mal:mall                商城 网上商城
-- sbj:subjects            主题 软文/游记/推荐/话题/投票

-- 外键命名规则：
    -- <fk_(不带t和前缀)表名_(不带t和前缀)外键表名_外键字段名>
    -- fk_order_item_order_id
-- 表的主外键ID使用BIGINT(20), 其它所有的整型只用INT(11). 


CREATE TABLE `t_pre_template` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

	`parent_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '父级id',
    `level` INT(11) NOT NULL DEFAULT 0 COMMENT '层级',
    `path` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '路径',

    `category_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '类别ID',

    `type` INT(11) NOT NULL COMMENT '类型: 1-typeX, 2-typeY, ...',

    `no` VARCHAR(31) NOT NULL DEFAULT '' COMMENT '编号',
    `code` VARCHAR(31) NOT NULL DEFAULT '' COMMENT '代码',
    `name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '名称',

    `key` VARCHAR(31) NOT NULL DEFAULT '' COMMENT '键',
    `value` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '值',

    `quantity` DECIMAL(19,4) NOT NULL DEFAULT 0.0 COMMENT '数量',
	-- `unit_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '单位',
	`unit` VARCHAR(31) NOT NULL DEFAULT '' COMMENT '单位名称',
    `unit_price` DECIMAL(19,4) NOT NULL DEFAULT 0.0 COMMENT '单价',    -- GAAP
	`late_fee` DECIMAL(19,4) NOT NULL DEFAULT 0 COMMENT '滞纳金',
    `subtotal` DECIMAL(19,4) NOT NULL DEFAULT 0.0 COMMENT '小计',

    `release_date` DATETIME NOT NULL COMMENT '发布日期',
	`occurred_time` DATETIME NOT NULL COMMENT '发生时间',

    `priority` INT(11) NOT NULL DEFAULT 0 COMMENT '排序序号',

    `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态: 1-stateX, 2-stateY, ...',
    `description` VARCHAR(255) NOT NULL COMMENT '描述',
	
	`ext_1` VARCHAR(255) NOT NULL DEFAULT '',
    `ext_2` VARCHAR(255) NOT NULL DEFAULT '',
    `ext_3` VARCHAR(255) NOT NULL DEFAULT '',
    `ext_4` VARCHAR(255) NOT NULL DEFAULT '',

    `meta_created` DATETIME NOT NULL COMMENT '创建时间',
    `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
    `meta_logic_flag` INT(11) NOT NULL DEFAULT 0 COMMENT '是否已经逻辑删除: 1-未删除, 2-已删除',
    PRIMARY KEY (`id`),
	UNIQUE INDEX `uk_no` (`no`) -- ,
    -- CONSTRAINT `fk_t_pre_template-category_id-t_pre_template_category-id` FOREIGN KEY (`category_id`) REFERENCES `t_pre_template_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='模版表';