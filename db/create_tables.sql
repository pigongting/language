
CREATE TABLE `t_lan_language` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `code` VARCHAR(31) NOT NULL DEFAULT '' COMMENT '代码',
  `name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '名称',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 0-全部, 1-启用, 2-禁用',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) NOT NULL DEFAULT '0',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='语言表';


CREATE TABLE `t_kng_knowledge_category` (
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='知识点分类表';


CREATE TABLE `t_kng_knowledge` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `code` VARCHAR(31) NOT NULL DEFAULT '' COMMENT '代码',
  `name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '名称',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 0-全部, 1-启用, 2-禁用',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) NOT NULL DEFAULT '0',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识点表';


CREATE TABLE `t_kng_knowledge_attachment` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `knowledge_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '知识点表id',

  `content`  TEXT NOT NULL COMMENT '内容',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME  NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME  NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 1 COMMENT '是否已经逻辑删除  1未删除  2已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='知识点-附加属性表';


CREATE TABLE `t_kng_knowledge_relation` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `knowledge_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '知识点表id',
  `knowledge_knowledge_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '知识点表id',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 0-全部, 1-启用, 2-禁用',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) NOT NULL DEFAULT '0',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识点-知识点 关联表';


CREATE TABLE `t_kng_knowledge_language` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `language_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '语言表id',
  `knowledge_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '知识点表id',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 0-全部, 1-启用, 2-禁用',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) NOT NULL DEFAULT '0',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识点-语言 关联表';


CREATE TABLE `t_kng_knowledge_knowledge_category` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `knowledge_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '知识点表id',
  `knowledge_category_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '知识点分类表id',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 0-全部, 1-启用, 2-禁用',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) NOT NULL DEFAULT '0',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识点-知识点分类 关联表';


CREATE TABLE `t_kng_knowledge_browser_version` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `knowledge_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '知识点表id',

  `full_support_browser_version_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '浏览器版本表id-第一个完全支持的版本',
  `hack_support_browser_version_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '浏览器版本表id-第一个特殊支持的版本',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 0-全部, 1-启用, 2-禁用',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) NOT NULL DEFAULT '0',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识点-浏览器版本 关联表';


CREATE TABLE `t_brs_browser_type` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `code` VARCHAR(31) NOT NULL DEFAULT '' COMMENT '代码',
  `name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '名称',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 0-全部, 1-启用, 2-禁用',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) NOT NULL DEFAULT '0',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='浏览器类型表';


CREATE TABLE `t_brs_browser` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `browser_type_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '浏览器类型表id',

  `code` VARCHAR(31) NOT NULL DEFAULT '' COMMENT '代码',
  `name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '名称',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 0-全部, 1-启用, 2-禁用',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) NOT NULL DEFAULT '0',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='浏览器表';


CREATE TABLE `t_brs_browser_version` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,

  `browser_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '浏览器表id',

  `code` VARCHAR(31) NOT NULL DEFAULT '' COMMENT '代码',
  `name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '名称',

  `version` INT(11) NOT NULL DEFAULT 0 COMMENT '版本代号',

  `release_date` DATETIME NOT NULL COMMENT '发布日期',
  `release_notes` VARCHAR(255) NOT NULL COMMENT '发布日志',
  `status` VARCHAR(255) NOT NULL COMMENT '状态',
  `engine` VARCHAR(255) NOT NULL COMMENT '引擎',
  `engine_version` VARCHAR(255) NOT NULL COMMENT '引擎版本',

  `state` INT(11) NOT NULL DEFAULT 0 COMMENT '状态 0-全部, 1-启用, 2-禁用',
  `description` VARCHAR(255) NOT NULL COMMENT '描述',

  `ext_1` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_2` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_3` VARCHAR(256) NOT NULL DEFAULT '',
  `ext_4` VARCHAR(256) NOT NULL DEFAULT '',

  `meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) NOT NULL DEFAULT '0',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='浏览器版本表';
