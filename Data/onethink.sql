# SQL-Front 5.1  (Build 4.16)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;


# Host: localhost    Database: onethink
# ------------------------------------------------------
# Server version 5.5.27

#
# Source for table onethink_action
#

DROP TABLE IF EXISTS `onethink_action`;
CREATE TABLE `onethink_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '����',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '��ΪΨһ��ʶ',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '��Ϊ˵��',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '��Ϊ����',
  `rule` text COMMENT '��Ϊ����',
  `log` text COMMENT '��־����',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '����',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '״̬',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '�޸�ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='ϵͳ��Ϊ��';

#
# Dumping data for table onethink_action
#

INSERT INTO `onethink_action` VALUES (1,'user_login','�û���¼','����+10��ÿ��һ��','table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;','[user|get_nickname]��[time|time_format]��¼�˺�̨',1,1,1387181220);
INSERT INTO `onethink_action` VALUES (2,'add_article','��������','����+5��ÿ������5��','table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5','',2,0,1380173180);
INSERT INTO `onethink_action` VALUES (3,'review','����','���ۻ���+1��������','table:member|field:score|condition:uid={$self}|rule:score+1','',2,1,1383285646);
INSERT INTO `onethink_action` VALUES (4,'add_document','�����ĵ�','����+10��ÿ������5��','table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5','[user|get_nickname]��[time|time_format]������һƪ���¡�\r\n��[model]����¼���[record]��',2,0,1386139726);
INSERT INTO `onethink_action` VALUES (5,'add_document_topic','��������','����+5��ÿ������10��','table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10','',2,0,1383285551);
INSERT INTO `onethink_action` VALUES (6,'update_config','��������','�������޸Ļ�ɾ������','','',1,1,1383294988);
INSERT INTO `onethink_action` VALUES (7,'update_model','����ģ��','�������޸�ģ��','','',1,1,1383295057);
INSERT INTO `onethink_action` VALUES (8,'update_attribute','��������','��������»�ɾ������','','',1,1,1383295963);
INSERT INTO `onethink_action` VALUES (9,'update_channel','���µ���','�������޸Ļ�ɾ������','','',1,1,1383296301);
INSERT INTO `onethink_action` VALUES (10,'update_menu','���²˵�','�������޸Ļ�ɾ���˵�','','',1,1,1383296392);
INSERT INTO `onethink_action` VALUES (11,'update_category','���·���','�������޸Ļ�ɾ������','','',1,1,1383296765);

#
# Source for table onethink_action_log
#

DROP TABLE IF EXISTS `onethink_action_log`;
CREATE TABLE `onethink_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '����',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '��Ϊid',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ִ���û�id',
  `action_ip` bigint(20) NOT NULL COMMENT 'ִ����Ϊ��ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '������Ϊ�ı�',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '������Ϊ������id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '��־��ע',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '״̬',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ִ����Ϊ��ʱ��',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='��Ϊ��־��';

#
# Dumping data for table onethink_action_log
#

INSERT INTO `onethink_action_log` VALUES (68,1,1,2130706433,'member',1,'admin��2015-02-10 23:32��¼�˺�̨',1,1423582323);
INSERT INTO `onethink_action_log` VALUES (69,1,1,2130706433,'member',1,'admin��2015-02-11 12:48��¼�˺�̨',1,1423630084);
INSERT INTO `onethink_action_log` VALUES (70,1,1,2130706433,'member',1,'admin��2015-02-11 16:33��¼�˺�̨',1,1423643598);
INSERT INTO `onethink_action_log` VALUES (71,1,1,2130706433,'member',1,'admin��2015-02-11 18:19��¼�˺�̨',1,1423649949);
INSERT INTO `onethink_action_log` VALUES (72,1,1,2130706433,'member',1,'admin��2015-02-11 21:34��¼�˺�̨',1,1423661674);
INSERT INTO `onethink_action_log` VALUES (73,1,1,2130706433,'member',1,'admin��2015-02-12 12:54��¼�˺�̨',1,1423716844);
INSERT INTO `onethink_action_log` VALUES (74,6,1,2130706433,'config',38,'����url��/admin.php?s=/Config/edit.html',1,1423721695);
INSERT INTO `onethink_action_log` VALUES (75,6,1,2130706433,'config',38,'����url��/admin.php?s=/Config/edit.html',1,1423723280);
INSERT INTO `onethink_action_log` VALUES (76,6,1,2130706433,'config',38,'����url��/admin.php?s=/Config/edit.html',1,1423723294);
INSERT INTO `onethink_action_log` VALUES (77,6,1,2130706433,'config',38,'����url��/admin.php?s=/Config/edit.html',1,1423723355);
INSERT INTO `onethink_action_log` VALUES (78,1,1,2130706433,'member',1,'admin��2015-02-12 18:18��¼�˺�̨',1,1423736300);
INSERT INTO `onethink_action_log` VALUES (79,1,1,2130706433,'member',1,'admin��2015-02-13 00:35��¼�˺�̨',1,1423758903);
INSERT INTO `onethink_action_log` VALUES (80,1,3,2130706433,'member',3,'geniusxjq��2015-02-13 01:17��¼�˺�̨',1,1423761472);
INSERT INTO `onethink_action_log` VALUES (81,1,1,2130706433,'member',1,'admin��2015-02-13 15:53��¼�˺�̨',1,1423813986);
INSERT INTO `onethink_action_log` VALUES (82,1,1,2130706433,'member',1,'admin��2015-02-13 18:43��¼�˺�̨',1,1423824189);
INSERT INTO `onethink_action_log` VALUES (83,1,1,2130706433,'member',1,'admin��2015-02-14 13:29��¼�˺�̨',1,1423891748);

#
# Source for table onethink_addons
#

DROP TABLE IF EXISTS `onethink_addons`;
CREATE TABLE `onethink_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '����',
  `name` varchar(40) NOT NULL COMMENT '��������ʶ',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '������',
  `description` text COMMENT '�������',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '״̬',
  `config` text COMMENT '����',
  `author` varchar(40) DEFAULT '' COMMENT '����',
  `url` varchar(255) DEFAULT '' COMMENT '���������ҳ����',
  `version` varchar(20) DEFAULT '' COMMENT '�汾��',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '��װʱ��',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '�Ƿ��к�̨�б�',
  `is_locked` tinyint(1) DEFAULT '0' COMMENT '����Ƿ��ѱ�����',
  `sort` int(10) DEFAULT '0' COMMENT '�Ѱ�װ����˵�����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COMMENT='�����';

#
# Dumping data for table onethink_addons
#

INSERT INTO `onethink_addons` VALUES (2,'SiteStat','վ��ͳ����Ϣ','ͳ��վ��Ļ�����Ϣ',1,'{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}','thinkphp','','0.1',1379512015,0,1,0);
INSERT INTO `onethink_addons` VALUES (3,'DevTeam','�����Ŷ���Ϣ','�����Ŷӳ�Ա��Ϣ',1,'{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}','thinkphp','','0.1',1379512022,0,1,0);
INSERT INTO `onethink_addons` VALUES (4,'SystemInfo','ϵͳ������Ϣ','������ʾһЩ����������Ϣ',1,'{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}','thinkphp','','0.1',1379512036,0,1,0);
INSERT INTO `onethink_addons` VALUES (5,'Editor','ǰ̨�༭��','������ǿ��վ���ı����������ʾ',1,'{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}','thinkphp','','0.1',1379830910,0,1,0);
INSERT INTO `onethink_addons` VALUES (6,'Attachment','����','�����ĵ�ģ���ϴ�����',1,'null','thinkphp','','0.1',1379842319,1,1,9);
INSERT INTO `onethink_addons` VALUES (9,'SocialComment','ͨ���罻������','�����˸����罻�����۲�������ɼ��ɵ�ϵͳ�С�',0,'{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}','thinkphp','','0.1',1380273962,0,1,0);
INSERT INTO `onethink_addons` VALUES (15,'EditorForAdmin','��̨�༭��','������ǿ��վ���ı����������ʾ',1,'{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}','thinkphp','','0.1',1383126253,0,1,0);
INSERT INTO `onethink_addons` VALUES (108,'Water','ͼƬˮӡ','����Ϊ�ϴ���ͼƬ���ˮӡ',1,'{\"switch\":\"1\",\"water\":\"\",\"position\":\"9\"}','xjw129xjt','','0.1',1423563901,0,1,0);
INSERT INTO `onethink_addons` VALUES (114,'Sensitive','���д�','���дʹ��˲��',1,'{\"is_open\":\"1\"}','geniusxjq(app880.com)','http://app880.com','0.1',1423640787,1,1,4);
INSERT INTO `onethink_addons` VALUES (118,'Mail','�ʼ�����','�ʼ����Ĳ��',1,'null','geniusxjq(app880.com)','http://app880.com','0.1',1423650031,1,1,8);
INSERT INTO `onethink_addons` VALUES (123,'Schedule','�ƻ�����','ִ�мƻ�������',1,'{\"random\":\"1\"}','geniusxjq(app880.com)','http://app880.com','0.1',1423675029,1,1,7);
INSERT INTO `onethink_addons` VALUES (135,'Friendlinks','��������','��������',1,'{\"random\":\"1\"}','geniusxjq(app880.com)','http://app880.com','0.1',1423825560,1,0,2);
INSERT INTO `onethink_addons` VALUES (136,'Advs','������','�����',1,'null','onep2p','','0.1',1423825694,1,0,5);
INSERT INTO `onethink_addons` VALUES (137,'Advertising','���λ��','���λ���',1,'null','onep2p','','0.1',1423825700,1,0,6);
INSERT INTO `onethink_addons` VALUES (140,'SyncLogin','�������˺�ͬ����½','�������˺�ͬ����½',1,'{\"type\":null,\"meta\":\"\",\"QqKEY\":\"\",\"QqSecret\":\"\",\"SinaKEY\":\"\",\"SinaSecret\":\"\"}','yidian','','0.1',1423825967,0,0,0);
INSERT INTO `onethink_addons` VALUES (143,'ReturnTop','���ض���','�ص����������������ָ����ʾ��100����ʽ��ÿ��һ�ֻ������춼������ʽ',1,'{\"random\":\"0\",\"current\":\"1\"}','thinkphp','','0.1',1423826511,0,0,0);
INSERT INTO `onethink_addons` VALUES (147,'BaiduShare','�ٶȷ���','�û�����վ���ݷ�����������վ����������վ���û����ר�еķ������ӣ��ӵ�������վ������ữ������',1,'{\"openbutton\":\"0\",\"buttonlist\":[\"mshare\",\"qzone\",\"tsina\",\"renren\",\"tqq\",\"tieba\"],\"button_size\":\"1\",\"openimg\":\"0\",\"imglist\":[\"mshare\",\"qzone\",\"tsina\",\"renren\",\"tqq\",\"tieba\"],\"img_size\":\"1\",\"openselect\":\"0\",\"selectlist\":[\"mshare\",\"qzone\",\"tsina\",\"renren\",\"tqq\",\"tieba\"]}','jesuspan','','0.1',1423837279,0,0,0);
INSERT INTO `onethink_addons` VALUES (148,'Unslider','����ͼ','����ͼ',1,'{\"title\":\"Uslider\",\"display\":\"1\"}','cepljxiongjun','','0.1',1423837388,0,0,0);
INSERT INTO `onethink_addons` VALUES (151,'Wechat','΢��','΢�Ų��',1,'{\"url\":\"http:\\/\\/localhost\\/admin.php?s=\\/Home\\/Addons\\/execute\\/_addons\\/Wechat\\/_controller\\/Wechat\\/_action\\/index\\/ukey\\/VNSrn2MJcatu9vs.html\",\"ukey\":\"VNSrn2MJcatu9vs\",\"token\":\"4fkgsny7jYp06d5G9cbahoIltFJOVA\",\"appid\":\"\",\"appsecret\":\"\",\"codelogin\":\"0\",\"codeloginlocation\":null,\"default\":null,\"subscribe\":null,\"button\":null}','huay1','','1.0',1423925643,1,0,1);
INSERT INTO `onethink_addons` VALUES (153,'Guestbook','���԰�','����һ���򵥵����԰�',1,'{\"display\":\"1\",\"messages_check\":\"1\"}','geniusxjq(app880.com)','http://app880.com','0.2',1423925886,1,0,3);

#
# Source for table onethink_advertising
#

DROP TABLE IF EXISTS `onethink_advertising`;
CREATE TABLE `onethink_advertising` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '����',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '���λ������',
  `type` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '���λ��չʾ��ʽ  0ΪĬ��չʾһ��',
  `width` char(20) NOT NULL DEFAULT '' COMMENT '���λ�ÿ��',
  `height` char(20) NOT NULL DEFAULT '' COMMENT '���λ�ø߶�',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '״̬��0�����ã�1��������',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_advertising
#


#
# Source for table onethink_advs
#

DROP TABLE IF EXISTS `onethink_advs`;
CREATE TABLE `onethink_advs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '����',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '�������',
  `position` int(11) NOT NULL COMMENT '���λ��',
  `advspic` int(11) NOT NULL COMMENT 'ͼƬ��ַ',
  `advstext` text NOT NULL COMMENT '���ֹ������',
  `advshtml` text NOT NULL COMMENT '����������',
  `link` char(140) NOT NULL DEFAULT '' COMMENT '���ӵ�ַ',
  `level` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '���ȼ�',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '״̬��0�����ã�1��������',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '��ʼʱ��',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_advs
