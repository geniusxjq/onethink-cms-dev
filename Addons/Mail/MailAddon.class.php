<?php

namespace Addons\Mail;

use Common\Controller\Addon;
use Think\Db;

/**
 * 邮件订阅插件
 * @author quick
 */
 
class MailAddon extends Addon
{

    public $info = array(
        'name' => 'Mail',
        'title' => '邮件订阅',
        'description' => '邮件订阅插件',
        'status' => 1,
        'author' => 'geniusxjq(app880.com)',
		'url'=>'http://app880.com',
        'version' => '0.1'
    );

    /**
     * 配置列表页面
     * @var unknown_type
     */
    public $admin_list = array(
        'model' => 'Config',
       'fields'=>"MAIL_TYPE,MAIL_SMTP_HOST,MAIL_SMTP_PORT,MAIL_SMTP_USER,MAIL_SMTP_PASS,MAIL_SMTP_CE,MAIL_REPLY_EMAIL,MAIL_REPLY_NAME",			//要查的字段
		'map' => array('name' => array('in', array(0 => 'MAIL_TYPE', 1 => 'MAIL_SMTP_HOST', 2 => 'MAIL_SMTP_PORT', 3 => 'MAIL_SMTP_USER', 4 => 'MAIL_SMTP_PASS', 5 => 'MAIL_SMTP_CE', 6 => 'MAIL_REPLY_EMAIL',7=>'MAIL_REPLY_NAME'))),				//查询条件, 如果需要可以再插件类的构造方法里动态重置这个属性
		'order'=>'sort asc',		//排序,
    );
    public $custom_adminlist = 'adminlist.html';

	public $addon_install_info=array(
										 
		'install_sql'=>"DROP TABLE IF EXISTS onethink_mail_history;
		CREATE TABLE IF NOT EXISTS `onethink_mail_history` (
		  `id` int(11) NOT NULL AUTO_INCREMENT,
		  `title` varchar(255) NOT NULL,
		  `body` text NOT NULL,
		  `create_time` int(11) NOT NULL,
		  `from` varchar(255) NOT NULL,
		  `status` tinyint(4) NOT NULL,
		  PRIMARY KEY (`id`)
		) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
		DROP TABLE IF EXISTS onethink_history_link;
		CREATE TABLE IF NOT EXISTS `onethink_mail_history_link` (
		`id` int(11) NOT NULL AUTO_INCREMENT,
		`mail_id` int(11) NOT NULL,
		`to` varchar(255) NOT NULL,
		`status` tinyint(4) NOT NULL,
		PRIMARY KEY (`id`)
		) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
		DROP TABLE IF EXISTS onethink_mail_list;
		CREATE TABLE IF NOT EXISTS `onethink_mail_list` (
		`id` int(11) NOT NULL AUTO_INCREMENT,
		`address` varchar(255) NOT NULL,
		`status` tinyint(4) NOT NULL,
		`create_time` int(11) NOT NULL,
		PRIMARY KEY (`id`)
		) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
		DROP TABLE IF EXISTS onethink_mail_token;
		CREATE TABLE IF NOT EXISTS `onethink_mail_token` (
		`id` int(11) NOT NULL AUTO_INCREMENT,
		`email` varchar(50) NOT NULL,
		`token` varchar(20) NOT NULL,
		PRIMARY KEY (`id`)
		) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
		",

		'uninstall_sql'=>"DROP TABLE IF EXISTS onethink_mail_history;
		DROP TABLE IF EXISTS onethink_mail_history_link;
		DROP TABLE IF EXISTS onethink_mail_list;
		DROP TABLE IF EXISTS onethink_mail_token;"
  
									 
	);

	public function install(){
		return $this->installAddon($this->addon_install_info);
	}

	public function uninstall(){
		return $this->uninstallAddon($this->addon_install_info);
	}

    //实现的钩子
    public function AdminIndex($param)
    {

    }


    public function pageFooter(){
        $this->display('subscribe');
    }
}