
DROP TABLE IF EXISTS `onethink_action`;
CREATE TABLE IF NOT EXISTS "onethink_action" (
  "id" int(11) unsigned NOT NULL COMMENT '主键',
  "name" char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  "title" char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  "remark" char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  "rule" text COMMENT '行为规则',
  "log" text COMMENT '日志规则',
  "type" tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  "status" tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  "update_time" int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间'
) AUTO_INCREMENT=12 ;

INSERT INTO `onethink_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 0, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 0, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 0, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, 1, 1383296765);

DROP TABLE IF EXISTS `onethink_action_log`;
CREATE TABLE IF NOT EXISTS "onethink_action_log" (
  "id" int(10) unsigned NOT NULL COMMENT '主键',
  "action_id" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  "user_id" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  "action_ip" bigint(20) NOT NULL COMMENT '执行行为者ip',
  "model" varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  "record_id" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  "remark" varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  "status" tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  "create_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间'
) AUTO_INCREMENT=362 ;

INSERT INTO `onethink_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(120, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-17 15:19登录了后台', 1, 1424157551),
(121, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-17 15:33登录了后台', 1, 1424158422),
(122, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-17 17:17登录了后台', 1, 1424164625),
(123, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-17 19:45登录了后台', 1, 1424173532),
(124, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-17 21:53登录了后台', 1, 1424181197),
(125, 10, 1, 2130706433, 'Menu', 27, '操作url：/admin.php?s=/Menu/edit.html', 1, 1424185127),
(126, 10, 1, 2130706433, 'Menu', 27, '操作url：/admin.php?s=/Menu/edit.html', 1, 1424186044),
(127, 10, 1, 2130706433, 'Menu', 27, '操作url：/admin.php?s=/Menu/edit.html', 1, 1424186456),
(128, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-17 23:27登录了后台', 1, 1424186851),
(129, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-18 08:41登录了后台', 1, 1424220092),
(130, 7, 1, 2130706433, 'model', 4, '操作url：/admin.php?s=/Model/update.html', 1, 1424221521),
(131, 8, 1, 2130706433, 'attribute', 33, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424222398),
(132, 7, 1, 2130706433, 'model', 4, '操作url：/admin.php?s=/Model/update.html', 1, 1424222476),
(133, 8, 1, 2130706433, 'attribute', 34, '操作url：/admin.php?s=/Model/generate.html', 1, 1424222572),
(134, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424222843),
(135, 8, 1, 2130706433, 'attribute', 35, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424222997),
(136, 8, 1, 2130706433, 'attribute', 36, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424223175),
(137, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424223274),
(138, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424223513),
(139, 8, 1, 2130706433, 'attribute', 37, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424223701),
(140, 8, 1, 2130706433, 'attribute', 36, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424223846),
(141, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424224095),
(142, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424224134),
(143, 8, 1, 2130706433, 'attribute', 38, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424224320),
(144, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424224343),
(145, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424224367),
(146, 8, 1, 2130706433, 'attribute', 39, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424224536),
(147, 8, 1, 2130706433, 'attribute', 39, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424224624),
(148, 8, 1, 2130706433, 'attribute', 39, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424224674),
(149, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424224738),
(150, 8, 1, 2130706433, 'attribute', 40, '操作url：/admin.php?s=/Model/generate.html', 1, 1424224858),
(151, 8, 1, 2130706433, 'attribute', 41, '操作url：/admin.php?s=/Model/generate.html', 1, 1424224858),
(152, 8, 1, 2130706433, 'attribute', 42, '操作url：/admin.php?s=/Model/generate.html', 1, 1424224858),
(153, 8, 1, 2130706433, 'attribute', 43, '操作url：/admin.php?s=/Model/generate.html', 1, 1424224858),
(154, 8, 1, 2130706433, 'attribute', 44, '操作url：/admin.php?s=/Model/generate.html', 1, 1424224858),
(155, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1424239790),
(156, 8, 1, 2130706433, 'attribute', 39, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424239574),
(157, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424239791),
(158, 8, 1, 2130706433, 'attribute', 45, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424240217),
(159, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424240250),
(160, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424240326),
(161, 8, 1, 2130706433, 'attribute', 36, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424240493),
(162, 8, 1, 2130706433, 'attribute', 36, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424240611),
(163, 8, 1, 2130706433, 'attribute', 36, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424240689),
(164, 8, 1, 2130706433, 'attribute', 37, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424240749),
(165, 8, 1, 2130706433, 'attribute', 45, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424240767),
(166, 8, 1, 2130706433, 'attribute', 35, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424240910),
(167, 8, 1, 2130706433, 'attribute', 35, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424240953),
(168, 8, 1, 2130706433, 'attribute', 37, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424240968),
(169, 8, 1, 2130706433, 'attribute', 46, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424241068),
(170, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424241099),
(171, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424241154),
(172, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424241310),
(173, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424241364),
(174, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424241803),
(175, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424241897),
(176, 8, 1, 2130706433, 'attribute', 47, '操作url：/admin.php?s=/Attribute/update.html', 1, 1424242022),
(177, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424242066),
(178, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424242138),
(179, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424242546),
(180, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424242595),
(181, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424242667),
(182, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424242907),
(183, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1424242967),
(184, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-19 14:48登录了后台', 1, 1424328523),
(185, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-02-19 20:28登录了后台', 1, 1424348892),
(186, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-19 23:27登录了后台', 1, 1424359653),
(187, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-02-20 10:12登录了后台', 1, 1424398363),
(188, 1, 4, 2130706433, 'member', 4, 'xjq123在2015-02-20 10:20登录了后台', 1, 1424398807),
(189, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-02-20 10:28登录了后台', 1, 1424399281),
(190, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-20 11:51登录了后台', 1, 1424404301),
(191, 9, 1, 2130706433, 'channel', 1, '操作url：/admin.php?s=/Channel/edit.html', 1, 1424404763),
(192, 9, 1, 2130706433, 'channel', 2, '操作url：/admin.php?s=/Channel/edit.html', 1, 1424404779),
(193, 9, 1, 2130706433, 'channel', 1, '操作url：/admin.php?s=/Channel/edit.html', 1, 1424406781),
(194, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/Channel/del/id/3.html', 1, 1424406795),
(195, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-20 18:59登录了后台', 1, 1424429960),
(196, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-23 18:45登录了后台', 1, 1424688334),
(197, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-26 17:47登录了后台', 1, 1424944057),
(198, 1, 1, 2130706433, 'member', 1, 'admin在2015-02-28 22:08登录了后台', 1, 1425132497),
(199, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-02-28 22:13登录了后台', 1, 1425132790),
(200, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-24 22:47登录了后台', 1, 1435157248),
(201, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-27 18:25登录了后台', 1, 1435400750),
(202, 1, 1, 2130706433, 'member', 1, 'admin在2015-07-16 12:49登录了后台', 1, 1437022180),
(203, 7, 1, 2130706433, 'model', 8, '操作url：/admin.php?s=/Model/update.html', 1, 1437024360),
(204, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-09-21 15:10登录了后台', 1, 1442819406),
(205, 1, 1, 2130706433, 'member', 1, 'admin在2015-09-21 15:20登录了后台', 1, 1442820010),
(206, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-06 17:34登录了后台', 1, 1444124047),
(207, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/Category/edit.html', 1, 1444128128),
(208, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-06 18:43登录了后台', 1, 1444128216),
(209, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-06 21:51登录了后台', 1, 1444139478),
(210, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-07 10:19登录了后台', 1, 1444184354),
(211, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-07 15:24登录了后台', 1, 1444202673),
(212, 8, 1, 2130706433, 'attribute', 48, '操作url：/admin.php?s=/Attribute/update.html', 1, 1444206487),
(213, 7, 1, 2130706433, 'model', 2, '操作url：/admin.php?s=/Model/update.html', 1, 1444206541),
(214, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-07 18:22登录了后台', 1, 1444213340),
(215, 11, 1, 2130706433, 'category', 39, '操作url：/admin.php?s=/Category/add.html', 1, 1444221410),
(216, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1444221558),
(217, 11, 1, 2130706433, 'category', 39, '操作url：/admin.php?s=/Category/edit.html', 1, 1444221561),
(218, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-07 21:39登录了后台', 1, 1444225190),
(219, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-08 12:29登录了后台', 1, 1444278590),
(220, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-08 13:41登录了后台', 1, 1444282872),
(221, 1, 3, -1062731517, 'member', 3, 'geniusxjq在2015-10-08 14:03登录了后台', 1, 1444284193),
(222, 1, 3, -1062731517, 'member', 3, 'geniusxjq在2015-10-08 14:04登录了后台', 1, 1444284281),
(223, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-08 15:19登录了后台', 1, 1444288799),
(224, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-08 15:19登录了后台', 1, 1444288796),
(225, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-08 17:51登录了后台', 1, 1444297885),
(226, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-08 23:40登录了后台', 1, 1444318813),
(227, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-09 12:24登录了后台', 1, 1444364651),
(228, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-09 15:21登录了后台', 1, 1444375314),
(229, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-09 17:32登录了后台', 1, 1444383150),
(230, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-09 18:10登录了后台', 1, 1444385409),
(231, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-09 21:57登录了后台', 1, 1444399024),
(232, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-10 11:26登录了后台', 1, 1444447598),
(233, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-11 00:47登录了后台', 1, 1444495635),
(234, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-12 14:10登录了后台', 1, 1444630202),
(235, 7, 1, 2130706433, 'model', 2, '操作url：/admin.php?s=/Model/update.html', 1, 1444638898),
(236, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-13 20:37登录了后台', 1, 1444739836),
(237, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-13 21:44登录了后台', 1, 1444743846),
(238, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-13 21:46登录了后台', 1, 1444743975),
(239, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-13 22:11登录了后台', 1, 1444745504),
(240, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-14 00:02登录了后台', 1, 1444752120),
(241, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-14 00:08登录了后台', 1, 1444752484),
(242, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-14 00:10登录了后台', 1, 1444752629),
(243, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-14 12:05登录了后台', 1, 1444795519),
(244, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-14 12:06登录了后台', 1, 1444795567),
(245, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-14 13:10登录了后台', 1, 1444799430),
(246, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-14 17:14登录了后台', 1, 1444814094),
(247, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-15 12:05登录了后台', 1, 1444881949),
(248, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-15 12:07登录了后台', 1, 1444882060),
(249, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-15 13:23登录了后台', 1, 1444886615),
(250, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-15 20:02登录了后台', 1, 1444910537),
(251, 1, 3, -1062731515, 'member', 3, 'geniusxjq在2015-10-15 23:26登录了后台', 1, 1444922795),
(252, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-15 23:29登录了后台', 1, 1444922954),
(253, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-16 11:55登录了后台', 1, 1444967752),
(254, 1, 3, -1062731515, 'member', 3, 'geniusxjq在2015-10-16 12:04登录了后台', 1, 1444968265),
(255, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-16 14:05登录了后台', 1, 1444975540),
(256, 7, 1, 2130706433, 'model', 2, '操作url：/admin.php?s=/Model/update.html', 1, 1444976420),
(257, 1, 1, -1062731515, 'member', 1, 'admin在2015-10-16 14:32登录了后台', 1, 1444977123),
(258, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-16 17:06登录了后台', 1, 1444986383),
(259, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-16 18:50登录了后台', 1, 1444992651),
(260, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-17 13:12登录了后台', 1, 1445058759),
(261, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-17 15:30登录了后台', 1, 1445067048),
(262, 1, 3, -1062731515, 'member', 3, 'geniusxjq在2015-10-17 16:06登录了后台', 1, 1445069216),
(263, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-17 16:58登录了后台', 1, 1445072303),
(264, 1, 3, -1062731515, 'member', 3, 'geniusxjq在2015-10-17 17:56登录了后台', 1, 1445075780),
(265, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-17 18:54登录了后台', 1, 1445079282),
(266, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-17 23:00登录了后台', 1, 1445094056),
(267, 1, 3, -1062731515, 'member', 3, 'geniusxjq在2015-10-17 23:43登录了后台', 1, 1445096636),
(268, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-18 09:31登录了后台', 1, 1445131867),
(269, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-19 10:35登录了后台', 1, 1445222142),
(270, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-19 15:05登录了后台', 1, 1445238351),
(271, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-19 17:47登录了后台', 1, 1445248079),
(272, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-20 17:36登录了后台', 1, 1445333819),
(273, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-20 17:50登录了后台', 1, 1445334620),
(274, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-20 22:32登录了后台', 1, 1445351552),
(275, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-20 23:03登录了后台', 1, 1445353436),
(276, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-21 13:05登录了后台', 1, 1445403901),
(277, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-21 17:44登录了后台', 1, 1445420694),
(278, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-21 18:06登录了后台', 1, 1445421996),
(279, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-21 19:38登录了后台', 1, 1445427521),
(280, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-21 20:47登录了后台', 1, 1445431657),
(281, 1, 3, -1062731515, 'member', 3, 'geniusxjq在2015-10-21 20:48登录了后台', 1, 1445431722),
(282, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-22 13:48登录了后台', 1, 1445492912),
(283, 1, 3, -1062731515, 'member', 3, 'geniusxjq在2015-10-22 13:49登录了后台', 1, 1445492977),
(284, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-22 16:15登录了后台', 1, 1445501749),
(285, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-22 17:48登录了后台', 1, 1445507311),
(286, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-22 18:05登录了后台', 1, 1445508324),
(287, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-22 22:05登录了后台', 1, 1445522745),
(288, 1, 3, -1062731515, 'member', 3, 'geniusxjq在2015-10-22 22:06登录了后台', 1, 1445522793),
(289, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-23 00:11登录了后台', 1, 1445530301),
(290, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-23 09:54登录了后台', 1, 1445565288),
(291, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-23 10:39登录了后台', 1, 1445567966),
(292, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-23 11:36登录了后台', 1, 1445571419),
(293, 1, 3, -1062731515, 'member', 3, 'geniusxjq在2015-10-23 11:42登录了后台', 1, 1445571753),
(294, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-23 11:43登录了后台', 1, 1445571799),
(295, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-23 12:04登录了后台', 1, 1445573075),
(296, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-24 14:14登录了后台', 1, 1445667243),
(297, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-24 14:15登录了后台', 1, 1445667335),
(298, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-24 14:20登录了后台', 1, 1445667639),
(299, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-24 14:31登录了后台', 1, 1445668271),
(300, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-24 14:32登录了后台', 1, 1445668366),
(301, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-24 14:35登录了后台', 1, 1445668552),
(302, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-24 14:39登录了后台', 1, 1445668784),
(303, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-24 15:05登录了后台', 1, 1445670331),
(304, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-24 15:07登录了后台', 1, 1445670423),
(305, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-24 18:16登录了后台', 1, 1445681803),
(306, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-25 11:59登录了后台', 1, 1445745580),
(307, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-25 22:42登录了后台', 1, 1445784156),
(308, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-25 23:11登录了后台', 1, 1445785878),
(309, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-26 16:12登录了后台', 1, 1445847150),
(310, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-27 09:19登录了后台', 1, 1445908799),
(311, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-27 09:22登录了后台', 1, 1445908970),
(312, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-27 13:15登录了后台', 1, 1445922945),
(313, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-27 14:02登录了后台', 1, 1445925769),
(314, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-27 14:55登录了后台', 1, 1445928941),
(315, 1, 3, -1062731515, 'member', 3, 'geniusxjq在2015-10-27 15:40登录了后台', 1, 1445931601),
(316, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-27 16:07登录了后台', 1, 1445933227),
(317, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-27 16:11登录了后台', 1, 1445933493),
(318, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-27 18:29登录了后台', 1, 1445941757),
(319, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-27 19:04登录了后台', 1, 1445943852),
(320, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-27 20:21登录了后台', 1, 1445948477),
(321, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-27 20:24登录了后台', 1, 1445948659),
(322, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-27 20:34登录了后台', 1, 1445949287),
(323, 1, 3, -1062731515, 'member', 3, 'geniusxjq在2015-10-27 20:38登录了后台', 1, 1445949517),
(324, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-28 00:00登录了后台', 1, 1445961613),
(325, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-28 00:29登录了后台', 1, 1445963354),
(326, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-28 11:26登录了后台', 1, 1446002799),
(327, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-28 13:49登录了后台', 1, 1446011382),
(328, 1, 3, -1062731515, 'member', 3, 'geniusxjq在2015-10-28 13:58登录了后台', 1, 1446011906),
(329, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-28 17:27登录了后台', 1, 1446024436),
(330, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-10-28 19:00登录了后台', 1, 1446030058),
(331, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-29 11:34登录了后台', 1, 1446089671),
(332, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-30 11:58登录了后台', 1, 1446177503),
(333, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-30 15:09登录了后台', 1, 1446188979),
(334, 1, 3, -1062731517, 'member', 3, 'geniusxjq在2015-10-30 18:57登录了后台', 1, 1446202628),
(335, 1, 3, -1062731517, 'member', 3, 'geniusxjq在2015-10-30 19:08登录了后台', 1, 1446203297),
(336, 1, 1, -1062731517, 'member', 1, 'admin在2015-10-30 19:09登录了后台', 1, 1446203346),
(337, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-31 12:04登录了后台', 1, 1446264284),
(338, 1, 1, 2130706433, 'member', 1, 'admin在2015-11-01 11:43登录了后台', 1, 1446349436),
(339, 1, 1, 2130706433, 'member', 1, 'admin在2002-01-01 01:37登录了后台', 1, 1009820252),
(340, 1, 1, 2130706433, 'member', 1, 'admin在2015-11-03 23:00登录了后台', 1, 1446562853),
(341, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-11-04 00:56登录了后台', 1, 1446569767),
(342, 1, 1, 2130706433, 'member', 1, 'admin在2015-11-04 10:23登录了后台', 1, 1446603802),
(343, 1, 1, 2130706433, 'member', 1, 'admin在2015-11-04 13:39登录了后台', 1, 1446615580),
(344, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-11-04 22:50登录了后台', 1, 1446648628),
(345, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-11-05 15:01登录了后台', 1, 1446706878),
(346, 1, 1, 2130706433, 'member', 1, 'admin在2015-11-05 17:26登录了后台', 1, 1446715560),
(347, 1, 3, 2130706433, 'member', 3, 'geniusxjq在2015-11-06 00:21登录了后台', 1, 1446740517),
(348, 1, 1, 2130706433, 'member', 1, 'admin在2015-11-06 10:12登录了后台', 1, 1446775950),
(349, 1, 1, 2130706433, 'member', 1, 'admin在2015-11-06 14:43登录了后台', 1, 1446792183),
(350, 1, 1, 2130706433, 'member', 1, 'admin在2015-11-07 07:47登录了后台', 1, 1446853629),
(351, 1, 1, 2130706433, 'member', 1, 'admin在2015-11-07 15:12登录了后台', 1, 1446880359),
(352, 1, 1, 2130706433, 'member', 1, 'admin在2015-11-07 19:15登录了后台', 1, 1446894906),
(353, 1, 1, 2130706433, 'member', 1, 'admin在2015-11-07 21:37登录了后台', 1, 1446903448),
(354, 1, 1, 2130706433, 'member', 1, 'admin在2015-11-08 09:27登录了后台', 1, 1446946024),
(355, 1, 1, 2130706433, 'member', 1, 'admin在2015-11-08 09:46登录了后台', 1, 1446947207),
(356, 1, 1, 2130706433, 'member', 1, 'admin在2015-11-08 12:17登录了后台', 1, 1446956234),
(357, 1, 1, 2130706433, 'member', 1, 'admin在2015-11-09 10:43登录了后台', 1, 1447036999),
(358, 1, 1, 2130706433, 'member', 1, 'admin在2015-11-09 12:24登录了后台', 1, 1447043052),
(359, 1, 1, 2130706433, 'member', 1, 'admin在2016-05-16 22:57登录了后台', 1, 1463410647),
(360, 1, 1, 2130706433, 'member', 1, 'admin在2016-05-17 03:30登录了后台', 1, 1463427016),
(361, 1, 1, 2130706433, 'member', 1, 'admin在2016-08-01 12:18登录了后台', 1, 1470025114);

DROP TABLE IF EXISTS `onethink_addons`;
CREATE TABLE IF NOT EXISTS "onethink_addons" (
  "id" int(10) unsigned NOT NULL COMMENT '主键',
  "name" varchar(40) NOT NULL COMMENT '插件名或标识',
  "title" varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  "description" text COMMENT '插件描述',
  "status" tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  "config" text COMMENT '配置',
  "author" varchar(40) DEFAULT '' COMMENT '作者',
  "url" varchar(255) DEFAULT '' COMMENT '插件作者首页链接',
  "version" varchar(20) DEFAULT '' COMMENT '版本号',
  "create_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  "has_adminlist" tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  "is_locked" tinyint(1) DEFAULT '0' COMMENT '插件是否已被锁定',
  "sort" int(10) DEFAULT '0' COMMENT '已安装插件菜单排序'
) AUTO_INCREMENT=200 ;

INSERT INTO `onethink_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `url`, `version`, `create_time`, `has_adminlist`, `is_locked`, `sort`) VALUES
(2, 'SiteStat', '站点统计信息', '统计站点的基础信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"1","display":"1","status":"0"}', 'thinkphp', '', '0.1', 1379512015, 0, 1, 0),
(3, 'DevTeam', '开发团队信息', '开发团队成员信息', 1, '{"title":"OneThink\\u5f00\\u53d1\\u56e2\\u961f","width":"2","display":"1"}', 'thinkphp', '', '0.1', 1379512022, 0, 1, 0),
(4, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '', '0.1', 1379512036, 0, 1, 0),
(5, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"300px","editor_resize_type":"1"}', 'thinkphp', '', '0.1', 1379830910, 0, 1, 0),
(6, 'Attachment', '附件', '用于文档模型上传附件', 1, 'null', 'thinkphp', '', '0.1', 1379842319, 1, 1, 11),
(9, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 0, '{"comment_type":"1","comment_uid_youyan":"","comment_short_name_duoshuo":"","comment_data_list_duoshuo":""}', 'thinkphp', '', '0.1', 1380273962, 0, 1, 0),
(15, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"2","editor_markdownpreview":"0","editor_height":"500px","editor_resize_type":"1"}', 'thinkphp', '', '0.1', 1383126253, 0, 1, 0),
(135, 'Friendlinks', '友情链接', '友情链接', 1, '{"is_open":"1"}', 'geniusxjq(app880.com)', 'http://app880.com', '0.1', 1423825560, 1, 1, 7),
(194, 'Advertising', '广告管理', '广告位插件，为网站增加广告管理功能。', 1, 'null', 'geniusxjq', 'http://www.app880.com', '2.0', 1446626227, 1, 0, 0),
(196, 'Water', '图片水印', '用于为上传的图片添加水印', 1, '{"switch":"1","type":"0","position":"9","textcolor":"#FFFFFF","fontsize":"21","font":"cour","offset":"20","angle":"0","alpha":"80","text":" APP880.com -- \\u5618\\u5618","water":".\\/Uploads\\/Water\\/Water.png"}', 'geniusxjq(app880.com)', 'http://app880.com', '0.1', 1446792309, 0, 0, 0),
(118, 'Mail', '邮件订阅', '邮件订阅插件', 1, 'null', 'geniusxjq(app880.com)', 'http://app880.com', '0.1', 1423650031, 1, 1, 8),
(198, 'ReturnTop', '返回顶部', '返回顶部', 1, '{"status":"1","theme":"rocket","support_title":"","customer":"","case":"","tel":"","qq":"","weibo":""}', 'CoreThink', '', '1.0', 1446957408, 0, 0, 0),
(153, 'Guestbook', '留言板', '这是一个简单的留言板', 1, '{"display":"1","messages_check":"1"}', 'geniusxjq(app880.com)', 'http://app880.com', '0.2', 1423925886, 1, 0, 5),
(147, 'BaiduShare', '百度分享', '用户将网站内容分享到第三方网站，第三方网站的用户点击专有的分享链接，从第三方网站带来社会化流量。', 0, '{"openbutton":"0","buttonlist":["mshare","qzone","tsina","renren","tqq","tieba"],"openimg":"0","imglist":["mshare","qzone","tsina","renren","tqq","tieba"],"openselect":"1","selectlist":["mshare","qzone","tsina","renren","tqq","tieba"]}', 'jesuspan', '', '0.1', 1423837279, 0, 0, 0),
(195, 'ImageManager', '图片管理', '图片管理，快速选择已上传图片到封面', 1, '{"page_size":"20","delete_switch":"1","delete_mode":"0"}', '凡人', '', '0.1', 1446781853, 0, 0, 0),
(157, 'Unslider', '焦点图', '焦点图', 0, '{"title":"Uslider","display":"1"}', 'cepljxiongjun', '', '0.1', 1423988274, 0, 0, 0),
(199, 'Schedule', '计划任务', '执行计划任务插件', 1, '{"is_open":"1","is_open_log":"1"}', 'geniusxjq(app880.com)', 'http://app880.com', '0.1', 1447045165, 1, 0, 0),
(193, 'Sensitive', '敏感词', '敏感词过滤插件', 1, '{"is_open":"1"}', 'geniusxjq(app880.com)', 'http://app880.com', '0.1', 1446544884, 1, 1, 0),
(140, 'SyncLogin', '第三方账号同步登陆', '第三方账号同步登陆', 1, '{"type":["qq","sina"],"meta":"","QqKEY":"","QqSecret":"","SinaKEY":"","SinaSecret":""}', 'yidian', '', '0.1', 1423825967, 0, 0, 0),
(151, 'Wechat', '微信', '微信插件', 1, '{"url":"http:\\/\\/localhost\\/admin.php?s=\\/Home\\/Addons\\/execute\\/_addons\\/Wechat\\/_controller\\/Wechat\\/_action\\/index\\/ukey\\/VNSrn2MJcatu9vs.html","ukey":"VNSrn2MJcatu9vs","token":"4fkgsny7jYp06d5G9cbahoIltFJOVA","appid":"","appsecret":"","codelogin":"0","codeloginlocation":null,"default":null,"subscribe":null,"button":null}', 'huay1', '', '1.0', 1423925643, 1, 0, 2),
(170, 'Fancybox', '图片弹出播放', '让文章内容页的图片有弹出图片播放的效果', 1, '{"group":"1","transitionIn":"none","transitionOut":"none","padding":"10","hideOnContentClick":"false","easingIn":"easeInOutCirc"}', 'che1988', '', '0.1', 1444126824, 0, 0, 0),
(158, 'Vote', '微投票', '支持单选、多选的小投票插件。可以用来收集用户对某几个选项的意见。', 1, '{"defaultid":"0","display":"1"}', 'Microrain', '', '1.0', 1423990253, 1, 0, 3),
(168, 'Avatar', '头像上传插件', '用户头像上传', 1, '{"random":"1"}', 'genisuxjq', '', '0.1', 1425134549, 0, 1, 0),
(163, 'ImportData', '数据导入', '这是一个用于从其他博客导入到OneThink的后台插件，目前支持WordPress,主要导入分类和文章！', 1, 'null', 'IT童老', '', '0.1', 1424068706, 1, 0, 1),
(173, 'UploadImages', '多图上传', '多图上传', 1, 'null', '木梁大囧', '', '1.2', 1444205270, 0, 1, 0),
(180, 'Comment', '评论', '本地独立评论插件', 1, '{"comment_title":"\\u8bc4\\u8bba\\u5217\\u8868","comment_enable":"1","comment_show_examine_not":"1","comment_verify":"1","comment_max_length":"150","comment_pagesize":"5","comment_need_login":"0","comment_template":"default"}', 'leoding86@msn.com', '', '0.8.0630Beta', 1444372674, 1, 0, 6);

DROP TABLE IF EXISTS `onethink_advertisement`;
CREATE TABLE IF NOT EXISTS "onethink_advertisement" (
  "id" int(11) unsigned NOT NULL COMMENT '主键',
  "title" char(80) NOT NULL DEFAULT '' COMMENT '广告名称',
  "position" int(11) NOT NULL COMMENT '广告位置',
  "advspic" int(11) NOT NULL COMMENT '图片地址(ID)',
  "advstext" text NOT NULL COMMENT '文字广告内容',
  "advshtml" text NOT NULL COMMENT '代码广告内容',
  "link" char(140) NOT NULL DEFAULT '' COMMENT '链接地址',
  "level" int(3) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  "status" tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  "is_never" tinyint(2) NOT NULL DEFAULT '0' COMMENT '永久有效不受时间限制的广告（0：不是，1：是）',
  "create_time" int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  "end_time" int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间'
) AUTO_INCREMENT=2 ;

INSERT INTO `onethink_advertisement` (`id`, `title`, `position`, `advspic`, `advstext`, `advshtml`, `link`, `level`, `status`, `is_never`, `create_time`, `end_time`) VALUES
(1, '011', 1, 0, 'test', '', '', 0, 1, 1, 1446626280, 1446626280);

DROP TABLE IF EXISTS `onethink_advertising`;
CREATE TABLE IF NOT EXISTS "onethink_advertising" (
  "id" int(11) unsigned NOT NULL COMMENT '主键',
  "title" char(80) NOT NULL DEFAULT '' COMMENT '广告位置名称',
  "type" int(11) unsigned NOT NULL DEFAULT '1' COMMENT '广告位置类型 1文字 2图片 3代码',
  "same_limit" int(11) unsigned NOT NULL DEFAULT '1' COMMENT '广告位同时展示的广告数量限制  1为默认展示一张',
  "idle_content" text NOT NULL COMMENT '广告位闲置时默认显示的广告内容',
  "width" char(20) NOT NULL DEFAULT '' COMMENT '广告位置宽度',
  "height" char(20) NOT NULL DEFAULT '' COMMENT '广告位置高度',
  "status" tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）'
) AUTO_INCREMENT=3 ;

INSERT INTO `onethink_advertising` (`id`, `title`, `type`, `same_limit`, `idle_content`, `width`, `height`, `status`) VALUES
(1, '01', 1, 1, '<p style="text-align: left;"><img src="http://img.baidu.com/hi/jx2/j_0001.gif"/></p>', '', '', 1),
(2, '02', 3, 1, '<p><img src="http://img.baidu.com/hi/jx2/j_0003.gif"/></p>', '100', '100', 1);

DROP TABLE IF EXISTS `onethink_attachment`;
CREATE TABLE IF NOT EXISTS "onethink_attachment" (
  "id" int(10) unsigned NOT NULL,
  "uid" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  "title" char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  "type" tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  "source" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  "record_id" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  "download" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  "size" bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  "dir" int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  "sort" int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  "create_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  "update_time" int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  "status" tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态'
) AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `onethink_attribute`;
CREATE TABLE IF NOT EXISTS "onethink_attribute" (
  "id" int(10) unsigned NOT NULL,
  "name" varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  "title" varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  "field" varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  "type" varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  "value" varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  "remark" varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  "is_show" tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  "extra" varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  "model_id" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  "is_must" tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  "status" tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  "update_time" int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  "create_time" int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  "validate_rule" varchar(255) NOT NULL DEFAULT '',
  "validate_time" tinyint(1) unsigned NOT NULL DEFAULT '0',
  "error_info" varchar(100) NOT NULL DEFAULT '',
  "validate_type" varchar(25) NOT NULL DEFAULT '',
  "auto_rule" varchar(100) NOT NULL DEFAULT '',
  "auto_time" tinyint(1) unsigned NOT NULL DEFAULT '0',
  "auto_type" varchar(25) NOT NULL DEFAULT ''
) AUTO_INCREMENT=49 ;

INSERT INTO `onethink_attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(1, 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, ''),
(2, 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', 1, '', 1, 0, 1, 1383894743, 1383891233, '', 0, '', '', '', 0, ''),
(3, 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', 1, '', 1, 0, 1, 1383894778, 1383891233, '', 0, '', '', '', 0, ''),
(4, 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', 0, '', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, ''),
(5, 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, ''),
(6, 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', 0, '', 1, 0, 1, 1384508323, 1383891233, '', 0, '', '', '', 0, ''),
(7, 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', 0, '', 1, 0, 1, 1384508543, 1383891233, '', 0, '', '', '', 0, ''),
(8, 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, ''),
(9, 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', 1, '1:目录\r\n2:主题\r\n3:段落', 1, 0, 1, 1384511157, 1383891233, '', 0, '', '', '', 0, ''),
(10, 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', 1, '[DOCUMENT_POSITION]', 1, 0, 1, 1383895640, 1383891233, '', 0, '', '', '', 0, ''),
(11, 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, ''),
(12, 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', 1, '', 1, 0, 1, 1384147827, 1383891233, '', 0, '', '', '', 0, ''),
(13, 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(14, 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(15, 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1387260355, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(16, 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, ''),
(17, 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, ''),
(18, 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', 0, '', 1, 0, 1, 1384508264, 1383891233, '', 0, '', '', '', 0, ''),
(19, 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', 1, '', 1, 0, 1, 1383895894, 1383891233, '', 0, '', '', '', 0, ''),
(20, 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 0, '', 1, 0, 1, 1384508277, 1383891233, '', 0, '', '', '', 0, ''),
(22, 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 0, 1, 1384508496, 1383891233, '', 0, '', '', '', 0, ''),
(23, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 2, 0, 1, 1384511049, 1383891243, '', 0, '', '', '', 0, ''),
(24, 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', 1, '', 2, 0, 1, 1383896225, 1383891243, '', 0, '', '', '', 0, ''),
(25, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', 1, '', 2, 0, 1, 1383896190, 1383891243, '', 0, '', '', '', 0, ''),
(26, 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 2, 0, 1, 1383896103, 1383891243, '', 0, '', '', '', 0, ''),
(27, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 3, 0, 1, 1387260461, 1383891252, '', 0, '', 'regex', '', 0, 'function'),
(28, 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', 1, '', 3, 0, 1, 1383896438, 1383891252, '', 0, '', '', '', 0, ''),
(29, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', 1, '', 3, 0, 1, 1383896429, 1383891252, '', 0, '', '', '', 0, ''),
(30, 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', 1, '', 3, 0, 1, 1383896415, 1383891252, '', 0, '', '', '', 0, ''),
(31, 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 3, 0, 1, 1383896380, 1383891252, '', 0, '', '', '', 0, ''),
(32, 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', 1, '', 3, 0, 1, 1383896371, 1383891252, '', 0, '', '', '', 0, ''),
(48, 'atlas', '图集', 'varchar(255) NOT NULL', 'pictures', '', '', 1, '', 2, 0, 1, 1444206487, 1444206487, '', 3, '', 'regex', '', 3, 'function');

DROP TABLE IF EXISTS `onethink_auth_extend`;
CREATE TABLE IF NOT EXISTS "onethink_auth_extend" (
  "group_id" mediumint(10) unsigned NOT NULL COMMENT '用户id',
  "extend_id" mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  "type" tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限'
);

INSERT INTO `onethink_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 1),
(1, 2, 2),
(1, 3, 2);

DROP TABLE IF EXISTS `onethink_auth_group`;
CREATE TABLE IF NOT EXISTS "onethink_auth_group" (
  "id" mediumint(8) unsigned NOT NULL COMMENT '用户组id,自增主键',
  "module" varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  "type" tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  "title" char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  "description" varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  "status" tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  "rules" varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开'
) AUTO_INCREMENT=3 ;

INSERT INTO `onethink_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'admin', 1, '默认用户组', '', 1, '2,7,8,9,10,11,12,13,14,15,16,17,18,79,211,217'),
(2, 'admin', 1, '测试用户', '测试用户', 1, '232,2,7,8,9,10,11,12,13,14,15,16,17,18,79,211,217');

DROP TABLE IF EXISTS `onethink_auth_group_access`;
CREATE TABLE IF NOT EXISTS "onethink_auth_group_access" (
  "uid" int(10) unsigned NOT NULL COMMENT '用户id',
  "group_id" mediumint(8) unsigned NOT NULL COMMENT '用户组id'
);

INSERT INTO `onethink_auth_group_access` (`uid`, `group_id`) VALUES
(3, 1);

DROP TABLE IF EXISTS `onethink_auth_rule`;
CREATE TABLE IF NOT EXISTS "onethink_auth_rule" (
  "id" mediumint(8) unsigned NOT NULL COMMENT '规则id,自增主键',
  "module" varchar(20) NOT NULL COMMENT '规则所属module',
  "type" tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  "name" char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  "title" char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  "status" tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  "condition" varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件'
) AUTO_INCREMENT=235 ;

INSERT INTO `onethink_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'admin', 2, 'Admin/Index/index', '首页', 1, ''),
(2, 'admin', 2, 'Admin/Article/index', '内容', 1, ''),
(3, 'admin', 2, 'Admin/User/index', '用户', 1, ''),
(4, 'admin', 2, 'Admin/Addons/index', '扩展', 1, ''),
(5, 'admin', 2, 'Admin/Config/group', '系统', 1, ''),
(7, 'admin', 1, 'Admin/article/add', '新增', 1, ''),
(8, 'admin', 1, 'Admin/article/edit', '编辑', 1, ''),
(9, 'admin', 1, 'Admin/article/setStatus', '改变状态', 1, ''),
(10, 'admin', 1, 'Admin/article/update', '保存', 1, ''),
(11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', 1, ''),
(12, 'admin', 1, 'Admin/article/move', '移动', 1, ''),
(13, 'admin', 1, 'Admin/article/copy', '复制', 1, ''),
(14, 'admin', 1, 'Admin/article/paste', '粘贴', 1, ''),
(15, 'admin', 1, 'Admin/article/permit', '还原', 1, ''),
(16, 'admin', 1, 'Admin/article/clear', '清空', 1, ''),
(17, 'admin', 1, 'Admin/Article/examine', '审核列表', 1, ''),
(18, 'admin', 1, 'Admin/article/recycle', '回收站', 1, ''),
(19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', 1, ''),
(20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, ''),
(21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, ''),
(22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, ''),
(23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, ''),
(24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, ''),
(25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, ''),
(26, 'admin', 1, 'Admin/User/index', '用户信息', 1, ''),
(27, 'admin', 1, 'Admin/User/action', '用户行为', 1, ''),
(28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, ''),
(29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, ''),
(30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, ''),
(31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, ''),
(32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, ''),
(33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存用户组', 1, ''),
(34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, ''),
(35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, ''),
(36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, ''),
(37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, ''),
(38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, ''),
(39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, ''),
(40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, ''),
(41, 'admin', 1, 'Admin/AuthManager/index', '权限管理', 1, ''),
(42, 'admin', 1, 'Admin/Addons/create', '创建', 1, ''),
(43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, ''),
(44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, ''),
(45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, ''),
(46, 'admin', 1, 'Admin/Addons/config', '设置', 1, ''),
(47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, ''),
(48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, ''),
(49, 'admin', 1, 'Admin/Addons/install', '安装', 1, ''),
(50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, ''),
(51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, ''),
(52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, ''),
(53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, ''),
(54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, ''),
(55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, ''),
(56, 'admin', 1, 'Admin/model/add', '新增', 1, ''),
(57, 'admin', 1, 'Admin/model/edit', '编辑', 1, ''),
(58, 'admin', 1, 'Admin/model/setStatus', '改变状态', 1, ''),
(59, 'admin', 1, 'Admin/model/update', '保存数据', 1, ''),
(60, 'admin', 1, 'Admin/Model/index', '模型管理', 1, ''),
(61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, ''),
(62, 'admin', 1, 'Admin/Config/del', '删除', 1, ''),
(63, 'admin', 1, 'Admin/Config/add', '新增', 1, ''),
(64, 'admin', 1, 'Admin/Config/save', '保存', 1, ''),
(65, 'admin', 1, 'Admin/Config/group', '网站设置', 1, ''),
(66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, ''),
(67, 'admin', 1, 'Admin/Channel/add', '新增', 1, ''),
(68, 'admin', 1, 'Admin/Channel/edit', '编辑', 1, ''),
(69, 'admin', 1, 'Admin/Channel/del', '删除', 1, ''),
(70, 'admin', 1, 'Admin/Channel/index', '导航管理', 1, ''),
(71, 'admin', 1, 'Admin/Category/edit', '编辑', 1, ''),
(72, 'admin', 1, 'Admin/Category/add', '新增', 1, ''),
(73, 'admin', 1, 'Admin/Category/remove', '删除', 1, ''),
(74, 'admin', 1, 'Admin/Category/index', '分类管理', 1, ''),
(75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, ''),
(76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, ''),
(77, 'admin', 1, 'Admin/file/download', '下载', -1, ''),
(79, 'admin', 1, 'Admin/article/batchOperate', '导入', 1, ''),
(80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, ''),
(81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, ''),
(82, 'admin', 1, 'Admin/Database/export', '备份', 1, ''),
(83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, ''),
(84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, ''),
(86, 'admin', 1, 'Admin/Database/import', '恢复', 1, ''),
(87, 'admin', 1, 'Admin/Database/del', '删除', 1, ''),
(88, 'admin', 1, 'Admin/User/add', '新增用户', 1, ''),
(89, 'admin', 1, 'Admin/Attribute/index', '属性管理', 1, ''),
(90, 'admin', 1, 'Admin/Attribute/add', '新增', 1, ''),
(91, 'admin', 1, 'Admin/Attribute/edit', '编辑', 1, ''),
(92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', 1, ''),
(93, 'admin', 1, 'Admin/Attribute/update', '保存数据', 1, ''),
(94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, ''),
(95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, ''),
(96, 'admin', 1, 'Admin/Category/move', '移动', -1, ''),
(97, 'admin', 1, 'Admin/Category/merge', '合并', -1, ''),
(98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, ''),
(99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, ''),
(100, 'admin', 1, 'Admin/Menu/index', '菜单管理', 1, ''),
(101, 'admin', 1, 'Admin/other', '其他', -1, ''),
(102, 'admin', 1, 'Admin/Menu/add', '新增', 1, ''),
(103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, ''),
(104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, ''),
(105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', -1, ''),
(107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', 1, ''),
(108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, ''),
(109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, ''),
(110, 'admin', 1, 'Admin/action/edit', '查看行为日志', 1, ''),
(111, 'admin', 2, 'Admin/article/index', '文档列表', -1, ''),
(112, 'admin', 2, 'Admin/article/add', '新增', -1, ''),
(113, 'admin', 2, 'Admin/article/edit', '编辑', -1, ''),
(114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, ''),
(115, 'admin', 2, 'Admin/article/update', '保存', -1, ''),
(116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, ''),
(117, 'admin', 2, 'Admin/article/move', '移动', -1, ''),
(118, 'admin', 2, 'Admin/article/copy', '复制', -1, ''),
(119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, ''),
(120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, ''),
(121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, ''),
(122, 'admin', 2, 'Admin/article/permit', '还原', -1, ''),
(123, 'admin', 2, 'Admin/article/clear', '清空', -1, ''),
(124, 'admin', 2, 'Admin/User/add', '新增用户', -1, ''),
(125, 'admin', 2, 'Admin/User/action', '用户行为', -1, ''),
(126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, ''),
(127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, ''),
(128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, ''),
(129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, ''),
(130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, ''),
(131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, ''),
(132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, ''),
(133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, ''),
(134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, ''),
(135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, ''),
(136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, ''),
(137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, ''),
(138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, ''),
(139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存用户组', -1, ''),
(140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, ''),
(141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, ''),
(142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, ''),
(143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, ''),
(144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, ''),
(145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, ''),
(146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, ''),
(147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, ''),
(148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, ''),
(149, 'admin', 2, 'Admin/Addons/create', '创建', -1, ''),
(150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, ''),
(151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, ''),
(152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, ''),
(153, 'admin', 2, 'Admin/Addons/config', '设置', -1, ''),
(154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, ''),
(155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, ''),
(156, 'admin', 2, 'Admin/Addons/install', '安装', -1, ''),
(157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, ''),
(158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, ''),
(159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, ''),
(160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, ''),
(161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, ''),
(162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, ''),
(163, 'admin', 2, 'Admin/model/add', '新增', -1, ''),
(164, 'admin', 2, 'Admin/model/edit', '编辑', -1, ''),
(165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, ''),
(166, 'admin', 2, 'Admin/model/update', '保存数据', -1, ''),
(167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, ''),
(168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, ''),
(169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, ''),
(170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, ''),
(171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, ''),
(172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, ''),
(173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, ''),
(174, 'admin', 2, 'Admin/Config/del', '删除', -1, ''),
(175, 'admin', 2, 'Admin/Config/add', '新增', -1, ''),
(176, 'admin', 2, 'Admin/Config/save', '保存', -1, ''),
(177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, ''),
(178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, ''),
(179, 'admin', 2, 'Admin/Channel/add', '新增', -1, ''),
(180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, ''),
(181, 'admin', 2, 'Admin/Channel/del', '删除', -1, ''),
(182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, ''),
(183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, ''),
(184, 'admin', 2, 'Admin/Category/add', '新增', -1, ''),
(185, 'admin', 2, 'Admin/Category/remove', '删除', -1, ''),
(186, 'admin', 2, 'Admin/Category/move', '移动', -1, ''),
(187, 'admin', 2, 'Admin/Category/merge', '合并', -1, ''),
(188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, ''),
(189, 'admin', 2, 'Admin/Database/export', '备份', -1, ''),
(190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, ''),
(191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, ''),
(192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, ''),
(193, 'admin', 2, 'Admin/Database/import', '恢复', -1, ''),
(194, 'admin', 2, 'Admin/Database/del', '删除', -1, ''),
(195, 'admin', 2, 'Admin/other', '其他', 1, ''),
(196, 'admin', 2, 'Admin/Menu/add', '新增', -1, ''),
(197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, ''),
(198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, ''),
(199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, ''),
(201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, ''),
(202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, ''),
(203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, ''),
(204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, ''),
(205, 'admin', 1, 'Admin/think/add', '新增数据', 1, ''),
(206, 'admin', 1, 'Admin/think/edit', '编辑数据', 1, ''),
(207, 'admin', 1, 'Admin/Menu/import', '导入', 1, ''),
(208, 'admin', 1, 'Admin/Model/generate', '生成', 1, ''),
(209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, ''),
(210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, ''),
(211, 'admin', 1, 'Admin/Article/sort', '文档排序', 1, ''),
(212, 'admin', 1, 'Admin/Config/sort', '排序', 1, ''),
(213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, ''),
(214, 'admin', 1, 'Admin/Channel/sort', '排序', 1, ''),
(215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', 1, ''),
(216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', 1, ''),
(217, 'admin', 1, 'Admin/article/index', '文档列表', 1, ''),
(218, 'admin', 1, 'Admin/think/lists', '数据列表', 1, ''),
(219, 'admin', 1, 'Admin/Addons/sort', '已安装插件菜单排序', 1, ''),
(220, 'admin', 1, 'Admin/AuthManager/accessUser', '前台权限管理', 1, ''),
(221, 'admin', 1, 'Admin/AuthManager/addNode', '新增前台权限节点', 1, '');

DROP TABLE IF EXISTS `onethink_avatar`;
CREATE TABLE IF NOT EXISTS "onethink_avatar" (
  "id" int(11) NOT NULL,
  "uid" int(11) NOT NULL COMMENT '用户ID',
  "path" varchar(200) NOT NULL COMMENT '头像路径',
  "create_time" int(11) NOT NULL COMMENT '创建时间',
  "status" int(11) NOT NULL DEFAULT '0' COMMENT '头像状态，启用或禁用',
  "is_temp" int(11) NOT NULL DEFAULT '1' COMMENT '头像图片文件是否是临时图片（只有用户提交确认后才作为头像使用）[0=不是 1=是]'
) AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `onethink_category`;
CREATE TABLE IF NOT EXISTS "onethink_category" (
  "id" int(10) unsigned NOT NULL COMMENT '分类ID',
  "name" varchar(30) NOT NULL COMMENT '标志',
  "title" varchar(50) NOT NULL COMMENT '标题',
  "pid" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  "sort" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  "list_row" tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  "meta_title" varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  "keywords" varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  "description" varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  "template_index" varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  "template_lists" varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  "template_detail" varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  "template_edit" varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  "model" varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  "model_sub" varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  "type" varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  "link_id" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  "allow_publish" tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  "display" tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  "reply" tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  "check" tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  "reply_model" varchar(100) NOT NULL DEFAULT '',
  "extend" text COMMENT '扩展设置',
  "create_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  "update_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  "status" tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  "icon" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  "groups" varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义'
) AUTO_INCREMENT=40 ;

INSERT INTO `onethink_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `model_sub`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`, `groups`) VALUES
(1, 'blog', '博客', 0, 0, 10, '', '', '', '', '', '', '', '2,3', '2', '2,1', 0, 2, 1, 0, 0, '1', '', 1379474947, 1444128128, 1, 0, ''),
(2, 'default_blog', '默认分类', 1, 0, 10, '', '', '', '', '', '', '', '2,3', '2', '2,1,3', 0, 2, 1, 0, 1, '1', '', 1379475028, 1444221558, 1, 0, ''),
(39, 'feeling', '心得', 1, 1, 10, '', '', '', '', '', '', '', '2', '2', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1444221410, 1444221561, 1, 0, '');

DROP TABLE IF EXISTS `onethink_channel`;
CREATE TABLE IF NOT EXISTS "onethink_channel" (
  "id" int(10) unsigned NOT NULL COMMENT '频道ID',
  "pid" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  "title" char(30) NOT NULL COMMENT '频道标题',
  "url" char(100) NOT NULL COMMENT '频道连接',
  "sort" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  "create_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  "update_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  "status" tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  "target" tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开'
) AUTO_INCREMENT=4 ;

INSERT INTO `onethink_channel` (`id`, `pid`, `title`, `url`, `sort`, `create_time`, `update_time`, `status`, `target`) VALUES
(1, 0, '首页', 'Home/Index/index', 1, 1379475111, 1424406781, 1, 0),
(2, 0, '博客', 'Home/Article/index?category=blog', 2, 1379475131, 1424404779, 1, 0);

DROP TABLE IF EXISTS `onethink_comment`;
CREATE TABLE IF NOT EXISTS "onethink_comment" (
  "id" int(11) NOT NULL,
  "pid" int(11) NOT NULL DEFAULT '0',
  "pids" text NOT NULL,
  "did" int(11) NOT NULL DEFAULT '0',
  "uid" int(11) NOT NULL DEFAULT '0',
  "username" varchar(100) NOT NULL DEFAULT '',
  "content" text NOT NULL,
  "status" int(11) NOT NULL DEFAULT '0',
  "create_time" int(10) NOT NULL DEFAULT '0',
  "update_time" int(10) DEFAULT '0'
) AUTO_INCREMENT=20 ;

INSERT INTO `onethink_comment` (`id`, `pid`, `pids`, `did`, `uid`, `username`, `content`, `status`, `create_time`, `update_time`) VALUES
(9, 0, '0', 2, 0, '游客', 'sdfsfs', 0, 1446633965, 1446633965),
(8, 0, '0', 2, 0, '游客', '55', 0, 1446633951, 1446633951);

DROP TABLE IF EXISTS `onethink_config`;
CREATE TABLE IF NOT EXISTS "onethink_config" (
  "id" int(10) unsigned NOT NULL COMMENT '配置ID',
  "name" varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  "type" tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  "title" varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  "group" tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  "extra" varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  "remark" varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  "create_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  "update_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  "status" tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  "value" text COMMENT '配置值',
  "sort" smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序'
) AUTO_INCREMENT=49 ;

INSERT INTO `onethink_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1379235274, 1, 'OneThink', 10),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, 'OneThink内容管理框架', 14),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, 'ThinkPHP,OneThink', 23),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 19),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 11),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如"沪ICP备12007941号-2', 1378900335, 1379235859, 1, '', 26),
(11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位，推荐到多个位置KEY值相加即可', 1379053380, 1379235329, 1, '1:列表推荐\r\n2:频道推荐\r\n4:首页推荐', 15),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 20),
(13, 'COLOR_STYLE', 4, '后台色系', 1, 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', 1379122533, 1379235904, 1, 'blue_color', 29),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统\r\n5:邮箱', 21),
(21, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 27),
(22, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 32),
(23, 'OPEN_DRAFTBOX', 4, '是否开启草稿功能', 2, '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', 1379484332, 1379484591, 1, '1', 6),
(24, 'DRAFT_AUTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1422631047, 1, '60', 12),
(25, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 35),
(26, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '1', 16),
(27, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 17),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 24),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 30),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 34),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 36),
(32, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '1', 37),
(33, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1422704535, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 3),
(34, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 4),
(35, 'REPLY_LIST_ROWS', 0, '回复列表每页条数', 2, '', '', 1386645376, 1387178083, 1, '10', 5),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 38),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '1', 7),
(38, 'MAIL_TYPE', 4, '邮件方式', 5, '0:SMTP模块发送', '邮件发送方式。目前只支持SMTP方式', 1410491198, 1423723355, 1, '0', 22),
(39, 'MAIL_SMTP_HOST', 1, 'SMTP服务器', 5, '', '邮箱服务器名称【如：smtp.qq.com】', 1410491317, 1422687078, 1, 'smtp.qq.com', 25),
(40, 'MAIL_SMTP_PORT', 0, 'SMTP服务器端口', 5, '', '端口一般为25', 1410491384, 1410491384, 1, '25', 28),
(41, 'MAIL_SMTP_USER', 1, 'SMTP服务器用户名', 5, '', '邮箱用户名', 1410491508, 1410941682, 1, 'app880@foxmail.com', 31),
(42, 'MAIL_SMTP_PASS', 1, 'SMTP服务器密码', 5, '邮箱密码', '密码', 1410491656, 1410941695, 1, 'geniusxjqmail', 33),
(43, 'MAIL_SMTP_CE', 1, '邮件发送测试', 5, '', '发送测试邮件用的，测试你的邮箱配置成功没有', 1410491698, 1410937656, 1, 'app880@foxmail.com', 18),
(44, 'MAIL_REPLY_EMAIL', 1, '发件人邮箱', 5, '', '发件人邮箱，默认使用SMTP服务器用户名', 1410925495, 1422687971, 1, 'app880@foxmail.com', 13),
(45, 'MAIL_REPLY_NAME', 1, '发件人名称', 5, '', '发件人名称，默认使用网站名称【WEB_SITE_TITLE 网站标题】', 1422685995, 1422688174, 1, '嘘嘘', 8),
(46, 'WEB_SITE_NAME', 0, '网站名称', 1, '', '网站名称', 1422687631, 1422687631, 1, 'app880.com', 9);

DROP TABLE IF EXISTS `onethink_document`;
CREATE TABLE IF NOT EXISTS "onethink_document" (
  "id" int(10) unsigned NOT NULL COMMENT '文档ID',
  "uid" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  "name" char(40) NOT NULL DEFAULT '' COMMENT '标识',
  "title" char(80) NOT NULL DEFAULT '' COMMENT '标题',
  "category_id" int(10) unsigned NOT NULL COMMENT '所属分类',
  "group_id" smallint(3) unsigned NOT NULL COMMENT '所属分组',
  "description" char(140) NOT NULL DEFAULT '' COMMENT '描述',
  "root" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  "pid" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  "model_id" tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  "type" tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  "position" smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  "link_id" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  "cover_id" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  "display" tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  "deadline" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  "attach" tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  "view" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  "comment" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  "extend" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  "level" int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  "create_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  "update_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  "status" tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态'
) AUTO_INCREMENT=4 ;

DROP TABLE IF EXISTS `onethink_document_article`;
CREATE TABLE IF NOT EXISTS "onethink_document_article" (
  "id" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  "parse" tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  "content" text NOT NULL COMMENT '文章内容',
  "template" varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  "bookmark" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  "atlas" varchar(255) NOT NULL COMMENT '图集'
);

DROP TABLE IF EXISTS `onethink_document_download`;
CREATE TABLE IF NOT EXISTS "onethink_document_download" (
  "id" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  "parse" tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  "content" text NOT NULL COMMENT '下载详细描述',
  "template" varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  "file_id" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  "download" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  "size" bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小'
);

DROP TABLE IF EXISTS `onethink_file`;
CREATE TABLE IF NOT EXISTS "onethink_file" (
  "id" int(10) unsigned NOT NULL COMMENT '文件ID',
  "name" char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  "savename" char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  "savepath" char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  "ext" char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  "mime" char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  "size" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  "md5" char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  "sha1" char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  "location" tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  "url" varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',

  "create_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间'
) AUTO_INCREMENT=2 ;

INSERT INTO `onethink_file` (`id`, `name`, `savename`, `savepath`, `ext`, `mime`, `size`, `md5`, `sha1`, `location`, `url`, `create_time`) VALUES
(1, 'readme.txt', '54e19a9159656.txt', '2015-02-16/', 'txt', 'application/octet-stream', 1295, '2cf1b2ad2a5cc2cd84832390f92155f9', 'd160fd26e536d54a84a7310907d5484c1462af0a', 0, '', 1424071312);

DROP TABLE IF EXISTS `onethink_friendlinks`;
CREATE TABLE IF NOT EXISTS "onethink_friendlinks" (
  "id" int(11) unsigned NOT NULL COMMENT '主键',
  "type" int(1) NOT NULL DEFAULT '1' COMMENT '类别（1：图片，2：普通）',
  "title" char(80) NOT NULL DEFAULT '' COMMENT '站点名称',
  "cover_id" int(10) NOT NULL COMMENT '图片ID',
  "link" char(140) NOT NULL DEFAULT '' COMMENT '链接地址',
  "level" int(3) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  "status" tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  "create_time" int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间'
) AUTO_INCREMENT=6 ;

INSERT INTO `onethink_friendlinks` (`id`, `type`, `title`, `cover_id`, `link`, `level`, `status`, `create_time`) VALUES
(2, 2, 'app880.com', 0, 'http://app880.com', 0, 1, 1446607499),
(4, 1, 'test', 50, '', 0, 1, 1446568240);

DROP TABLE IF EXISTS `onethink_guestbook`;
CREATE TABLE IF NOT EXISTS "onethink_guestbook" (
  "id" int(11) NOT NULL,
  "nickname" varchar(224) NOT NULL COMMENT '留言昵称',
  "contact" varchar(225) NOT NULL COMMENT '留言者联系方式',
  "content" varchar(225) NOT NULL COMMENT '留言内容',
  "starttime" int(10) NOT NULL COMMENT '留言时间',
  "is_reply" int(11) NOT NULL COMMENT '是否回复',
  "is_pass" int(11) NOT NULL COMMENT '是否通过',
  "r_content" varchar(225) NOT NULL COMMENT '回复内容'
) AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `onethink_hooks`;
CREATE TABLE IF NOT EXISTS "onethink_hooks" (
  "id" int(10) unsigned NOT NULL COMMENT '主键',
  "name" varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  "description" text COMMENT '描述',
  "type" tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  "update_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  "addons" varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  "status" tinyint(1) unsigned NOT NULL DEFAULT '1'
) AUTO_INCREMENT=123 ;

INSERT INTO `onethink_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`, `status`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 1423988201, 'Unslider,Comment', 1),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, 'Attachment', 1),
(4, 'documentDetailAfter', '文档末尾显示', 1, 1423983209, 'Attachment,SocialComment,BaiduShare,Fancybox,Comment', 1),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, '', 1),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, 'Attachment', 1),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, 'Editor', 1),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin', 1),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SystemInfo,DevTeam,Mail,ImportData,Water', 1),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, 'Editor', 1),
(16, 'app_begin', '应用开始', 2, 1384481614, '', 1),
(86, 'Friendlinks', '调用（显示）友情链接的钩子', 1, 1423825560, 'Friendlinks', 1),
(27, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 1446980562, 'Unslider,Mail,ReturnTop,Comment', 1),
(29, 'dealPicture', '处理上传图片的钩子，对上传的图片进行额外的处理。水印。', 2, 1446897486, 'Water', 1),
(89, 'SyncLogin', '调用第三方账号同步登陆的钩子', 1, 1423825967, 'SyncLogin', 1),
(69, 'app_end', '应用结束', 2, 1423674478, 'Schedule', 1),
(105, 'Unslider', '图片轮播（焦点图）插件钩子', 1, 1423988274, 'Unslider', 1),
(101, 'WechatAdminLogin', '后台登陆页面钩子，用于微信二维码登陆', 1, 1423925643, 'Wechat', 1),
(102, 'WechatIndexLogin', '前台登陆页面钩子，用于微信二维码登陆', 1, 1423925643, 'Wechat', 1),
(104, 'Guestbook', '调用（显示）留言板的钩子', 1, 1423925886, 'Guestbook', 1),
(106, 'Vote', '调用（显示）投票插件的钩子', 1, 1423990253, 'Vote', 1),
(108, 'UploadAvatar', '调用（显示）头像上传的钩子', 1, 1425134549, 'Avatar', 1),
(109, 'AdminPageFooter', '后台钩子', 1, 1445875396, 'ImageManager', 1),
(110, 'UploadImages', '调用多图上传插件的钩子', 1, 1444205337, 'UploadImages', 1),
(122, 'Advertising', '调用广告位广告的钩子', 1, 1446626227, 'Advertising', 1);

DROP TABLE IF EXISTS `onethink_mail_history`;
CREATE TABLE IF NOT EXISTS "onethink_mail_history" (
  "id" int(11) NOT NULL,
  "title" varchar(255) NOT NULL,
  "body" text NOT NULL,
  "create_time" int(11) NOT NULL,
  "from" varchar(255) NOT NULL,
  "status" tinyint(4) NOT NULL
) AUTO_INCREMENT=7 ;

DROP TABLE IF EXISTS `onethink_mail_history_link`;
CREATE TABLE IF NOT EXISTS "onethink_mail_history_link" (
  "id" int(11) NOT NULL,
  "mail_id" int(11) NOT NULL,
  "to" varchar(255) NOT NULL,
  "status" tinyint(4) NOT NULL
) AUTO_INCREMENT=7 ;

DROP TABLE IF EXISTS `onethink_mail_list`;
CREATE TABLE IF NOT EXISTS "onethink_mail_list" (
  "id" int(11) NOT NULL,
  "address" varchar(255) NOT NULL,
  "status" tinyint(4) NOT NULL,
  "create_time" int(11) NOT NULL
) AUTO_INCREMENT=12 ;

INSERT INTO `onethink_mail_list` (`id`, `address`, `status`, `create_time`) VALUES
(1, '836692464@qq.com', 1, 1424018069),
(2, 'app880@foxmail.com', 1, 1445496165),
(3, 'qq@foxmail.com', 0, 1445572839),
(4, '8366@qq.com', 0, 1445581730),
(5, 'gg@123.com', 0, 1445581742),
(6, 'asd@123.com', 0, 1445586282),
(7, 'dd@foxmali.com', 0, 1445920291),
(8, 'ee@foxmali.com', 0, 1445920900),
(9, 'aa@123.com', 0, 1445929224),
(10, '88@88.com', 0, 1445945017),
(11, '123@qq.com', 0, 1446771330);

DROP TABLE IF EXISTS `onethink_mail_token`;
CREATE TABLE IF NOT EXISTS "onethink_mail_token" (
  "id" int(11) NOT NULL,
  "email" varchar(50) NOT NULL,
  "token" varchar(20) NOT NULL
) AUTO_INCREMENT=6 ;

INSERT INTO `onethink_mail_token` (`id`, `email`, `token`) VALUES
(5, '836692464@qq.com', 'SOrnUzGXr7');

DROP TABLE IF EXISTS `onethink_member`;
CREATE TABLE IF NOT EXISTS "onethink_member" (
  "uid" int(10) unsigned NOT NULL COMMENT '用户ID',
  "nickname" char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  "sex" tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  "birthday" date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  "qq" char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  "score" mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  "login" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  "reg_ip" bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  "reg_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  "last_login_ip" bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  "last_login_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  "status" tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态'
) AUTO_INCREMENT=5 ;

INSERT INTO `onethink_member` (`uid`, `nickname`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`) VALUES
(1, 'admin', 0, '0000-00-00', '', 260, 122, 0, 1422599239, 2130706433, 1470025114, 1),
(2, 'xjq', 0, '0000-00-00', '', 20, 6, 0, 0, 2130706433, 1424148677, -1),
(3, 'geniusxjq', 0, '0000-00-00', '', 160, 126, 2130706433, 1422700152, 2130706433, 1446740517, 1),
(4, 'xjq123', 0, '0000-00-00', '', 10, 1, 2130706433, 1424398807, 2130706433, 1424398807, -1);

DROP TABLE IF EXISTS `onethink_menu`;
CREATE TABLE IF NOT EXISTS "onethink_menu" (
  "id" int(10) unsigned NOT NULL COMMENT '文档ID',
  "title" varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  "pid" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  "sort" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  "url" char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  "hide" tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  "tip" varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  "group" varchar(50) DEFAULT '' COMMENT '分组',
  "is_dev" tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  "status" tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态'
) AUTO_INCREMENT=136 ;

INSERT INTO `onethink_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`, `status`) VALUES
(1, '首页', 0, 1, 'Index/index', 0, '', '', 0, 1),
(2, '内容', 0, 2, 'Article/index', 0, '', '', 0, 1),
(3, '文档列表', 2, 0, 'article/index', 1, '', '内容', 0, 1),
(4, '新增', 3, 0, 'article/add', 0, '', '', 0, 1),
(5, '编辑', 3, 0, 'article/edit', 0, '', '', 0, 1),
(6, '改变状态', 3, 0, 'article/setStatus', 0, '', '', 0, 1),
(7, '保存', 3, 0, 'article/update', 0, '', '', 0, 1),
(8, '保存草稿', 3, 0, 'article/autoSave', 0, '', '', 0, 1),
(9, '移动', 3, 0, 'article/move', 0, '', '', 0, 1),
(10, '复制', 3, 0, 'article/copy', 0, '', '', 0, 1),
(11, '粘贴', 3, 0, 'article/paste', 0, '', '', 0, 1),
(12, '导入', 3, 0, 'article/batchOperate', 0, '', '', 0, 1),
(13, '回收站', 2, 0, 'article/recycle', 1, '', '内容', 0, 1),
(14, '还原', 13, 0, 'article/permit', 0, '', '', 0, 1),
(15, '清空', 13, 0, 'article/clear', 0, '', '', 0, 1),
(16, '用户', 0, 3, 'User/index', 0, '', '', 0, 1),
(17, '用户信息', 16, 0, 'User/index', 0, '', '用户管理', 0, 1),
(18, '新增用户', 17, 0, 'User/add', 0, '添加新用户', '', 0, 1),
(19, '用户行为', 16, 0, 'User/action', 0, '', '行为管理', 0, 1),
(20, '新增用户行为', 19, 0, 'User/addaction', 0, '', '', 0, 1),
(21, '编辑用户行为', 19, 0, 'User/editaction', 0, '', '', 0, 1),
(22, '保存用户行为', 19, 0, 'User/saveAction', 0, '"用户->用户行为"保存编辑和新增的用户行为', '', 0, 1),
(23, '变更行为状态', 19, 0, 'User/setStatus', 0, '"用户->用户行为"中的启用,禁用和删除权限', '', 0, 1),
(24, '禁用会员', 19, 0, 'User/changeStatus?method=forbidUser', 0, '"用户->用户信息"中的禁用', '', 0, 1),
(25, '启用会员', 19, 0, 'User/changeStatus?method=resumeUser', 0, '"用户->用户信息"中的启用', '', 0, 1),
(26, '删除会员', 19, 0, 'User/changeStatus?method=deleteUser', 0, '"用户->用户信息"中的删除', '', 0, 1),
(27, '权限管理', 16, 0, 'AuthManager/index', 0, '', '用户管理', 0, 1),
(28, '删除', 27, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除用户组', '', 0, 1),
(29, '禁用', 27, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用用户组', '', 0, 1),
(30, '恢复', 27, 0, 'AuthManager/changeStatus?method=resumeGroup', 0, '恢复已禁用的用户组', '', 0, 1),
(31, '新增', 27, 0, 'AuthManager/createGroup', 0, '创建新的用户组', '', 0, 1),
(32, '编辑', 27, 0, 'AuthManager/editGroup', 0, '编辑用户组名称和描述', '', 0, 1),
(33, '保存用户组', 27, 0, 'AuthManager/writeGroup', 0, '新增和编辑用户组的"保存"按钮', '', 0, 1),
(34, '授权', 27, 0, 'AuthManager/group', 0, '"后台 \\ 用户 \\ 用户信息"列表页的"授权"操作按钮,用于设置用户所属用户组', '', 0, 1),
(35, '访问授权', 27, 0, 'AuthManager/access', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"访问授权"操作按钮', '', 0, 1),
(36, '成员授权', 27, 0, 'AuthManager/user', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"成员授权"操作按钮', '', 0, 1),
(37, '解除授权', 27, 0, 'AuthManager/removeFromGroup', 0, '"成员授权"列表页内的解除授权操作按钮', '', 0, 1),
(38, '保存成员授权', 27, 0, 'AuthManager/addToGroup', 0, '"用户信息"列表页"授权"时的"保存"按钮和"成员授权"里右上角的"添加"按钮)', '', 0, 1),
(39, '分类授权', 27, 0, 'AuthManager/category', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"分类授权"操作按钮', '', 0, 1),
(40, '保存分类授权', 27, 0, 'AuthManager/addToCategory', 0, '"分类授权"页面的"保存"按钮', '', 0, 1),
(41, '模型授权', 27, 0, 'AuthManager/modelauth', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"模型授权"操作按钮', '', 0, 1),
(42, '保存模型授权', 27, 0, 'AuthManager/addToModel', 0, '"分类授权"页面的"保存"按钮', '', 0, 1),
(43, '扩展', 0, 7, 'Addons/index', 0, '', '', 0, 1),
(44, '插件管理', 43, 1, 'Addons/index', 0, '', '扩展', 0, 1),
(45, '创建', 44, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0, 1),
(46, '检测创建', 44, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0, 1),
(47, '预览', 44, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0, 1),
(48, '快速生成插件', 44, 0, 'Addons/build', 0, '开始生成插件结构', '', 0, 1),
(49, '设置', 44, 0, 'Addons/config', 0, '设置插件配置', '', 0, 1),
(50, '禁用', 44, 0, 'Addons/disable', 0, '禁用插件', '', 0, 1),
(51, '启用', 44, 0, 'Addons/enable', 0, '启用插件', '', 0, 1),
(52, '安装', 44, 0, 'Addons/install', 0, '安装插件', '', 0, 1),
(53, '卸载', 44, 0, 'Addons/uninstall', 0, '卸载插件', '', 0, 1),
(54, '更新配置', 44, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0, 1),
(55, '插件后台列表', 44, 0, 'Addons/adminList', 0, '', '', 0, 1),
(56, 'URL方式访问插件', 44, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0, 1),
(57, '钩子管理', 43, 2, 'Addons/hooks', 0, '', '扩展', 0, 1),
(58, '模型管理', 68, 3, 'Model/index', 0, '', '系统设置', 0, 1),
(59, '新增', 58, 0, 'model/add', 0, '', '', 0, 1),
(60, '编辑', 58, 0, 'model/edit', 0, '', '', 0, 1),
(61, '改变状态', 58, 0, 'model/setStatus', 0, '', '', 0, 1),
(62, '保存数据', 58, 0, 'model/update', 0, '', '', 0, 1),
(63, '属性管理', 68, 0, 'Attribute/index', 1, '网站属性配置。', '', 0, 1),
(64, '新增', 63, 0, 'Attribute/add', 0, '', '', 0, 1),
(65, '编辑', 63, 0, 'Attribute/edit', 0, '', '', 0, 1),
(66, '改变状态', 63, 0, 'Attribute/setStatus', 0, '', '', 0, 1),
(67, '保存数据', 63, 0, 'Attribute/update', 0, '', '', 0, 1),
(68, '系统', 0, 4, 'Config/group', 0, '', '', 0, 1),
(69, '网站设置', 68, 1, 'Config/group', 0, '', '系统设置', 0, 1),
(70, '配置管理', 68, 4, 'Config/index', 0, '', '系统设置', 0, 1),
(71, '编辑', 70, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0, 1),
(72, '删除', 70, 0, 'Config/del', 0, '删除配置', '', 0, 1),
(73, '新增', 70, 0, 'Config/add', 0, '新增配置', '', 0, 1),
(74, '保存', 70, 0, 'Config/save', 0, '保存配置', '', 0, 1),
(75, '菜单管理', 68, 5, 'Menu/index', 0, '', '系统设置', 0, 1),
(76, '导航管理', 68, 6, 'Channel/index', 0, '', '系统设置', 0, 1),
(77, '新增', 76, 0, 'Channel/add', 0, '', '', 0, 1),
(78, '编辑', 76, 0, 'Channel/edit', 0, '', '', 0, 1),
(79, '删除', 76, 0, 'Channel/del', 0, '', '', 0, 1),
(80, '分类管理', 68, 2, 'Category/index', 0, '', '系统设置', 0, 1),
(81, '编辑', 80, 0, 'Category/edit', 0, '编辑和保存栏目分类', '', 0, 1),
(82, '新增', 80, 0, 'Category/add', 0, '新增栏目分类', '', 0, 1),
(83, '删除', 80, 0, 'Category/remove', 0, '删除栏目分类', '', 0, 1),
(84, '移动', 80, 0, 'Category/operate/type/move', 0, '移动栏目分类', '', 0, 1),
(85, '合并', 80, 0, 'Category/operate/type/merge', 0, '合并栏目分类', '', 0, 1),
(86, '备份数据库', 68, 0, 'Database/index?type=export', 0, '', '数据备份', 0, 1),
(87, '备份', 86, 0, 'Database/export', 0, '备份数据库', '', 0, 1),
(88, '优化表', 86, 0, 'Database/optimize', 0, '优化数据表', '', 0, 1),
(89, '修复表', 86, 0, 'Database/repair', 0, '修复数据表', '', 0, 1),
(90, '还原数据库', 68, 0, 'Database/index?type=import', 0, '', '数据备份', 0, 1),
(91, '恢复', 90, 0, 'Database/import', 0, '数据库恢复', '', 0, 1),
(92, '删除', 90, 0, 'Database/del', 0, '删除备份文件', '', 0, 1),
(93, '其他', 0, 5, 'other', 1, '', '', 0, 1),
(96, '新增', 75, 0, 'Menu/add', 0, '', '系统设置', 0, 1),
(98, '编辑', 75, 0, 'Menu/edit', 0, '', '', 0, 1),
(106, '行为日志', 16, 0, 'Action/actionlog', 0, '', '行为管理', 0, 1),
(108, '修改密码', 16, 0, 'User/updatePassword', 1, '', '', 0, 1),
(109, '修改昵称', 16, 0, 'User/updateNickname', 1, '', '', 0, 1),
(110, '查看行为日志', 106, 0, 'action/edit', 1, '', '', 0, 1),
(112, '新增数据', 58, 0, 'think/add', 1, '', '', 0, 1),
(113, '编辑数据', 58, 0, 'think/edit', 1, '', '', 0, 1),
(114, '导入', 75, 0, 'Menu/import', 0, '', '', 0, 1),
(115, '生成', 58, 0, 'Model/generate', 0, '', '', 0, 1),
(116, '新增钩子', 57, 0, 'Addons/addHook', 0, '', '', 0, 1),
(117, '编辑钩子', 57, 0, 'Addons/edithook', 0, '', '', 0, 1),
(118, '文档排序', 3, 0, 'Article/sort', 1, '', '', 0, 1),
(119, '排序', 70, 0, 'Config/sort', 1, '', '', 0, 1),
(120, '排序', 75, 0, 'Menu/sort', 1, '', '', 0, 1),
(121, '排序', 76, 0, 'Channel/sort', 1, '', '', 0, 1),
(122, '数据列表', 58, 0, 'think/lists', 1, '', '', 0, 1),
(123, '审核列表', 3, 0, 'Article/examine', 1, '', '', 0, 1),
(124, '已安装插件菜单排序', 44, 0, 'Addons/sort', 1, '已安装插件菜单排序', '', 0, 1),
(125, '前台权限管理', 27, 0, 'AuthManager/accessUser', 0, '', '', 0, 0),
(126, '新增前台权限节点', 27, 0, 'AuthManager/addNode', 0, '', '', 0, 0);

DROP TABLE IF EXISTS `onethink_model`;
CREATE TABLE IF NOT EXISTS "onethink_model" (
  "id" int(10) unsigned NOT NULL COMMENT '模型ID',
  "name" char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  "title" char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  "extend" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  "relation" varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  "need_pk" tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  "field_sort" text COMMENT '表单字段排序',
  "field_group" varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  "attribute_list" text COMMENT '属性列表（表的字段）',
  "attribute_alias" varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  "template_list" varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  "template_add" varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  "template_edit" varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  "list_grid" text COMMENT '列表定义',
  "list_row" smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  "search_key" varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  "search_list" varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  "create_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  "update_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  "status" tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  "engine_type" varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎'
) AUTO_INCREMENT=9 ;

INSERT INTO `onethink_model` (`id`, `name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `attribute_alias`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`) VALUES
(1, 'document', '基础文档', 0, '', 1, '{"1":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 0, '', '', 1383891233, 1384507827, 1, 'MyISAM'),
(2, 'article', '文章', 1, '', 1, '{"1":["3","24","48","2","5"],"2":["9","13","19","10","12","16","17","26","20","14","11","25"]}', '1:基础,2:扩展', '', '', '', '', '', '', 0, '', '', 1383891243, 1444976420, 1, 'MyISAM'),
(3, 'download', '下载', 1, '', 1, '{"1":["3","28","30","32","2","5","31"],"2":["13","10","27","9","12","16","17","19","11","20","14","29"]}', '1:基础,2:扩展', '', '', '', '', '', '', 0, '', '', 1383891252, 1387260449, 1, 'MyISAM');

DROP TABLE IF EXISTS `onethink_module`;
CREATE TABLE IF NOT EXISTS "onethink_module" (
  "id" int(11) NOT NULL,
  "name" varchar(30) NOT NULL COMMENT '模块名',
  "alias" varchar(30) NOT NULL COMMENT '中文名',
  "version" varchar(20) NOT NULL COMMENT '版本号',
  "is_com" tinyint(4) NOT NULL COMMENT '是否商业版',
  "show_nav" tinyint(4) NOT NULL COMMENT '是否显示在导航栏中',
  "summary" varchar(200) NOT NULL COMMENT '简介',
  "developer" varchar(50) NOT NULL COMMENT '开发者',
  "website" varchar(200) NOT NULL COMMENT '网址',
  "entry" varchar(50) NOT NULL COMMENT '前台入口',
  "is_setup" tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否已安装',
  "sort" int(11) NOT NULL COMMENT '模块排序'
) AUTO_INCREMENT=30 ;

INSERT INTO `onethink_module` (`id`, `name`, `alias`, `version`, `is_com`, `show_nav`, `summary`, `developer`, `website`, `entry`, `is_setup`, `sort`) VALUES
(24, 'Group', '群组', '1.0.0', 0, 1, '群组模块，允许用户建立自己的圈子', '', '', 'Group/index/index', 1, 0),
(25, 'Home', '主页', '1.0.0', 0, 1, '首页模块，主要用于展示网站内容', '', '', 'Home/index/index', 1, 0);

DROP TABLE IF EXISTS `onethink_picture`;
CREATE TABLE IF NOT EXISTS "onethink_picture" (
  "id" int(10) unsigned NOT NULL COMMENT '主键id自增',
  "path" varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  "url" varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  "md5" char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  "sha1" char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  "status" tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  "create_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间'
) AUTO_INCREMENT=81 ;

DROP TABLE IF EXISTS `onethink_schedule`;
CREATE TABLE IF NOT EXISTS "onethink_schedule" (
  "id" int(11) NOT NULL,
  "title" varchar(50) NOT NULL COMMENT '计划任务名称',
  "task_to_run" varchar(255) NOT NULL COMMENT '计划任务执行方法',
  "task_type" varchar(255) NOT NULL COMMENT '执行周期:只执行一次,按分钟执行,按小时执行,按天执行,按周执行,按月执行',
  "modifier" varchar(255) DEFAULT NULL COMMENT '执行频率,类型为"按月执行"时必须；只执行一次时无效；其他时为可选，默认为1',
  "daylist" varchar(255) DEFAULT NULL COMMENT '指定周或月的一天或多天。只与WEEKLY和MONTHLY共同使用时有效，其他时忽略。',
  "month" varchar(255) DEFAULT NULL COMMENT '指定一年中的一个月或多个月.只在task_type=MONTHLY时有效，其他时忽略。当modifier=LASTDAY时必须，其他时可选。有效值：Jan - Dec，默认为*(每个月)',
  "start_datetime" datetime NOT NULL COMMENT '开始时间',
  "end_datetime" datetime DEFAULT NULL COMMENT '结束时间',
  "last_run_time" datetime DEFAULT NULL COMMENT '最近执行时间',
  "memo" varchar(255) DEFAULT NULL COMMENT '对计划任务的简要描述',
  "status" tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）'
) AUTO_INCREMENT=2 ;

INSERT INTO `onethink_schedule` (`id`, `title`, `task_to_run`, `task_type`, `modifier`, `daylist`, `month`, `start_datetime`, `end_datetime`, `last_run_time`, `memo`, `status`) VALUES
(1, '01', 'Function::send_mail::', 'ONCE', '', '', '', '2015-11-09 13:02:00', '2015-11-09 13:02:34', '2015-11-09 13:02:34', '999', 1);

DROP TABLE IF EXISTS `onethink_sensitive`;
CREATE TABLE IF NOT EXISTS "onethink_sensitive" (
  "id" int(11) NOT NULL,
  "title" varchar(50) NOT NULL,
  "status" tinyint(4) NOT NULL,
  "create_time" int(11) NOT NULL
) AUTO_INCREMENT=2 ;

INSERT INTO `onethink_sensitive` (`id`, `title`, `status`, `create_time`) VALUES
(1, '草', 1, 1446778754);

DROP TABLE IF EXISTS `onethink_sync_login`;
CREATE TABLE IF NOT EXISTS "onethink_sync_login" (
  "uid" int(11) NOT NULL,
  "openid" varchar(255) NOT NULL,
  "type" varchar(255) NOT NULL,
  "access_token" varchar(255) NOT NULL,
  "refresh_token" varchar(255) NOT NULL,
  "status" tinyint(4) NOT NULL
);

DROP TABLE IF EXISTS `onethink_ucenter_admin`;
CREATE TABLE IF NOT EXISTS "onethink_ucenter_admin" (
  "id" int(10) unsigned NOT NULL COMMENT '管理员ID',
  "member_id" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  "status" tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态'
) AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `onethink_ucenter_app`;
CREATE TABLE IF NOT EXISTS "onethink_ucenter_app" (
  "id" int(10) unsigned NOT NULL COMMENT '应用ID',
  "title" varchar(30) NOT NULL COMMENT '应用名称',
  "url" varchar(100) NOT NULL COMMENT '应用URL',
  "ip" char(15) NOT NULL DEFAULT '' COMMENT '应用IP',
  "auth_key" varchar(100) NOT NULL DEFAULT '' COMMENT '加密KEY',
  "sys_login" tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  "allow_ip" varchar(255) NOT NULL DEFAULT '' COMMENT '允许访问的IP',
  "create_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  "update_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  "status" tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态'
) AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `onethink_ucenter_member`;
CREATE TABLE IF NOT EXISTS "onethink_ucenter_member" (
  "id" int(10) unsigned NOT NULL COMMENT '用户ID',
  "username" char(16) NOT NULL COMMENT '用户名',
  "password" char(32) NOT NULL COMMENT '密码',
  "email" char(32) NOT NULL COMMENT '用户邮箱',
  "mobile" char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  "reg_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  "reg_ip" bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  "last_login_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  "last_login_ip" bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  "update_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  "status" tinyint(4) DEFAULT '0' COMMENT '用户状态'
) AUTO_INCREMENT=6 ;

INSERT INTO `onethink_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'admin', 'bbe81237a2de1471f322ae25b0132dfc', '836692464@qq.com', '', 1444795583, 2130706433, 1470025114, 2130706433, 1444795583, 1),
(2, 'xjq', 'bbe81237a2de1471f322ae25b0132dfc', 'app880@foxmail.com', '', 1422698522, 2130706433, 1424148677, 2130706433, 1422698522, 1),
(3, 'geniusxjq', 'bbe81237a2de1471f322ae25b0132dfc', 'geniusxjq@126.com', '', 1445948878, 2130706433, 1446740517, 2130706433, 1445948878, 1),
(4, 'xjq123', 'bbe81237a2de1471f322ae25b0132dfc', 'fafasfasdfsdf@126.com', '', 1424398787, 2130706433, 1424398807, 2130706433, 1424398787, 1),
(5, '###', 'bbe81237a2de1471f322ae25b0132dfc', '777777@qq.com', '', 1444299602, 2130706433, 0, 0, 1444299602, 1);

DROP TABLE IF EXISTS `onethink_ucenter_setting`;
CREATE TABLE IF NOT EXISTS "onethink_ucenter_setting" (
  "id" int(10) unsigned NOT NULL COMMENT '设置ID',
  "type" tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  "value" text NOT NULL COMMENT '配置数据'
) AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `onethink_url`;
CREATE TABLE IF NOT EXISTS "onethink_url" (
  "id" int(11) unsigned NOT NULL COMMENT '链接唯一标识',
  "url" char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  "short" char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  "status" tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  "create_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间'
) AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `onethink_userdata`;
CREATE TABLE IF NOT EXISTS "onethink_userdata" (
  "uid" int(10) unsigned NOT NULL COMMENT '用户id',
  "type" tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  "target_id" int(10) unsigned NOT NULL COMMENT '目标id'
);

DROP TABLE IF EXISTS `onethink_vote`;
CREATE TABLE IF NOT EXISTS "onethink_vote" (
  "id" int(10) unsigned NOT NULL COMMENT 'ID',
  "title" char(80) NOT NULL COMMENT '标题',
  "description" text COMMENT '描述',
  "options" text NOT NULL COMMENT '添加各种投票选项',
  "explanation" varchar(256) DEFAULT NULL COMMENT '备注',
  "update_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  "create_time" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  "voteconfig" char(1) NOT NULL DEFAULT '1'
) AUTO_INCREMENT=14 ;

INSERT INTO `onethink_vote` (`id`, `title`, `description`, `options`, `explanation`, `update_time`, `create_time`, `voteconfig`) VALUES
(13, '01', '01', '[{"id":"0","value":"01","num":"0","percent":"0"},{"id":"1","value":"1","num":"0","percent":"0"},{"id":"2","value":"1","num":"0","percent":"0"}]', '', 0, 1447046685, '1');

DROP TABLE IF EXISTS `onethink_wechat_message`;
CREATE TABLE IF NOT EXISTS "onethink_wechat_message" (
  "id" int(10) unsigned NOT NULL COMMENT '编号',
  "msgid" int(64) unsigned NOT NULL COMMENT '信息ID',
  "type" varchar(100) NOT NULL COMMENT '信息类型',
  "content" text NOT NULL COMMENT '信息内容',
  "user" varchar(250) NOT NULL COMMENT '用户名&标识',
  "time" int(10) unsigned NOT NULL COMMENT '接收时间',
  "is_reply" tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否回复'
) AUTO_INCREMENT=1 ;


ALTER TABLE `onethink_action`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_action_log`
 ADD PRIMARY KEY ("id"), ADD KEY "action_ip_ix" ("action_ip"), ADD KEY "action_id_ix" ("action_id"), ADD KEY "user_id_ix" ("user_id");

ALTER TABLE `onethink_addons`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_advertisement`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_advertising`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_attachment`
 ADD PRIMARY KEY ("id"), ADD KEY "idx_record_status" ("record_id","status");

ALTER TABLE `onethink_attribute`
 ADD PRIMARY KEY ("id"), ADD KEY "model_id" ("model_id");

ALTER TABLE `onethink_auth_extend`
 ADD UNIQUE KEY "group_extend_type" ("group_id","extend_id","type"), ADD KEY "uid" ("group_id"), ADD KEY "group_id" ("extend_id");

ALTER TABLE `onethink_auth_group`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_auth_group_access`
 ADD UNIQUE KEY "uid_group_id" ("uid","group_id"), ADD KEY "uid" ("uid"), ADD KEY "group_id" ("group_id");

ALTER TABLE `onethink_auth_rule`
 ADD PRIMARY KEY ("id"), ADD KEY "module" ("module","status","type");

ALTER TABLE `onethink_avatar`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_category`
 ADD PRIMARY KEY ("id"), ADD UNIQUE KEY "uk_name" ("name"), ADD KEY "pid" ("pid");

ALTER TABLE `onethink_channel`
 ADD PRIMARY KEY ("id"), ADD KEY "pid" ("pid");

ALTER TABLE `onethink_comment`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_config`
 ADD PRIMARY KEY ("id"), ADD UNIQUE KEY "uk_name" ("name"), ADD KEY "type" ("type"), ADD KEY "group" ("group");

ALTER TABLE `onethink_document`
 ADD PRIMARY KEY ("id"), ADD KEY "idx_category_status" ("category_id","status"), ADD KEY "idx_status_type_pid" ("status","uid","pid");

ALTER TABLE `onethink_document_article`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_document_download`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_file`
 ADD PRIMARY KEY ("id"), ADD UNIQUE KEY "uk_md5" ("md5");

ALTER TABLE `onethink_friendlinks`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_guestbook`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_hooks`
 ADD PRIMARY KEY ("id"), ADD UNIQUE KEY "name" ("name");

ALTER TABLE `onethink_mail_history`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_mail_history_link`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_mail_list`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_mail_token`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_member`
 ADD PRIMARY KEY ("uid"), ADD KEY "status" ("status");

ALTER TABLE `onethink_menu`
 ADD PRIMARY KEY ("id"), ADD KEY "pid" ("pid"), ADD KEY "status" ("status");

ALTER TABLE `onethink_model`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_module`
 ADD PRIMARY KEY ("id"), ADD UNIQUE KEY "name" ("name"), ADD KEY "name_2" ("name");

ALTER TABLE `onethink_picture`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_schedule`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_sensitive`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_ucenter_admin`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_ucenter_app`
 ADD PRIMARY KEY ("id"), ADD KEY "status" ("status");

ALTER TABLE `onethink_ucenter_member`
 ADD PRIMARY KEY ("id"), ADD UNIQUE KEY "username" ("username"), ADD UNIQUE KEY "email" ("email"), ADD KEY "status" ("status");

ALTER TABLE `onethink_ucenter_setting`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_url`
 ADD PRIMARY KEY ("id"), ADD UNIQUE KEY "idx_url" ("url");

ALTER TABLE `onethink_userdata`
 ADD UNIQUE KEY "uid" ("uid","type","target_id");

ALTER TABLE `onethink_vote`
 ADD PRIMARY KEY ("id");

ALTER TABLE `onethink_wechat_message`
 ADD PRIMARY KEY ("id");