#


#
# Source for table onethink_attachment
#

DROP TABLE IF EXISTS `onethink_attachment`;
CREATE TABLE `onethink_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '������ʾ��',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '��������',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '��ԴID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '������¼ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '���ش���',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '������С',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '�ϼ�Ŀ¼ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '����',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '״̬',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='������';

#
# Dumping data for table onethink_attachment
#


#
# Source for table onethink_attribute
#

DROP TABLE IF EXISTS `onethink_attribute`;
CREATE TABLE `onethink_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '�ֶ���',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '�ֶ�ע��',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '�ֶζ���',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '��������',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '�ֶ�Ĭ��ֵ',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '��ע',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '�Ƿ���ʾ',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '����',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ģ��id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '�Ƿ����',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '״̬',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='ģ�����Ա�';

#
# Dumping data for table onethink_attribute
#

INSERT INTO `onethink_attribute` VALUES (1,'uid','�û�ID','int(10) unsigned NOT NULL ','num','0','',0,'',1,0,1,1384508362,1383891233,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (2,'name','��ʶ','char(40) NOT NULL ','string','','ͬһ���ڵ��±�ʶ���ظ�',1,'',1,0,1,1383894743,1383891233,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (3,'title','����','char(80) NOT NULL ','string','','�ĵ�����',1,'',1,0,1,1383894778,1383891233,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (4,'category_id','��������','int(10) unsigned NOT NULL ','string','','',0,'',1,0,1,1384508336,1383891233,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (5,'description','����','char(140) NOT NULL ','textarea','','',1,'',1,0,1,1383894927,1383891233,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (6,'root','���ڵ�','int(10) unsigned NOT NULL ','num','0','���ĵ��Ķ����ĵ����',0,'',1,0,1,1384508323,1383891233,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (7,'pid','����ID','int(10) unsigned NOT NULL ','num','0','���ĵ����',0,'',1,0,1,1384508543,1383891233,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (8,'model_id','����ģ��ID','tinyint(3) unsigned NOT NULL ','num','0','���ĵ�����Ӧ��ģ��',0,'',1,0,1,1384508350,1383891233,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (9,'type','��������','tinyint(3) unsigned NOT NULL ','select','2','',1,'1:Ŀ¼\r\n2:����\r\n3:����',1,0,1,1384511157,1383891233,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (10,'position','�Ƽ�λ','smallint(5) unsigned NOT NULL ','checkbox','0','����Ƽ������Ƽ�ֵ���',1,'[DOCUMENT_POSITION]',1,0,1,1383895640,1383891233,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (11,'link_id','����','int(10) unsigned NOT NULL ','num','0','0-������������0-����ID,��Ҫ���������������ŵ�ת��',1,'',1,0,1,1383895757,1383891233,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (12,'cover_id','����','int(10) unsigned NOT NULL ','picture','0','0-�޷��棬����0-����ͼƬID����Ҫ��������',1,'',1,0,1,1384147827,1383891233,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (13,'display','�ɼ���','tinyint(3) unsigned NOT NULL ','radio','1','',1,'0:���ɼ�\r\n1:�����˿ɼ�',1,0,1,1386662271,1383891233,'',0,'','regex','',0,'function');
INSERT INTO `onethink_attribute` VALUES (14,'deadline','����ʱ��','int(10) unsigned NOT NULL ','datetime','0','0-������Ч',1,'',1,0,1,1387163248,1383891233,'',0,'','regex','',0,'function');
INSERT INTO `onethink_attribute` VALUES (15,'attach','��������','tinyint(3) unsigned NOT NULL ','num','0','',0,'',1,0,1,1387260355,1383891233,'',0,'','regex','',0,'function');
INSERT INTO `onethink_attribute` VALUES (16,'view','�����','int(10) unsigned NOT NULL ','num','0','',1,'',1,0,1,1383895835,1383891233,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (17,'comment','������','int(10) unsigned NOT NULL ','num','0','',1,'',1,0,1,1383895846,1383891233,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (18,'extend','��չͳ���ֶ�','int(10) unsigned NOT NULL ','num','0','������������ʹ��',0,'',1,0,1,1384508264,1383891233,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (19,'level','���ȼ�','int(10) unsigned NOT NULL ','num','0','Խ������Խ��ǰ',1,'',1,0,1,1383895894,1383891233,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (20,'create_time','����ʱ��','int(10) unsigned NOT NULL ','datetime','0','',1,'',1,0,1,1383895903,1383891233,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (21,'update_time','����ʱ��','int(10) unsigned NOT NULL ','datetime','0','',0,'',1,0,1,1384508277,1383891233,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (22,'status','����״̬','tinyint(4) NOT NULL ','radio','0','',0,'-1:ɾ��\r\n0:����\r\n1:����\r\n2:�����\r\n3:�ݸ�',1,0,1,1384508496,1383891233,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (23,'parse','���ݽ�������','tinyint(3) unsigned NOT NULL ','select','0','',0,'0:html\r\n1:ubb\r\n2:markdown',2,0,1,1384511049,1383891243,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (24,'content','��������','text NOT NULL ','editor','','',1,'',2,0,1,1383896225,1383891243,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (25,'template','����ҳ��ʾģ��','varchar(100) NOT NULL ','string','','����display���������Ķ���',1,'',2,0,1,1383896190,1383891243,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (26,'bookmark','�ղ���','int(10) unsigned NOT NULL ','num','0','',1,'',2,0,1,1383896103,1383891243,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (27,'parse','���ݽ�������','tinyint(3) unsigned NOT NULL ','select','0','',0,'0:html\r\n1:ubb\r\n2:markdown',3,0,1,1387260461,1383891252,'',0,'','regex','',0,'function');
INSERT INTO `onethink_attribute` VALUES (28,'content','������ϸ����','text NOT NULL ','editor','','',1,'',3,0,1,1383896438,1383891252,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (29,'template','����ҳ��ʾģ��','varchar(100) NOT NULL ','string','','',1,'',3,0,1,1383896429,1383891252,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (30,'file_id','�ļ�ID','int(10) unsigned NOT NULL ','file','0','��Ҫ��������',1,'',3,0,1,1383896415,1383891252,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (31,'download','���ش���','int(10) unsigned NOT NULL ','num','0','',1,'',3,0,1,1383896380,1383891252,'',0,'','','',0,'');
INSERT INTO `onethink_attribute` VALUES (32,'size','�ļ���С','bigint(20) unsigned NOT NULL ','num','0','��λbit',1,'',3,0,1,1383896371,1383891252,'',0,'','','',0,'');

#
# Source for table onethink_auth_extend
#

DROP TABLE IF EXISTS `onethink_auth_extend`;
CREATE TABLE `onethink_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '�û�id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '��չ�������ݵ�id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '��չ���ͱ�ʶ 1:��Ŀ����Ȩ��;2:ģ��Ȩ��',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='�û��������Ķ�Ӧ��ϵ��';

#
# Dumping data for table onethink_auth_extend
#

INSERT INTO `onethink_auth_extend` VALUES (1,1,1);
INSERT INTO `onethink_auth_extend` VALUES (1,1,2);
INSERT INTO `onethink_auth_extend` VALUES (1,2,1);
INSERT INTO `onethink_auth_extend` VALUES (1,2,2);
INSERT INTO `onethink_auth_extend` VALUES (1,3,1);
INSERT INTO `onethink_auth_extend` VALUES (1,3,2);
INSERT INTO `onethink_auth_extend` VALUES (1,4,1);
INSERT INTO `onethink_auth_extend` VALUES (1,37,1);

#
# Source for table onethink_auth_group
#

DROP TABLE IF EXISTS `onethink_auth_group`;
CREATE TABLE `onethink_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '�û���id,��������',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '�û�������ģ��',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '������',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '�û�����������',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '������Ϣ',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '�û���״̬��Ϊ1������Ϊ0����,-1Ϊɾ��',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '�û���ӵ�еĹ���id��������� , ����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_auth_group
#

INSERT INTO `onethink_auth_group` VALUES (1,'admin',1,'Ĭ���û���','',1,'1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106');
INSERT INTO `onethink_auth_group` VALUES (2,'admin',1,'�����û�','�����û�',1,'1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

#
# Source for table onethink_auth_group_access
#

DROP TABLE IF EXISTS `onethink_auth_group_access`;
CREATE TABLE `onethink_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '�û�id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '�û���id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_auth_group_access
#

INSERT INTO `onethink_auth_group_access` VALUES (3,2);

#
# Source for table onethink_auth_rule
#

DROP TABLE IF EXISTS `onethink_auth_rule`;
CREATE TABLE `onethink_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '����id,��������',
  `module` varchar(20) NOT NULL COMMENT '��������module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-���˵�',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '����ΨһӢ�ı�ʶ',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '������������',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '�Ƿ���Ч(0:��Ч,1:��Ч)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '���򸽼�����',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=219 DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_auth_rule
#

INSERT INTO `onethink_auth_rule` VALUES (1,'admin',2,'Admin/Index/index','��ҳ',1,'');
INSERT INTO `onethink_auth_rule` VALUES (2,'admin',2,'Admin/Article/index','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (3,'admin',2,'Admin/User/index','�û�',1,'');
INSERT INTO `onethink_auth_rule` VALUES (4,'admin',2,'Admin/Addons/index','��չ',1,'');
INSERT INTO `onethink_auth_rule` VALUES (5,'admin',2,'Admin/Config/group','ϵͳ',1,'');
INSERT INTO `onethink_auth_rule` VALUES (7,'admin',1,'Admin/article/add','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (8,'admin',1,'Admin/article/edit','�༭',1,'');
INSERT INTO `onethink_auth_rule` VALUES (9,'admin',1,'Admin/article/setStatus','�ı�״̬',1,'');
INSERT INTO `onethink_auth_rule` VALUES (10,'admin',1,'Admin/article/update','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (11,'admin',1,'Admin/article/autoSave','����ݸ�',1,'');
INSERT INTO `onethink_auth_rule` VALUES (12,'admin',1,'Admin/article/move','�ƶ�',1,'');
INSERT INTO `onethink_auth_rule` VALUES (13,'admin',1,'Admin/article/copy','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (14,'admin',1,'Admin/article/paste','ճ��',1,'');
INSERT INTO `onethink_auth_rule` VALUES (15,'admin',1,'Admin/article/permit','��ԭ',1,'');
INSERT INTO `onethink_auth_rule` VALUES (16,'admin',1,'Admin/article/clear','���',1,'');
INSERT INTO `onethink_auth_rule` VALUES (17,'admin',1,'Admin/Article/examine','����б�',1,'');
INSERT INTO `onethink_auth_rule` VALUES (18,'admin',1,'Admin/article/recycle','����վ',1,'');
INSERT INTO `onethink_auth_rule` VALUES (19,'admin',1,'Admin/User/addaction','�����û���Ϊ',1,'');
INSERT INTO `onethink_auth_rule` VALUES (20,'admin',1,'Admin/User/editaction','�༭�û���Ϊ',1,'');
INSERT INTO `onethink_auth_rule` VALUES (21,'admin',1,'Admin/User/saveAction','�����û���Ϊ',1,'');
INSERT INTO `onethink_auth_rule` VALUES (22,'admin',1,'Admin/User/setStatus','�����Ϊ״̬',1,'');
INSERT INTO `onethink_auth_rule` VALUES (23,'admin',1,'Admin/User/changeStatus?method=forbidUser','���û�Ա',1,'');
INSERT INTO `onethink_auth_rule` VALUES (24,'admin',1,'Admin/User/changeStatus?method=resumeUser','���û�Ա',1,'');
INSERT INTO `onethink_auth_rule` VALUES (25,'admin',1,'Admin/User/changeStatus?method=deleteUser','ɾ����Ա',1,'');
INSERT INTO `onethink_auth_rule` VALUES (26,'admin',1,'Admin/User/index','�û���Ϣ',1,'');
INSERT INTO `onethink_auth_rule` VALUES (27,'admin',1,'Admin/User/action','�û���Ϊ',1,'');
INSERT INTO `onethink_auth_rule` VALUES (28,'admin',1,'Admin/AuthManager/changeStatus?method=deleteGroup','ɾ��',1,'');
INSERT INTO `onethink_auth_rule` VALUES (29,'admin',1,'Admin/AuthManager/changeStatus?method=forbidGroup','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (30,'admin',1,'Admin/AuthManager/changeStatus?method=resumeGroup','�ָ�',1,'');
INSERT INTO `onethink_auth_rule` VALUES (31,'admin',1,'Admin/AuthManager/createGroup','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (32,'admin',1,'Admin/AuthManager/editGroup','�༭',1,'');
INSERT INTO `onethink_auth_rule` VALUES (33,'admin',1,'Admin/AuthManager/writeGroup','�����û���',1,'');
INSERT INTO `onethink_auth_rule` VALUES (34,'admin',1,'Admin/AuthManager/group','��Ȩ',1,'');
INSERT INTO `onethink_auth_rule` VALUES (35,'admin',1,'Admin/AuthManager/access','������Ȩ',1,'');
INSERT INTO `onethink_auth_rule` VALUES (36,'admin',1,'Admin/AuthManager/user','��Ա��Ȩ',1,'');
INSERT INTO `onethink_auth_rule` VALUES (37,'admin',1,'Admin/AuthManager/removeFromGroup','�����Ȩ',1,'');
INSERT INTO `onethink_auth_rule` VALUES (38,'admin',1,'Admin/AuthManager/addToGroup','�����Ա��Ȩ',1,'');
INSERT INTO `onethink_auth_rule` VALUES (39,'admin',1,'Admin/AuthManager/category','������Ȩ',1,'');
INSERT INTO `onethink_auth_rule` VALUES (40,'admin',1,'Admin/AuthManager/addToCategory','���������Ȩ',1,'');
INSERT INTO `onethink_auth_rule` VALUES (41,'admin',1,'Admin/AuthManager/index','Ȩ�޹���',1,'');
INSERT INTO `onethink_auth_rule` VALUES (42,'admin',1,'Admin/Addons/create','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (43,'admin',1,'Admin/Addons/checkForm','��ⴴ��',1,'');
INSERT INTO `onethink_auth_rule` VALUES (44,'admin',1,'Admin/Addons/preview','Ԥ��',1,'');
INSERT INTO `onethink_auth_rule` VALUES (45,'admin',1,'Admin/Addons/build','�������ɲ��',1,'');
INSERT INTO `onethink_auth_rule` VALUES (46,'admin',1,'Admin/Addons/config','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (47,'admin',1,'Admin/Addons/disable','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (48,'admin',1,'Admin/Addons/enable','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (49,'admin',1,'Admin/Addons/install','��װ',1,'');
INSERT INTO `onethink_auth_rule` VALUES (50,'admin',1,'Admin/Addons/uninstall','ж��',1,'');
INSERT INTO `onethink_auth_rule` VALUES (51,'admin',1,'Admin/Addons/saveconfig','��������',1,'');
INSERT INTO `onethink_auth_rule` VALUES (52,'admin',1,'Admin/Addons/adminList','�����̨�б�',1,'');
INSERT INTO `onethink_auth_rule` VALUES (53,'admin',1,'Admin/Addons/execute','URL��ʽ���ʲ��',1,'');
INSERT INTO `onethink_auth_rule` VALUES (54,'admin',1,'Admin/Addons/index','�������',1,'');
INSERT INTO `onethink_auth_rule` VALUES (55,'admin',1,'Admin/Addons/hooks','���ӹ���',1,'');
INSERT INTO `onethink_auth_rule` VALUES (56,'admin',1,'Admin/model/add','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (57,'admin',1,'Admin/model/edit','�༭',1,'');
INSERT INTO `onethink_auth_rule` VALUES (58,'admin',1,'Admin/model/setStatus','�ı�״̬',1,'');
INSERT INTO `onethink_auth_rule` VALUES (59,'admin',1,'Admin/model/update','��������',1,'');
INSERT INTO `onethink_auth_rule` VALUES (60,'admin',1,'Admin/Model/index','ģ�͹���',1,'');
INSERT INTO `onethink_auth_rule` VALUES (61,'admin',1,'Admin/Config/edit','�༭',1,'');
INSERT INTO `onethink_auth_rule` VALUES (62,'admin',1,'Admin/Config/del','ɾ��',1,'');
INSERT INTO `onethink_auth_rule` VALUES (63,'admin',1,'Admin/Config/add','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (64,'admin',1,'Admin/Config/save','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (65,'admin',1,'Admin/Config/group','��վ����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (66,'admin',1,'Admin/Config/index','���ù���',1,'');
INSERT INTO `onethink_auth_rule` VALUES (67,'admin',1,'Admin/Channel/add','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (68,'admin',1,'Admin/Channel/edit','�༭',1,'');
INSERT INTO `onethink_auth_rule` VALUES (69,'admin',1,'Admin/Channel/del','ɾ��',1,'');
INSERT INTO `onethink_auth_rule` VALUES (70,'admin',1,'Admin/Channel/index','��������',1,'');
INSERT INTO `onethink_auth_rule` VALUES (71,'admin',1,'Admin/Category/edit','�༭',1,'');
INSERT INTO `onethink_auth_rule` VALUES (72,'admin',1,'Admin/Category/add','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (73,'admin',1,'Admin/Category/remove','ɾ��',1,'');
INSERT INTO `onethink_auth_rule` VALUES (74,'admin',1,'Admin/Category/index','�������',1,'');
INSERT INTO `onethink_auth_rule` VALUES (75,'admin',1,'Admin/file/upload','�ϴ��ؼ�',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (76,'admin',1,'Admin/file/uploadPicture','�ϴ�ͼƬ',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (77,'admin',1,'Admin/file/download','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (79,'admin',1,'Admin/article/batchOperate','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (80,'admin',1,'Admin/Database/index?type=export','�������ݿ�',1,'');
INSERT INTO `onethink_auth_rule` VALUES (81,'admin',1,'Admin/Database/index?type=import','��ԭ���ݿ�',1,'');
INSERT INTO `onethink_auth_rule` VALUES (82,'admin',1,'Admin/Database/export','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (83,'admin',1,'Admin/Database/optimize','�Ż���',1,'');
INSERT INTO `onethink_auth_rule` VALUES (84,'admin',1,'Admin/Database/repair','�޸���',1,'');
INSERT INTO `onethink_auth_rule` VALUES (86,'admin',1,'Admin/Database/import','�ָ�',1,'');
INSERT INTO `onethink_auth_rule` VALUES (87,'admin',1,'Admin/Database/del','ɾ��',1,'');
INSERT INTO `onethink_auth_rule` VALUES (88,'admin',1,'Admin/User/add','�����û�',1,'');
INSERT INTO `onethink_auth_rule` VALUES (89,'admin',1,'Admin/Attribute/index','���Թ���',1,'');
INSERT INTO `onethink_auth_rule` VALUES (90,'admin',1,'Admin/Attribute/add','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (91,'admin',1,'Admin/Attribute/edit','�༭',1,'');
INSERT INTO `onethink_auth_rule` VALUES (92,'admin',1,'Admin/Attribute/setStatus','�ı�״̬',1,'');
INSERT INTO `onethink_auth_rule` VALUES (93,'admin',1,'Admin/Attribute/update','��������',1,'');
INSERT INTO `onethink_auth_rule` VALUES (94,'admin',1,'Admin/AuthManager/modelauth','ģ����Ȩ',1,'');
INSERT INTO `onethink_auth_rule` VALUES (95,'admin',1,'Admin/AuthManager/addToModel','����ģ����Ȩ',1,'');
INSERT INTO `onethink_auth_rule` VALUES (96,'admin',1,'Admin/Category/move','�ƶ�',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (97,'admin',1,'Admin/Category/merge','�ϲ�',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (98,'admin',1,'Admin/Config/menu','��̨�˵�����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (99,'admin',1,'Admin/Article/mydocument','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (100,'admin',1,'Admin/Menu/index','�˵�����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (101,'admin',1,'Admin/other','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (102,'admin',1,'Admin/Menu/add','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (103,'admin',1,'Admin/Menu/edit','�༭',1,'');
INSERT INTO `onethink_auth_rule` VALUES (104,'admin',1,'Admin/Think/lists?model=article','���¹���',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (105,'admin',1,'Admin/Think/lists?model=download','���ع���',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (106,'admin',1,'Admin/Think/lists?model=config','���ù���',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (107,'admin',1,'Admin/Action/actionlog','��Ϊ��־',1,'');
INSERT INTO `onethink_auth_rule` VALUES (108,'admin',1,'Admin/User/updatePassword','�޸�����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (109,'admin',1,'Admin/User/updateNickname','�޸��ǳ�',1,'');
INSERT INTO `onethink_auth_rule` VALUES (110,'admin',1,'Admin/action/edit','�鿴��Ϊ��־',1,'');
INSERT INTO `onethink_auth_rule` VALUES (111,'admin',2,'Admin/article/index','�ĵ��б�',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (112,'admin',2,'Admin/article/add','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (113,'admin',2,'Admin/article/edit','�༭',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (114,'admin',2,'Admin/article/setStatus','�ı�״̬',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (115,'admin',2,'Admin/article/update','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (116,'admin',2,'Admin/article/autoSave','����ݸ�',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (117,'admin',2,'Admin/article/move','�ƶ�',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (118,'admin',2,'Admin/article/copy','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (119,'admin',2,'Admin/article/paste','ճ��',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (120,'admin',2,'Admin/article/batchOperate','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (121,'admin',2,'Admin/article/recycle','����վ',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (122,'admin',2,'Admin/article/permit','��ԭ',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (123,'admin',2,'Admin/article/clear','���',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (124,'admin',2,'Admin/User/add','�����û�',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (125,'admin',2,'Admin/User/action','�û���Ϊ',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (126,'admin',2,'Admin/User/addAction','�����û���Ϊ',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (127,'admin',2,'Admin/User/editAction','�༭�û���Ϊ',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (128,'admin',2,'Admin/User/saveAction','�����û���Ϊ',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (129,'admin',2,'Admin/User/setStatus','�����Ϊ״̬',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (130,'admin',2,'Admin/User/changeStatus?method=forbidUser','���û�Ա',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (131,'admin',2,'Admin/User/changeStatus?method=resumeUser','���û�Ա',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (132,'admin',2,'Admin/User/changeStatus?method=deleteUser','ɾ����Ա',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (133,'admin',2,'Admin/AuthManager/index','Ȩ�޹���',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (134,'admin',2,'Admin/AuthManager/changeStatus?method=deleteGroup','ɾ��',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (135,'admin',2,'Admin/AuthManager/changeStatus?method=forbidGroup','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (136,'admin',2,'Admin/AuthManager/changeStatus?method=resumeGroup','�ָ�',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (137,'admin',2,'Admin/AuthManager/createGroup','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (138,'admin',2,'Admin/AuthManager/editGroup','�༭',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (139,'admin',2,'Admin/AuthManager/writeGroup','�����û���',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (140,'admin',2,'Admin/AuthManager/group','��Ȩ',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (141,'admin',2,'Admin/AuthManager/access','������Ȩ',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (142,'admin',2,'Admin/AuthManager/user','��Ա��Ȩ',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (143,'admin',2,'Admin/AuthManager/removeFromGroup','�����Ȩ',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (144,'admin',2,'Admin/AuthManager/addToGroup','�����Ա��Ȩ',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (145,'admin',2,'Admin/AuthManager/category','������Ȩ',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (146,'admin',2,'Admin/AuthManager/addToCategory','���������Ȩ',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (147,'admin',2,'Admin/AuthManager/modelauth','ģ����Ȩ',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (148,'admin',2,'Admin/AuthManager/addToModel','����ģ����Ȩ',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (149,'admin',2,'Admin/Addons/create','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (150,'admin',2,'Admin/Addons/checkForm','��ⴴ��',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (151,'admin',2,'Admin/Addons/preview','Ԥ��',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (152,'admin',2,'Admin/Addons/build','�������ɲ��',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (153,'admin',2,'Admin/Addons/config','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (154,'admin',2,'Admin/Addons/disable','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (155,'admin',2,'Admin/Addons/enable','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (156,'admin',2,'Admin/Addons/install','��װ',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (157,'admin',2,'Admin/Addons/uninstall','ж��',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (158,'admin',2,'Admin/Addons/saveconfig','��������',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (159,'admin',2,'Admin/Addons/adminList','�����̨�б�',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (160,'admin',2,'Admin/Addons/execute','URL��ʽ���ʲ��',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (161,'admin',2,'Admin/Addons/hooks','���ӹ���',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (162,'admin',2,'Admin/Model/index','ģ�͹���',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (163,'admin',2,'Admin/model/add','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (164,'admin',2,'Admin/model/edit','�༭',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (165,'admin',2,'Admin/model/setStatus','�ı�״̬',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (166,'admin',2,'Admin/model/update','��������',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (167,'admin',2,'Admin/Attribute/index','���Թ���',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (168,'admin',2,'Admin/Attribute/add','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (169,'admin',2,'Admin/Attribute/edit','�༭',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (170,'admin',2,'Admin/Attribute/setStatus','�ı�״̬',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (171,'admin',2,'Admin/Attribute/update','��������',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (172,'admin',2,'Admin/Config/index','���ù���',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (173,'admin',2,'Admin/Config/edit','�༭',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (174,'admin',2,'Admin/Config/del','ɾ��',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (175,'admin',2,'Admin/Config/add','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (176,'admin',2,'Admin/Config/save','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (177,'admin',2,'Admin/Menu/index','�˵�����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (178,'admin',2,'Admin/Channel/index','��������',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (179,'admin',2,'Admin/Channel/add','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (180,'admin',2,'Admin/Channel/edit','�༭',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (181,'admin',2,'Admin/Channel/del','ɾ��',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (182,'admin',2,'Admin/Category/index','�������',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (183,'admin',2,'Admin/Category/edit','�༭',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (184,'admin',2,'Admin/Category/add','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (185,'admin',2,'Admin/Category/remove','ɾ��',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (186,'admin',2,'Admin/Category/move','�ƶ�',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (187,'admin',2,'Admin/Category/merge','�ϲ�',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (188,'admin',2,'Admin/Database/index?type=export','�������ݿ�',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (189,'admin',2,'Admin/Database/export','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (190,'admin',2,'Admin/Database/optimize','�Ż���',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (191,'admin',2,'Admin/Database/repair','�޸���',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (192,'admin',2,'Admin/Database/index?type=import','��ԭ���ݿ�',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (193,'admin',2,'Admin/Database/import','�ָ�',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (194,'admin',2,'Admin/Database/del','ɾ��',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (195,'admin',2,'Admin/other','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (196,'admin',2,'Admin/Menu/add','����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (197,'admin',2,'Admin/Menu/edit','�༭',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (198,'admin',2,'Admin/Think/lists?model=article','Ӧ��',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (199,'admin',2,'Admin/Think/lists?model=download','���ع���',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (200,'admin',2,'Admin/Think/lists?model=config','Ӧ��',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (201,'admin',2,'Admin/Action/actionlog','��Ϊ��־',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (202,'admin',2,'Admin/User/updatePassword','�޸�����',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (203,'admin',2,'Admin/User/updateNickname','�޸��ǳ�',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (204,'admin',2,'Admin/action/edit','�鿴��Ϊ��־',-1,'');
INSERT INTO `onethink_auth_rule` VALUES (205,'admin',1,'Admin/think/add','��������',1,'');
INSERT INTO `onethink_auth_rule` VALUES (206,'admin',1,'Admin/think/edit','�༭����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (207,'admin',1,'Admin/Menu/import','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (208,'admin',1,'Admin/Model/generate','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (209,'admin',1,'Admin/Addons/addHook','��������',1,'');
INSERT INTO `onethink_auth_rule` VALUES (210,'admin',1,'Admin/Addons/edithook','�༭����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (211,'admin',1,'Admin/Article/sort','�ĵ�����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (212,'admin',1,'Admin/Config/sort','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (213,'admin',1,'Admin/Menu/sort','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (214,'admin',1,'Admin/Channel/sort','����',1,'');
INSERT INTO `onethink_auth_rule` VALUES (215,'admin',1,'Admin/Category/operate/type/move','�ƶ�',1,'');
INSERT INTO `onethink_auth_rule` VALUES (216,'admin',1,'Admin/Category/operate/type/merge','�ϲ�',1,'');
INSERT INTO `onethink_auth_rule` VALUES (217,'admin',1,'Admin/article/index','�ĵ��б�',1,'');
INSERT INTO `onethink_auth_rule` VALUES (218,'admin',1,'Admin/think/lists','�����б�',1,'');

#
# Source for table onethink_category
#

DROP TABLE IF EXISTS `onethink_category`;
CREATE TABLE `onethink_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `name` varchar(30) NOT NULL COMMENT '��־',
  `title` varchar(50) NOT NULL COMMENT '����',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�ϼ�����ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ͬ����Ч��',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '�б�ÿҳ����',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO����ҳ����',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '�ؼ���',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '����',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT 'Ƶ��ҳģ��',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '�б�ҳģ��',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '����ҳģ��',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '�༭ҳģ��',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '�б��ģ��',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '���ĵ���ģ��',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '����������������',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '�Ƿ�����������',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '�ɼ���',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '�Ƿ�����ظ�',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '�����������Ƿ���Ҫ���',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '��չ����',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '����״̬',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ͼ��',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '���鶨��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='�����';

#
# Dumping data for table onethink_category
#

INSERT INTO `onethink_category` VALUES (1,'blog','����',0,0,10,'','','','','','','','2,3','2','2,1',0,0,1,0,0,'1','',1379474947,1382701539,1,0,'');
INSERT INTO `onethink_category` VALUES (2,'default_blog','Ĭ�Ϸ���',1,1,10,'','','','','','','','2,3','2','2,1,3',0,1,1,0,1,'1','',1379475028,1386839751,1,0,'');

#
# Source for table onethink_channel
#

DROP TABLE IF EXISTS `onethink_channel`;
CREATE TABLE `onethink_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Ƶ��ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�ϼ�Ƶ��ID',
  `title` char(30) NOT NULL COMMENT 'Ƶ������',
  `url` char(100) NOT NULL COMMENT 'Ƶ������',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '��������',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '״̬',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '�´��ڴ�',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_channel
#

INSERT INTO `onethink_channel` VALUES (1,0,'��ҳ','Index/index',1,1379475111,1379923177,1,0);
INSERT INTO `onethink_channel` VALUES (2,0,'����','Article/index?category=blog',2,1379475131,1379483713,1,0);
INSERT INTO `onethink_channel` VALUES (3,0,'����','http://www.onethink.cn',3,1379475154,1387163458,1,0);

#
# Source for table onethink_config
#

DROP TABLE IF EXISTS `onethink_config`;
CREATE TABLE `onethink_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '��������',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '��������',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '����˵��',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '���÷���',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '����ֵ',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '����˵��',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '״̬',
  `value` text COMMENT '����ֵ',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '����',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_config
#

INSERT INTO `onethink_config` VALUES (1,'WEB_SITE_TITLE',1,'��վ����',1,'','��վ����ǰ̨��ʾ����',1378898976,1379235274,1,'OneThink',2);
INSERT INTO `onethink_config` VALUES (2,'WEB_SITE_DESCRIPTION',2,'��վ����',1,'','��վ������������',1378898976,1379235841,1,'OneThink���ݹ�����',3);
INSERT INTO `onethink_config` VALUES (3,'WEB_SITE_KEYWORD',2,'��վ�ؼ���',1,'','��վ��������ؼ���',1378898976,1381390100,1,'ThinkPHP,OneThink',5);
INSERT INTO `onethink_config` VALUES (4,'WEB_SITE_CLOSE',4,'�ر�վ��',1,'0:�ر�,1:����','վ��رպ������û����ܷ��ʣ�����Ա������������',1378898976,1379235296,1,'1',4);
INSERT INTO `onethink_config` VALUES (9,'CONFIG_TYPE_LIST',3,'���������б�',4,'','��Ҫ�������ݽ�����ҳ���������',1378898976,1379235348,1,'0:����\r\n1:�ַ�\r\n2:�ı�\r\n3:����\r\n4:ö��',2);
INSERT INTO `onethink_config` VALUES (10,'WEB_SITE_ICP',1,'��վ������',1,'','��������վ�ײ���ʾ�ı����ţ��硰��ICP��12007941��-2',1378900335,1379235859,1,'',6);
INSERT INTO `onethink_config` VALUES (11,'DOCUMENT_POSITION',3,'�ĵ��Ƽ�λ',2,'','�ĵ��Ƽ�λ���Ƽ������λ��KEYֵ��Ӽ���',1379053380,1379235329,1,'1:�б��Ƽ�\r\n2:Ƶ���Ƽ�\r\n4:��ҳ�Ƽ�',3);
INSERT INTO `onethink_config` VALUES (12,'DOCUMENT_DISPLAY',3,'�ĵ��ɼ���',2,'','���¿ɼ��Խ�Ӱ��ǰ̨��ʾ����̨����Ӱ��',1379056370,1379235322,1,'0:�����˿ɼ�\r\n1:��ע���Ա�ɼ�\r\n2:������Ա�ɼ�',4);
INSERT INTO `onethink_config` VALUES (13,'COLOR_STYLE',4,'��̨ɫϵ',1,'default_color:Ĭ��\r\nblue_color:������','��̨��ɫ���',1379122533,1379235904,1,'blue_color',7);
INSERT INTO `onethink_config` VALUES (20,'CONFIG_GROUP_LIST',3,'���÷���',4,'','���÷���',1379228036,1384418383,1,'1:����\r\n2:����\r\n3:�û�\r\n4:ϵͳ\r\n5:����',4);
INSERT INTO `onethink_config` VALUES (21,'HOOKS_TYPE',3,'���ӵ�����',4,'','���� 1-������չ��ʾ���ݣ�2-������չҵ����',1379313397,1379313407,1,'1:��ͼ\r\n2:������',6);
INSERT INTO `onethink_config` VALUES (22,'AUTH_CONFIG',3,'Auth����',4,'','�Զ���Auth.class.php������',1379409310,1379409564,1,'AUTH_ON:1\r\nAUTH_TYPE:2',8);
INSERT INTO `onethink_config` VALUES (23,'OPEN_DRAFTBOX',4,'�Ƿ����ݸ幦��',2,'0:�رղݸ幦��\r\n1:�����ݸ幦��\r\n','��������ʱ�Ĳݸ幦������',1379484332,1379484591,1,'1',1);
INSERT INTO `onethink_config` VALUES (24,'DRAFT_AUTOSAVE_INTERVAL',0,'�Զ�����ݸ�ʱ��',2,'','�Զ�����ݸ��ʱ��������λ����',1379484574,1422631047,1,'60',2);
INSERT INTO `onethink_config` VALUES (25,'LIST_ROWS',0,'��̨ÿҳ��¼��',2,'','��̨����ÿҳ��ʾ��¼��',1379503896,1380427745,1,'10',10);
INSERT INTO `onethink_config` VALUES (26,'USER_ALLOW_REGISTER',4,'�Ƿ������û�ע��',3,'0:�ر�ע��\r\n1:����ע��','�Ƿ񿪷��û�ע��',1379504487,1379504580,1,'1',3);
INSERT INTO `onethink_config` VALUES (27,'CODEMIRROR_THEME',4,'Ԥ�������CodeMirror����',4,'3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight','�����CodeMirror����',1379814385,1384740813,1,'ambiance',3);
INSERT INTO `onethink_config` VALUES (28,'DATA_BACKUP_PATH',1,'���ݿⱸ�ݸ�·��',4,'','·�������� / ��β',1381482411,1381482411,1,'./Data/',5);
INSERT INTO `onethink_config` VALUES (29,'DATA_BACKUP_PART_SIZE',0,'���ݿⱸ�ݾ��С',4,'','��ֵ��������ѹ����ķ־���󳤶ȡ���λ��B����������20M',1381482488,1381729564,1,'20971520',7);
INSERT INTO `onethink_config` VALUES (30,'DATA_BACKUP_COMPRESS',4,'���ݿⱸ���ļ��Ƿ�����ѹ��',4,'0:��ѹ��\r\n1:����ѹ��','ѹ�������ļ���ҪPHP����֧��gzopen,gzwrite����',1381713345,1381729544,1,'1',9);
INSERT INTO `onethink_config` VALUES (31,'DATA_BACKUP_COMPRESS_LEVEL',4,'���ݿⱸ���ļ�ѹ������',4,'1:��ͨ\r\n4:һ��\r\n9:���','���ݿⱸ���ļ���ѹ�����𣬸������ڿ���ѹ��ʱ��Ч',1381713408,1381713408,1,'9',10);
INSERT INTO `onethink_config` VALUES (32,'DEVELOP_MODE',4,'����������ģʽ',4,'0:�ر�\r\n1:����','�Ƿ���������ģʽ',1383105995,1383291877,1,'1',11);
INSERT INTO `onethink_config` VALUES (33,'ALLOW_VISIT',3,'�����޿���������',0,'','',1386644047,1422704535,1,'0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture',0);
INSERT INTO `onethink_config` VALUES (34,'DENY_VISIT',3,'����ר�޿���������',0,'','����������Ա�ɷ��ʵĿ���������',1386644141,1386644659,1,'0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree',0);
INSERT INTO `onethink_config` VALUES (35,'REPLY_LIST_ROWS',0,'�ظ��б�ÿҳ����',2,'','',1386645376,1387178083,1,'10',0);
INSERT INTO `onethink_config` VALUES (36,'ADMIN_ALLOW_IP',2,'��̨�������IP',4,'','����ö��ŷָ�����������ñ�ʾ������IP����',1387165454,1387165553,1,'',12);
INSERT INTO `onethink_config` VALUES (37,'SHOW_PAGE_TRACE',4,'�Ƿ���ʾҳ��Trace',4,'0:�ر�\r\n1:����','�Ƿ���ʾҳ��Trace��Ϣ',1387165685,1387165685,1,'1',1);
INSERT INTO `onethink_config` VALUES (38,'MAIL_TYPE',4,'�ʼ���ʽ',5,'0:SMTPģ�鷢��','�ʼ����ͷ�ʽ��Ŀǰֻ֧��SMTP��ʽ',1410491198,1423723355,1,'0',4);
INSERT INTO `onethink_config` VALUES (39,'MAIL_SMTP_HOST',1,'SMTP������',5,'','������������ơ��磺smtp.qq.com��',1410491317,1422687078,1,'smtp.qq.com',5);
INSERT INTO `onethink_config` VALUES (40,'MAIL_SMTP_PORT',0,'SMTP�������˿�',5,'','�˿�һ��Ϊ25',1410491384,1410491384,1,'25',6);
INSERT INTO `onethink_config` VALUES (41,'MAIL_SMTP_USER',1,'SMTP�������û���',5,'','�����û���',1410491508,1410941682,1,'836692464@qq.com',7);
INSERT INTO `onethink_config` VALUES (42,'MAIL_SMTP_PASS',1,'SMTP����������',5,'��������','����',1410491656,1410941695,1,'',8);
INSERT INTO `onethink_config` VALUES (43,'MAIL_SMTP_CE',1,'�ʼ����Ͳ���',5,'','���Ͳ����ʼ��õģ���������������óɹ�û��',1410491698,1410937656,1,'836692464@qq.com',3);
INSERT INTO `onethink_config` VALUES (44,'MAIL_REPLY_EMAIL',1,'����������',5,'','���������䣬Ĭ��ʹ��SMTP�������û���',1410925495,1422687971,1,'app880@foxmail.com',2);
INSERT INTO `onethink_config` VALUES (45,'MAIL_REPLY_NAME',1,'����������',5,'','���������ƣ�Ĭ��ʹ����վ���ơ�WEB_SITE_TITLE ��վ���⡿',1422685995,1422688174,1,'����',1);
INSERT INTO `onethink_config` VALUES (46,'WEB_SITE_NAME',0,'��վ����',1,'','��վ����',1422687631,1422687631,1,'app880.com',1);

#
# Source for table onethink_document
#

DROP TABLE IF EXISTS `onethink_document`;
CREATE TABLE `onethink_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '�ĵ�ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '��ʶ',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '����',
  `category_id` int(10) unsigned NOT NULL COMMENT '��������',
  `group_id` smallint(3) unsigned NOT NULL COMMENT '��������',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '����',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '���ڵ�',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '����ģ��ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '��������',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '�Ƽ�λ',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '�ɼ���',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '��������',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�����',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '������',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '��չͳ���ֶ�',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '���ȼ�',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '����״̬',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='�ĵ�ģ�ͻ�����';

#
# Dumping data for table onethink_document
#

INSERT INTO `onethink_document` VALUES (5,1,'','tt',2,0,'',0,0,2,2,0,0,22,1,0,0,0,0,0,0,1422970946,1422970946,3);
INSERT INTO `onethink_document` VALUES (6,1,'','01',2,0,'',0,0,2,2,0,0,27,1,0,0,38,0,0,0,1422981600,1423297290,1);
INSERT INTO `onethink_document` VALUES (7,1,'','01',2,0,'',0,0,2,2,0,0,27,1,0,0,0,0,0,0,1422981607,1422981607,3);
INSERT INTO `onethink_document` VALUES (8,1,'','02',2,0,'',0,0,2,2,0,0,0,1,0,0,1,0,0,0,1423761610,1423761610,1);

#
# Source for table onethink_document_article
#

DROP TABLE IF EXISTS `onethink_document_article`;
CREATE TABLE `onethink_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�ĵ�ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '���ݽ�������',
  `content` text NOT NULL COMMENT '��������',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '����ҳ��ʾģ��',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�ղ���',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='�ĵ�ģ�����±�';

#
# Dumping data for table onethink_document_article
#

INSERT INTO `onethink_document_article` VALUES (5,0,'<img src=\"/Uploads/Editor/2015-02-03/54d0d02d0a95e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2015-02-03/54d0d02e69007.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2015-02-03/54d0d030273a5.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2015-02-03/54d0d032161f3.jpg\" alt=\"\" />','',0);
INSERT INTO `onethink_document_article` VALUES (6,0,'01<img src=\"/Public/static/kindeditor/plugins/emoticons/images/6.gif\" border=\"0\" alt=\"\" />','',0);
INSERT INTO `onethink_document_article` VALUES (7,0,'01','',0);
INSERT INTO `onethink_document_article` VALUES (8,0,'02','',0);

#
# Source for table onethink_document_download
#

DROP TABLE IF EXISTS `onethink_document_download`;
CREATE TABLE `onethink_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�ĵ�ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '���ݽ�������',
  `content` text NOT NULL COMMENT '������ϸ����',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '����ҳ��ʾģ��',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�ļ�ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '���ش���',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '�ļ���С',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='�ĵ�ģ�����ر�';

#
# Dumping data for table onethink_document_download
#


#
# Source for table onethink_file
#

DROP TABLE IF EXISTS `onethink_file`;
CREATE TABLE `onethink_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '�ļ�ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT 'ԭʼ�ļ���',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '��������',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '�ļ�����·��',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '�ļ���׺',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '�ļ�mime����',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�ļ���С',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '�ļ�md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '�ļ� sha1����',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '�ļ�����λ��',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'Զ�̵�ַ',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�ϴ�ʱ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='�ļ���';

#
# Dumping data for table onethink_file
#


#
# Source for table onethink_friendlinks
#

DROP TABLE IF EXISTS `onethink_friendlinks`;
CREATE TABLE `onethink_friendlinks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '����',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '���1��ͼƬ��2����ͨ��',
  `title` char(80) NOT NULL DEFAULT '' COMMENT 'վ������',
  `cover_id` int(10) NOT NULL COMMENT 'ͼƬID',
  `link` char(140) NOT NULL DEFAULT '' COMMENT '���ӵ�ַ',
  `level` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '���ȼ�',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '״̬��0�����ã�1��������',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_friendlinks
#


#
# Source for table onethink_guestbook
#

DROP TABLE IF EXISTS `onethink_guestbook`;
CREATE TABLE `onethink_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(224) NOT NULL COMMENT '�����ǳ�',
  `contact` varchar(225) NOT NULL COMMENT '��������ϵ��ʽ',
  `content` varchar(225) NOT NULL COMMENT '��������',
  `starttime` int(10) NOT NULL COMMENT '����ʱ��',
  `is_reply` int(11) NOT NULL COMMENT '�Ƿ�ظ�',
  `is_pass` int(11) NOT NULL COMMENT '�Ƿ�ͨ��',
  `r_content` varchar(225) NOT NULL COMMENT '�ظ�����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_guestbook
#


#
# Source for table onethink_hooks
#

DROP TABLE IF EXISTS `onethink_hooks`;
CREATE TABLE `onethink_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '����',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '��������',
  `description` text COMMENT '����',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '����',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '���ӹ��صĲ�� ''��''�ָ�',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_hooks
#

INSERT INTO `onethink_hooks` VALUES (1,'pageHeader','ҳ��header���ӣ�һ�����ڼ��ز��CSS�ļ��ʹ���',1,0,'Unslider',1);
INSERT INTO `onethink_hooks` VALUES (3,'documentEditForm','��ӱ༭���� ��չ���ݹ���',1,0,'Attachment',1);
INSERT INTO `onethink_hooks` VALUES (4,'documentDetailAfter','�ĵ�ĩβ��ʾ',1,1423761366,'Attachment,SocialComment,BaiduShare',1);
INSERT INTO `onethink_hooks` VALUES (5,'documentDetailBefore','ҳ������ǰ��ʾ�ù���',1,0,'',1);
INSERT INTO `onethink_hooks` VALUES (6,'documentSaveComplete','�����ĵ����ݺ����չ����',2,0,'Attachment',1);
INSERT INTO `onethink_hooks` VALUES (7,'documentEditFormContent','��ӱ༭����������ʾ����',1,0,'Editor',1);
INSERT INTO `onethink_hooks` VALUES (8,'adminArticleEdit','��̨���ݱ༭ҳ�༭��',1,1378982734,'EditorForAdmin',1);
INSERT INTO `onethink_hooks` VALUES (13,'AdminIndex','��ҳС���Ӹ��Ի���ʾ',1,1382596073,'SiteStat,SystemInfo,DevTeam,Water,Mail',1);
INSERT INTO `onethink_hooks` VALUES (14,'topicComment','�����ύ��ʽ��չ���ӡ�',1,1380163518,'Editor',1);
INSERT INTO `onethink_hooks` VALUES (16,'app_begin','Ӧ�ÿ�ʼ',2,1384481614,'',1);
INSERT INTO `onethink_hooks` VALUES (27,'pageFooter','ҳ��footer���ӣ�һ�����ڼ��ز��JS�ļ���JS����',1,1422719676,'Mail,ReturnTop,Unslider',1);
INSERT INTO `onethink_hooks` VALUES (29,'dealPicture','�����ϴ�ͼƬ�Ĺ��ӣ���ϵͳ��Upload.class.phpͼƬ�ϴ������е��ã����ϴ���ͼƬ���ж���Ĵ���',2,1422726029,'Water',1);
INSERT INTO `onethink_hooks` VALUES (69,'app_end','Ӧ�ý���',2,1423674478,'Schedule',1);
INSERT INTO `onethink_hooks` VALUES (86,'Friendlinks','���ã���ʾ���������ӵĹ���',1,1423825560,'Friendlinks',1);
INSERT INTO `onethink_hooks` VALUES (87,'Advs','���ù��Ĺ���',1,1423825694,'Advs',1);
INSERT INTO `onethink_hooks` VALUES (89,'SyncLogin','���õ������˺�ͬ����½�Ĺ���',1,1423825967,'SyncLogin',1);
INSERT INTO `onethink_hooks` VALUES (97,'Unslider','ͼƬ�ֲ�������ͼ���������',1,1423837388,'Unslider',1);
INSERT INTO `onethink_hooks` VALUES (101,'WechatAdminLogin','��̨��½ҳ�湳�ӣ�����΢�Ŷ�ά���½',1,1423925643,'Wechat',1);
INSERT INTO `onethink_hooks` VALUES (102,'WechatIndexLogin','ǰ̨��½ҳ�湳�ӣ�����΢�Ŷ�ά���½',1,1423925643,'Wechat',1);
INSERT INTO `onethink_hooks` VALUES (104,'Guestbook','���ã���ʾ�����԰�Ĺ���',1,1423925886,'Guestbook',1);

#
# Source for table onethink_mail_history
#

DROP TABLE IF EXISTS `onethink_mail_history`;
CREATE TABLE `onethink_mail_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `from` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_mail_history
#


#
# Source for table onethink_mail_history_link
#

DROP TABLE IF EXISTS `onethink_mail_history_link`;
CREATE TABLE `onethink_mail_history_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_id` int(11) NOT NULL,
  `to` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_mail_history_link
#


#
# Source for table onethink_mail_list
#

DROP TABLE IF EXISTS `onethink_mail_list`;
CREATE TABLE `onethink_mail_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_mail_list
#


#
# Source for table onethink_mail_token
#

DROP TABLE IF EXISTS `onethink_mail_token`;
CREATE TABLE `onethink_mail_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `token` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_mail_token
#


#
# Source for table onethink_member
#

DROP TABLE IF EXISTS `onethink_member`;
CREATE TABLE `onethink_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '�û�ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '�ǳ�',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '�Ա�',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '����',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq��',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '�û�����',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '��¼����',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT 'ע��IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ע��ʱ��',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '����¼IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����¼ʱ��',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '��Ա״̬',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='��Ա��';

#
# Dumping data for table onethink_member
#

INSERT INTO `onethink_member` VALUES (1,'admin',0,'0000-00-00','',30,43,0,1422599239,2130706433,1423891748,1);
INSERT INTO `onethink_member` VALUES (2,'xjq',0,'0000-00-00','',10,2,0,0,2130706433,1422699744,1);
INSERT INTO `onethink_member` VALUES (3,'geniusxjq',0,'0000-00-00','',30,8,2130706433,1422700152,2130706433,1423761472,1);

#
# Source for table onethink_menu
#

DROP TABLE IF EXISTS `onethink_menu`;
CREATE TABLE `onethink_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '�ĵ�ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '����',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�ϼ�����ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ͬ����Ч��',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '���ӵ�ַ',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '�Ƿ�����',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '��ʾ',
  `group` varchar(50) DEFAULT '' COMMENT '����',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '�Ƿ��������ģʽ�ɼ�',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '״̬',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_menu
#

INSERT INTO `onethink_menu` VALUES (1,'��ҳ',0,1,'Index/index',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (2,'����',0,2,'Article/index',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (3,'�ĵ��б�',2,0,'article/index',1,'','����',0,1);
INSERT INTO `onethink_menu` VALUES (4,'����',3,0,'article/add',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (5,'�༭',3,0,'article/edit',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (6,'�ı�״̬',3,0,'article/setStatus',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (7,'����',3,0,'article/update',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (8,'����ݸ�',3,0,'article/autoSave',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (9,'�ƶ�',3,0,'article/move',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (10,'����',3,0,'article/copy',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (11,'ճ��',3,0,'article/paste',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (12,'����',3,0,'article/batchOperate',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (13,'����վ',2,0,'article/recycle',1,'','����',0,1);
INSERT INTO `onethink_menu` VALUES (14,'��ԭ',13,0,'article/permit',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (15,'���',13,0,'article/clear',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (16,'�û�',0,3,'User/index',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (17,'�û���Ϣ',16,0,'User/index',0,'','�û�����',0,1);
INSERT INTO `onethink_menu` VALUES (18,'�����û�',17,0,'User/add',0,'������û�','',0,1);
INSERT INTO `onethink_menu` VALUES (19,'�û���Ϊ',16,0,'User/action',0,'','��Ϊ����',0,1);
INSERT INTO `onethink_menu` VALUES (20,'�����û���Ϊ',19,0,'User/addaction',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (21,'�༭�û���Ϊ',19,0,'User/editaction',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (22,'�����û���Ϊ',19,0,'User/saveAction',0,'\"�û�->�û���Ϊ\"����༭���������û���Ϊ','',0,1);
INSERT INTO `onethink_menu` VALUES (23,'�����Ϊ״̬',19,0,'User/setStatus',0,'\"�û�->�û���Ϊ\"�е�����,���ú�ɾ��Ȩ��','',0,1);
INSERT INTO `onethink_menu` VALUES (24,'���û�Ա',19,0,'User/changeStatus?method=forbidUser',0,'\"�û�->�û���Ϣ\"�еĽ���','',0,1);
INSERT INTO `onethink_menu` VALUES (25,'���û�Ա',19,0,'User/changeStatus?method=resumeUser',0,'\"�û�->�û���Ϣ\"�е�����','',0,1);
INSERT INTO `onethink_menu` VALUES (26,'ɾ����Ա',19,0,'User/changeStatus?method=deleteUser',0,'\"�û�->�û���Ϣ\"�е�ɾ��','',0,1);
INSERT INTO `onethink_menu` VALUES (27,'Ȩ�޹���',16,0,'AuthManager/index',0,'','�û�����',0,1);
INSERT INTO `onethink_menu` VALUES (28,'ɾ��',27,0,'AuthManager/changeStatus?method=deleteGroup',0,'ɾ���û���','',0,1);
INSERT INTO `onethink_menu` VALUES (29,'����',27,0,'AuthManager/changeStatus?method=forbidGroup',0,'�����û���','',0,1);
INSERT INTO `onethink_menu` VALUES (30,'�ָ�',27,0,'AuthManager/changeStatus?method=resumeGroup',0,'�ָ��ѽ��õ��û���','',0,1);
INSERT INTO `onethink_menu` VALUES (31,'����',27,0,'AuthManager/createGroup',0,'�����µ��û���','',0,1);
INSERT INTO `onethink_menu` VALUES (32,'�༭',27,0,'AuthManager/editGroup',0,'�༭�û������ƺ�����','',0,1);
INSERT INTO `onethink_menu` VALUES (33,'�����û���',27,0,'AuthManager/writeGroup',0,'�����ͱ༭�û����\"����\"��ť','',0,1);
INSERT INTO `onethink_menu` VALUES (34,'��Ȩ',27,0,'AuthManager/group',0,'\"��̨ \\ �û� \\ �û���Ϣ\"�б�ҳ��\"��Ȩ\"������ť,���������û������û���','',0,1);
INSERT INTO `onethink_menu` VALUES (35,'������Ȩ',27,0,'AuthManager/access',0,'\"��̨ \\ �û� \\ Ȩ�޹���\"�б�ҳ��\"������Ȩ\"������ť','',0,1);
INSERT INTO `onethink_menu` VALUES (36,'��Ա��Ȩ',27,0,'AuthManager/user',0,'\"��̨ \\ �û� \\ Ȩ�޹���\"�б�ҳ��\"��Ա��Ȩ\"������ť','',0,1);
INSERT INTO `onethink_menu` VALUES (37,'�����Ȩ',27,0,'AuthManager/removeFromGroup',0,'\"��Ա��Ȩ\"�б�ҳ�ڵĽ����Ȩ������ť','',0,1);
INSERT INTO `onethink_menu` VALUES (38,'�����Ա��Ȩ',27,0,'AuthManager/addToGroup',0,'\"�û���Ϣ\"�б�ҳ\"��Ȩ\"ʱ��\"����\"��ť��\"��Ա��Ȩ\"�����Ͻǵ�\"���\"��ť)','',0,1);
INSERT INTO `onethink_menu` VALUES (39,'������Ȩ',27,0,'AuthManager/category',0,'\"��̨ \\ �û� \\ Ȩ�޹���\"�б�ҳ��\"������Ȩ\"������ť','',0,1);
INSERT INTO `onethink_menu` VALUES (40,'���������Ȩ',27,0,'AuthManager/addToCategory',0,'\"������Ȩ\"ҳ���\"����\"��ť','',0,1);
INSERT INTO `onethink_menu` VALUES (41,'ģ����Ȩ',27,0,'AuthManager/modelauth',0,'\"��̨ \\ �û� \\ Ȩ�޹���\"�б�ҳ��\"ģ����Ȩ\"������ť','',0,1);
INSERT INTO `onethink_menu` VALUES (42,'����ģ����Ȩ',27,0,'AuthManager/addToModel',0,'\"������Ȩ\"ҳ���\"����\"��ť','',0,1);
INSERT INTO `onethink_menu` VALUES (43,'��չ',0,7,'Addons/index',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (44,'�������',43,1,'Addons/index',0,'','��չ',0,1);
INSERT INTO `onethink_menu` VALUES (45,'����',44,0,'Addons/create',0,'�������ϴ�������ṹ��','',0,1);
INSERT INTO `onethink_menu` VALUES (46,'��ⴴ��',44,0,'Addons/checkForm',0,'������Ƿ���Դ���','',0,1);
INSERT INTO `onethink_menu` VALUES (47,'Ԥ��',44,0,'Addons/preview',0,'Ԥ������������ļ�','',0,1);
INSERT INTO `onethink_menu` VALUES (48,'�������ɲ��',44,0,'Addons/build',0,'��ʼ���ɲ���ṹ','',0,1);
INSERT INTO `onethink_menu` VALUES (49,'����',44,0,'Addons/config',0,'���ò������','',0,1);
INSERT INTO `onethink_menu` VALUES (50,'����',44,0,'Addons/disable',0,'���ò��','',0,1);
INSERT INTO `onethink_menu` VALUES (51,'����',44,0,'Addons/enable',0,'���ò��','',0,1);
INSERT INTO `onethink_menu` VALUES (52,'��װ',44,0,'Addons/install',0,'��װ���','',0,1);
INSERT INTO `onethink_menu` VALUES (53,'ж��',44,0,'Addons/uninstall',0,'ж�ز��','',0,1);
INSERT INTO `onethink_menu` VALUES (54,'��������',44,0,'Addons/saveconfig',0,'���²�����ô���','',0,1);
INSERT INTO `onethink_menu` VALUES (55,'�����̨�б�',44,0,'Addons/adminList',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (56,'URL��ʽ���ʲ��',44,0,'Addons/execute',0,'�����Ƿ���Ȩ��ͨ��url���ʲ������������','',0,1);
INSERT INTO `onethink_menu` VALUES (57,'���ӹ���',43,2,'Addons/hooks',0,'','��չ',0,1);
INSERT INTO `onethink_menu` VALUES (58,'ģ�͹���',68,3,'Model/index',0,'','ϵͳ����',0,1);
INSERT INTO `onethink_menu` VALUES (59,'����',58,0,'model/add',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (60,'�༭',58,0,'model/edit',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (61,'�ı�״̬',58,0,'model/setStatus',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (62,'��������',58,0,'model/update',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (63,'���Թ���',68,0,'Attribute/index',1,'��վ�������á�','',0,1);
INSERT INTO `onethink_menu` VALUES (64,'����',63,0,'Attribute/add',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (65,'�༭',63,0,'Attribute/edit',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (66,'�ı�״̬',63,0,'Attribute/setStatus',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (67,'��������',63,0,'Attribute/update',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (68,'ϵͳ',0,4,'Config/group',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (69,'��վ����',68,1,'Config/group',0,'','ϵͳ����',0,1);
INSERT INTO `onethink_menu` VALUES (70,'���ù���',68,4,'Config/index',0,'','ϵͳ����',0,1);
INSERT INTO `onethink_menu` VALUES (71,'�༭',70,0,'Config/edit',0,'�����༭�ͱ�������','',0,1);
INSERT INTO `onethink_menu` VALUES (72,'ɾ��',70,0,'Config/del',0,'ɾ������','',0,1);
INSERT INTO `onethink_menu` VALUES (73,'����',70,0,'Config/add',0,'��������','',0,1);
INSERT INTO `onethink_menu` VALUES (74,'����',70,0,'Config/save',0,'��������','',0,1);
INSERT INTO `onethink_menu` VALUES (75,'�˵�����',68,5,'Menu/index',0,'','ϵͳ����',0,1);
INSERT INTO `onethink_menu` VALUES (76,'��������',68,6,'Channel/index',0,'','ϵͳ����',0,1);
INSERT INTO `onethink_menu` VALUES (77,'����',76,0,'Channel/add',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (78,'�༭',76,0,'Channel/edit',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (79,'ɾ��',76,0,'Channel/del',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (80,'�������',68,2,'Category/index',0,'','ϵͳ����',0,1);
INSERT INTO `onethink_menu` VALUES (81,'�༭',80,0,'Category/edit',0,'�༭�ͱ�����Ŀ����','',0,1);
INSERT INTO `onethink_menu` VALUES (82,'����',80,0,'Category/add',0,'������Ŀ����','',0,1);
INSERT INTO `onethink_menu` VALUES (83,'ɾ��',80,0,'Category/remove',0,'ɾ����Ŀ����','',0,1);
INSERT INTO `onethink_menu` VALUES (84,'�ƶ�',80,0,'Category/operate/type/move',0,'�ƶ���Ŀ����','',0,1);
INSERT INTO `onethink_menu` VALUES (85,'�ϲ�',80,0,'Category/operate/type/merge',0,'�ϲ���Ŀ����','',0,1);
INSERT INTO `onethink_menu` VALUES (86,'�������ݿ�',68,0,'Database/index?type=export',0,'','���ݱ���',0,1);
INSERT INTO `onethink_menu` VALUES (87,'����',86,0,'Database/export',0,'�������ݿ�','',0,1);
INSERT INTO `onethink_menu` VALUES (88,'�Ż���',86,0,'Database/optimize',0,'�Ż����ݱ�','',0,1);
INSERT INTO `onethink_menu` VALUES (89,'�޸���',86,0,'Database/repair',0,'�޸����ݱ�','',0,1);
INSERT INTO `onethink_menu` VALUES (90,'��ԭ���ݿ�',68,0,'Database/index?type=import',0,'','���ݱ���',0,1);
INSERT INTO `onethink_menu` VALUES (91,'�ָ�',90,0,'Database/import',0,'���ݿ�ָ�','',0,1);
INSERT INTO `onethink_menu` VALUES (92,'ɾ��',90,0,'Database/del',0,'ɾ�������ļ�','',0,1);
INSERT INTO `onethink_menu` VALUES (93,'����',0,5,'other',1,'','',0,1);
INSERT INTO `onethink_menu` VALUES (96,'����',75,0,'Menu/add',0,'','ϵͳ����',0,1);
INSERT INTO `onethink_menu` VALUES (98,'�༭',75,0,'Menu/edit',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (106,'��Ϊ��־',16,0,'Action/actionlog',0,'','��Ϊ����',0,1);
INSERT INTO `onethink_menu` VALUES (108,'�޸�����',16,0,'User/updatePassword',1,'','',0,1);
INSERT INTO `onethink_menu` VALUES (109,'�޸��ǳ�',16,0,'User/updateNickname',1,'','',0,1);
INSERT INTO `onethink_menu` VALUES (110,'�鿴��Ϊ��־',106,0,'action/edit',1,'','',0,1);
INSERT INTO `onethink_menu` VALUES (112,'��������',58,0,'think/add',1,'','',0,1);
INSERT INTO `onethink_menu` VALUES (113,'�༭����',58,0,'think/edit',1,'','',0,1);
INSERT INTO `onethink_menu` VALUES (114,'����',75,0,'Menu/import',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (115,'����',58,0,'Model/generate',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (116,'��������',57,0,'Addons/addHook',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (117,'�༭����',57,0,'Addons/edithook',0,'','',0,1);
INSERT INTO `onethink_menu` VALUES (118,'�ĵ�����',3,0,'Article/sort',1,'','',0,1);
INSERT INTO `onethink_menu` VALUES (119,'����',70,0,'Config/sort',1,'','',0,1);
INSERT INTO `onethink_menu` VALUES (120,'����',75,0,'Menu/sort',1,'','',0,1);
INSERT INTO `onethink_menu` VALUES (121,'����',76,0,'Channel/sort',1,'','',0,1);
INSERT INTO `onethink_menu` VALUES (122,'�����б�',58,0,'think/lists',1,'','',0,1);
INSERT INTO `onethink_menu` VALUES (123,'����б�',3,0,'Article/examine',1,'','',0,1);
INSERT INTO `onethink_menu` VALUES (124,'�Ѱ�װ����˵�����',44,0,'Addons/sort',1,'�Ѱ�װ����˵�����','',0,1);

#
# Source for table onethink_model
#

DROP TABLE IF EXISTS `onethink_model`;
CREATE TABLE `onethink_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ģ��ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT 'ģ�ͱ�ʶ',
  `title` char(30) NOT NULL DEFAULT '' COMMENT 'ģ������',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�̳е�ģ��',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '�̳��뱻�̳�ģ�͵Ĺ����ֶ�',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '�½���ʱ�Ƿ���Ҫ�����ֶ�',
  `field_sort` text COMMENT '���ֶ�����',
  `field_group` varchar(255) NOT NULL DEFAULT '1:����' COMMENT '�ֶη���',
  `attribute_list` text COMMENT '�����б�����ֶΣ�',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '���Ա�������',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '�б�ģ��',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '����ģ��',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '�༭ģ��',
  `list_grid` text COMMENT '�б���',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '�б����ݳ���',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT 'Ĭ�������ֶ�',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '�߼��������ֶ�',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '״̬',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '���ݿ�����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='�ĵ�ģ�ͱ�';

#
# Dumping data for table onethink_model
#

INSERT INTO `onethink_model` VALUES (1,'document','�����ĵ�',0,'',1,'{\"1\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]}','1:����','','','','','','id:���\r\ntitle:����:[EDIT]\r\ntype:����\r\nupdate_time:������\r\nstatus:״̬\r\nview:���\r\nid:����:[EDIT]|�༭,[DELETE]|ɾ��',0,'','',1383891233,1384507827,1,'MyISAM');
INSERT INTO `onethink_model` VALUES (2,'article','����',1,'',1,'{\"1\":[\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}','1:����,2:��չ','','','','','','',0,'','',1383891243,1422705220,1,'MyISAM');
INSERT INTO `onethink_model` VALUES (3,'download','����',1,'',1,'{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}','1:����,2:��չ','','','','','','',0,'','',1383891252,1387260449,1,'MyISAM');

#
# Source for table onethink_picture
#

DROP TABLE IF EXISTS `onethink_picture`;
CREATE TABLE `onethink_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '����id����',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '·��',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'ͼƬ����',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '�ļ�md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '�ļ� sha1����',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '״̬',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_picture
#


#
# Source for table onethink_schedule
#

DROP TABLE IF EXISTS `onethink_schedule`;
CREATE TABLE `onethink_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_to_run` varchar(255) NOT NULL COMMENT '�ƻ�����ִ�з���',
  `schedule_type` varchar(255) NOT NULL COMMENT 'ִ��Ƶ��',
  `modifier` varchar(255) DEFAULT NULL COMMENT 'ִ��Ƶ��,����ΪMONTHLYʱ���룻ONCEʱ��Ч������ʱΪ��ѡ��Ĭ��Ϊ1',
  `dirlist` varchar(255) DEFAULT NULL COMMENT 'ָ���ܻ��µ�һ�����졣ֻ��WEEKLY��MONTHLY��ͬʹ��ʱ��Ч������ʱ���ԡ�',
  `month` varchar(255) DEFAULT NULL COMMENT 'ָ��һ���е�һ���»�����.ֻ��schedule_type=MONTHLYʱ��Ч������ʱ���ԡ���modifier=LASTDAYʱ���룬����ʱ��ѡ����Чֵ��Jan - Dec��Ĭ��Ϊ*(ÿ����)',
  `start_datetime` datetime NOT NULL COMMENT '��ʼʱ��',
  `end_datetime` datetime DEFAULT NULL COMMENT '����ʱ��',
  `last_run_time` datetime DEFAULT NULL COMMENT '���ִ��ʱ��',
  `info` varchar(255) DEFAULT NULL COMMENT '�Լƻ�����ļ�Ҫ����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_schedule
#


#
# Source for table onethink_sensitive
#

DROP TABLE IF EXISTS `onethink_sensitive`;
CREATE TABLE `onethink_sensitive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_sensitive
#

INSERT INTO `onethink_sensitive` VALUES (1,'������',1,1423663669);
INSERT INTO `onethink_sensitive` VALUES (2,'������',1,1423663710);
INSERT INTO `onethink_sensitive` VALUES (3,'��������',1,1423663710);
INSERT INTO `onethink_sensitive` VALUES (4,'������',1,1423663710);
INSERT INTO `onethink_sensitive` VALUES (5,'������',1,1423895656);

#
# Source for table onethink_sync_login
#

DROP TABLE IF EXISTS `onethink_sync_login`;
CREATE TABLE `onethink_sync_login` (
  `uid` int(11) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_sync_login
#


#
# Source for table onethink_ucenter_admin
#

DROP TABLE IF EXISTS `onethink_ucenter_admin`;
CREATE TABLE `onethink_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '����ԱID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����Ա�û�ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '����Ա״̬',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='����Ա��';

#
# Dumping data for table onethink_ucenter_admin
#


#
# Source for table onethink_ucenter_app
#

DROP TABLE IF EXISTS `onethink_ucenter_app`;
CREATE TABLE `onethink_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Ӧ��ID',
  `title` varchar(30) NOT NULL COMMENT 'Ӧ������',
  `url` varchar(100) NOT NULL COMMENT 'Ӧ��URL',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT 'Ӧ��IP',
  `auth_key` varchar(100) NOT NULL DEFAULT '' COMMENT '����KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'ͬ����½',
  `allow_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '������ʵ�IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Ӧ��״̬',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Ӧ�ñ�';

#
# Dumping data for table onethink_ucenter_app
#


#
# Source for table onethink_ucenter_member
#

DROP TABLE IF EXISTS `onethink_ucenter_member`;
CREATE TABLE `onethink_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '�û�ID',
  `username` char(16) NOT NULL COMMENT '�û���',
  `password` char(32) NOT NULL COMMENT '����',
  `email` char(32) NOT NULL COMMENT '�û�����',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '�û��ֻ�',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ע��ʱ��',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT 'ע��IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����¼ʱ��',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '����¼IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `status` tinyint(4) DEFAULT '0' COMMENT '�û�״̬',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='�û���';

#
# Dumping data for table onethink_ucenter_member
#

INSERT INTO `onethink_ucenter_member` VALUES (1,'admin','ecfb4272feb1d1fd11fc719c45b5e21d','836692464@qq.com','',1422599239,2130706433,1423891748,2130706433,1422599239,1);
INSERT INTO `onethink_ucenter_member` VALUES (2,'xjq','bbe81237a2de1471f322ae25b0132dfc','app880@foxmail.com','',1422698522,2130706433,1422699744,2130706433,1422698522,1);
INSERT INTO `onethink_ucenter_member` VALUES (3,'geniusxjq','bbe81237a2de1471f322ae25b0132dfc','geniusxjq@126.com','',1422699641,2130706433,1423761472,2130706433,1422699641,1);

#
# Source for table onethink_ucenter_setting
#

DROP TABLE IF EXISTS `onethink_ucenter_setting`;
CREATE TABLE `onethink_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '�������ͣ�1-�û����ã�',
  `value` text NOT NULL COMMENT '��������',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='���ñ�';

#
# Dumping data for table onethink_ucenter_setting
#


#
# Source for table onethink_url
#

DROP TABLE IF EXISTS `onethink_url`;
CREATE TABLE `onethink_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '����Ψһ��ʶ',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '���ӵ�ַ',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '����ַ',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '״̬',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='���ӱ�';

#
# Dumping data for table onethink_url
#


#
# Source for table onethink_userdata
#

DROP TABLE IF EXISTS `onethink_userdata`;
CREATE TABLE `onethink_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '�û�id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '���ͱ�ʶ',
  `target_id` int(10) unsigned NOT NULL COMMENT 'Ŀ��id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_userdata
#


#
# Source for table onethink_wechat_message
#

DROP TABLE IF EXISTS `onethink_wechat_message`;
CREATE TABLE `onethink_wechat_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '���',
  `msgid` int(64) unsigned NOT NULL COMMENT '��ϢID',
  `type` varchar(100) NOT NULL COMMENT '��Ϣ����',
  `content` text NOT NULL COMMENT '��Ϣ����',
  `user` varchar(250) NOT NULL COMMENT '�û���&��ʶ',
  `time` int(10) unsigned NOT NULL COMMENT '����ʱ��',
  `is_reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�ظ�',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table onethink_wechat_message
#


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
