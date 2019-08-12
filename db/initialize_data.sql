TRUNCATE TABLE t_browser_type;
/*!40000 ALTER TABLE `t_browser_type` DISABLE KEYS */;
INSERT INTO `t_browser_type` (`id`, `code`, `name`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
  (1, '', 'PC', 1, 'PC', '', '', '', '', NOW(), NOW(), 1),
  (2, '', 'Mobile', 1, 'Mobile', '', '', '', '', NOW(), NOW(), 1),
  (3, '', 'Server', 1, 'Server', '', '', '', '', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_browser_type` ENABLE KEYS */;


TRUNCATE TABLE t_browser;
/*!40000 ALTER TABLE `t_browser` DISABLE KEYS */;
INSERT INTO `t_browser` (`id`, `browser_type_id`, `code`, `name`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
  (1, 1, '', 'Chrome', 1, 'PC-Chrome', '', '', '', '', NOW(), NOW(), 1),
  (2, 1, '', 'Edge', 1, 'PC-Edge', '', '', '', '', NOW(), NOW(), 1),
  (3, 1, '', 'Firefox', 1, 'PC-Firefox', '', '', '', '', NOW(), NOW(), 1),
  (4, 1, '', 'Internet Explorer', 1, 'PC-Internet Explorer', '', '', '', '', NOW(), NOW(), 1),
  (5, 1, '', 'Opera', 1, 'PC-Opera', '', '', '', '', NOW(), NOW(), 1),
  (6, 1, '', 'Safari', 1, 'PC-Safari', '', '', '', '', NOW(), NOW(), 1),
  (7, 2, '', 'Android webview', 1, 'Mobile-Android webview', '', '', '', '', NOW(), NOW(), 1),
  (8, 2, '', 'Chrome for Android', 1, 'Mobile-Chrome for Android', '', '', '', '', NOW(), NOW(), 1),
  (9, 2, '', 'Firefox for Android', 1, 'Mobile-Firefox for Android', '', '', '', '', NOW(), NOW(), 1),
  (10, 2, '', 'Opera for Android', 1, 'Mobile-Opera for Android', '', '', '', '', NOW(), NOW(), 1),
  (11, 2, '', 'Safari on iOS', 1, 'Mobile-Safari on iOS', '', '', '', '', NOW(), NOW(), 1),
  (12, 2, '', 'Samsung Internet', 1, 'Mobile-Samsung Internet', '', '', '', '', NOW(), NOW(), 1),
  (13, 3, '', 'Node.js', 1, 'Server-Node.js', '', '', '', '', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_browser` ENABLE KEYS */;


TRUNCATE TABLE t_browser_version;
/*!40000 ALTER TABLE `t_browser_version` DISABLE KEYS */;
INSERT INTO `t_browser_version` (`id`, `browser_id`, `code`, `name`, `version`, `release_date`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
  (1, 4, '', '1', 10, '1995-08-01 00:00:00', 1, 'PC-Internet Explorer-1', '', '', '', '', NOW(), NOW(), 1),
  (2, 4, '', '2', 20, '1995-11-01 00:00:00', 1, 'PC-Internet Explorer-2', '', '', '', '', NOW(), NOW(), 1),
  (3, 4, '', '3', 30, '1996-08-01 00:00:00', 1, 'PC-Internet Explorer-3', '', '', '', '', NOW(), NOW(), 1),
  (4, 4, '', '4', 40, '1997-10-01 00:00:00', 1, 'PC-Internet Explorer-4', '', '', '', '', NOW(), NOW(), 1),
  (5, 4, '', '5', 50, '1999-03-01 00:00:00', 1, 'PC-Internet Explorer-5', '', '', '', '', NOW(), NOW(), 1),
  (6, 4, '', '5.5', 55, '2000-07-01 00:00:00', 1, 'PC-Internet Explorer-5.5', '', '', '', '', NOW(), NOW(), 1),
  (7, 4, '', '6', 60, '2001-10-01 00:00:00', 1, 'PC-Internet Explorer-6', '', '', '', '', NOW(), NOW(), 1),
  (8, 4, '', '7', 70, '2006-10-18 00:00:00', 1, 'PC-Internet Explorer-7', '', '', '', '', NOW(), NOW(), 1),
  (9, 4, '', '8', 80, '2009-03-19 00:00:00', 1, 'PC-Internet Explorer-8', '', '', '', '', NOW(), NOW(), 1),
  (10, 4, '', '9', 90, '2011-03-14 00:00:00', 1, 'PC-Internet Explorer-9', '', '', '', '', NOW(), NOW(), 1),
  (11, 4, '', '10', 100, '2011-04-12 00:00:00', 1, 'PC-Internet Explorer-10', '', '', '', '', NOW(), NOW(), 1),
  (12, 4, '', '11', 110, '2013-06-26 00:00:00', 1, 'PC-Internet Explorer-11', '', '', '', '', NOW(), NOW(), 1),
  (13, 2, '', '12', 120, '1970-01-01 00:00:00', 1, 'PC-Edge-12', '', '', '', '', NOW(), NOW(), 1),
  (14, 2, '', '14', 140, '1970-01-01 00:00:00', 1, 'PC-Edge-14', '', '', '', '', NOW(), NOW(), 1),
  (15, 1, '', '1', 10, '1970-01-01 00:00:00', 1, 'PC-Chrome-1', '', '', '', '', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_browser_version` ENABLE KEYS */;


TRUNCATE TABLE t_language;
/*!40000 ALTER TABLE `t_language` DISABLE KEYS */;
INSERT INTO `t_language` (`id`, `code`, `name`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
  (1, '', 'HTML', 1, '', '', '', '', '', NOW(), NOW(), 1),
  (2, '', 'CSS', 1, '', '', '', '', '', NOW(), NOW(), 1),
  (3, '', 'JavaScript', 1, '', '', '', '', '', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_language` ENABLE KEYS */;


TRUNCATE TABLE t_knowledge_category;
/*!40000 ALTER TABLE `t_knowledge_category` DISABLE KEYS */;
INSERT INTO `t_knowledge_category` (`id`, `parent_id`, `level`, `path`, `code`, `name`, `priority`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
  (1, 1, 1, '1', 'ROOT', '根节点', 1, 1, '', '', '', '', '', NOW(), NOW(), 1),

  (2, 1, 2, '1|2', 'HTML', 'HTML', 1, 1, '', '', '', '', '', NOW(), NOW(), 1),
  (3, 1, 2, '1|3', 'CSS', 'CSS', 1, 1, '', '', '', '', '', NOW(), NOW(), 1),
  (4, 1, 2, '1|4', 'JAVASCRIPT', 'JavaScript', 1, 1, '', '', '', '', '', NOW(), NOW(), 1),
  (5, 1, 2, '1|5', 'WEBAPI', 'Web API', 1, 1, '', '', '', '', '', NOW(), NOW(), 1),

  (6, 3, 3, '1|3|6', 'SELECTOR', '选择器', 1, 1, '', '', '', '', '', NOW(), NOW(), 1),
  (7, 3, 3, '1|3|7', 'PROPERTY', '属性', 1, 1, '', '', '', '', '', NOW(), NOW(), 1),
  (8, 3, 3, '1|3|8', 'UNIT', '单位', 1, 1, '', '', '', '', '', NOW(), NOW(), 1),
  (9, 3, 3, '1|3|9', 'COLOR', '颜色', 1, 1, '', '', '', '', '', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_knowledge_category` ENABLE KEYS */;


TRUNCATE TABLE t_knowledge;
/*!40000 ALTER TABLE `t_knowledge` DISABLE KEYS */;
INSERT INTO `t_knowledge` (`id`, `code`, `name`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
  (1, '', 'align-content', 1, '', '', '', '', '', NOW(), NOW(), 1),
  (2, '', 'align-items', 1, '', '', '', '', '', NOW(), NOW(), 1),
  (3, '', 'align-self', 1, '', '', '', '', '', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_knowledge` ENABLE KEYS */;


TRUNCATE TABLE t_knowledge_language;
/*!40000 ALTER TABLE `t_knowledge_language` DISABLE KEYS */;
INSERT INTO `t_knowledge_language` (`id`, `language_id`, `knowledge_id`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
  (1, 2, 1, 1, 'CSS:align-content', '', '', '', '', NOW(), NOW(), 1),
  (2, 2, 2, 1, 'CSS:align-items', '', '', '', '', NOW(), NOW(), 1),
  (3, 2, 3, 1, 'CSS:align-self', '', '', '', '', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_knowledge_language` ENABLE KEYS */;


TRUNCATE TABLE t_knowledge_browser_version_full_support;
/*!40000 ALTER TABLE `t_knowledge_browser_version_full_support` DISABLE KEYS */;
INSERT INTO `t_knowledge_browser_version_full_support` (`id`, `knowledge_id`, `browser_version_id`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
  (1, 1, 10, 1, 'align-content:PC-Internet Explorer-9', '', '', '', '', NOW(), NOW(), 1),
  (2, 2, 11, 1, 'align-items:PC-Internet Explorer-10', '', '', '', '', NOW(), NOW(), 1),
  (3, 3, 9, 1, 'align-self:PC-Internet Explorer-8', '', '', '', '', NOW(), NOW(), 1),
  (4, 1, 15, 1, 'align-content:PC-Chrome-1', '', '', '', '', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_knowledge_browser_version_full_support` ENABLE KEYS */;


TRUNCATE TABLE t_knowledge_browser_version_hack_support;
/*!40000 ALTER TABLE `t_knowledge_browser_version_hack_support` DISABLE KEYS */;
INSERT INTO `t_knowledge_browser_version_hack_support` (`id`, `knowledge_id`, `browser_version_id`, `state`, `description`, `ext_1`, `ext_2`, `ext_3`, `ext_4`, `meta_created`, `meta_updated`, `meta_logic_flag`) VALUES
  (1, 1, 8, 1, 'align-content:PC-Internet Explorer-7', '', '', '', '', NOW(), NOW(), 1),
  (2, 2, 8, 1, 'align-items:PC-Internet Explorer-7', '', '', '', '', NOW(), NOW(), 1),
  (3, 3, 8, 1, 'align-self:PC-Internet Explorer-7', '', '', '', '', NOW(), NOW(), 1);
/*!40000 ALTER TABLE `t_knowledge_browser_version_hack_support` ENABLE KEYS */;










