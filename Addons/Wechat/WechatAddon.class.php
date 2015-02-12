<?php

namespace Addons\Wechat;
use Common\Controller\Addon;

/**
 * 微信插件
 * @author huay1
 */
 
 
class WechatAddon extends Addon{

	public $info = array(
		'name'=>'Wechat',
		'title'=>'微信',
		'description'=>'微信插件',
		'status'=>1,
		'author'=>'huay1',
		'version'=>'1.0'
	);
	
	public $addon_install_info = array(
									   					
		'install_sql'=>"DROP TABLE IF EXISTS `onethink_wechat_message`;
		  CREATE TABLE `onethink_wechat_message` (
			`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
			`msgid` int(64) unsigned NOT NULL COMMENT '信息ID',
			`type` varchar(100) NOT NULL COMMENT '信息类型',
			`content` text NOT NULL COMMENT '信息内容',
			`user` varchar(250) NOT NULL COMMENT '用户名&标识',
			`time` int(10) unsigned NOT NULL COMMENT '接收时间',
			`is_reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否回复',
			PRIMARY KEY (`id`)
		  )  ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信插件的消息表';",
		  
		'uninstall_sql'=>"DROP TABLE IF EXISTS `onethink_wechat_message`;"
	);

	public $custom_config = 'wechat_config.html';

	public $admin_list = array(
		'model'=>'Wechat',		//模型Model
		'fields'=>'',			//要查的字段
		'map'=>'',				//查询条件, 如果需要可以再插件类的构造方法里动态重置这个属性
		'order'=>'id desc',		//排序,
		'list_grid' => array(
			'user:用户名&标识',
			'msgid:信息ID',
			'type:信息类型',
			'content:信息内容',
			'time:接收时间'
		),
	);
	 
	//缓存变量 - 用于更新配置时清空微信缓存
	public $saveconfig_cache_list = array('WECHATADDONS_MENU','WECHATADDONS_TOKEN','WECHATADDONS_GROUPS');

	public function install(){
		
		//清空缓存
		S('WECHATADDONS_CONF',null);
		if(is_array($this->saveconfig_cache_list)){
			foreach ($this->saveconfig_cache_list as $_v) {
				S($_v,null);
			}
		}else{
			S($this->saveconfig_cache_list,null);
		}
		
		//添加钩子
		$WechatHooksList = array(array(
			'name' => 'WechatAdminLogin',
			'description' => '后台登陆页面钩子，用于微信二维码登陆',
			'type' => 1,
		),array(
			'name' => 'WechatIndexLogin',
			'description' => '前台登陆页面钩子，用于微信二维码登陆',
			'type' => 1,
		));
		
		foreach($WechatHooksList as $arr){
		
			$this->addHook($arr['name'],$arr['description'],$arr['type']);
		
		}

		if(!$this->installAddon($this->addon_install_info)){
			
			$this->uninstall();
			
			return false;
			
		}
		
		return true;
	}

	public function uninstall(){
				
		//清空缓存
		S('WECHATADDONS_CONF',null);
		if(is_array($this->saveconfig_cache_list)){
			foreach ($this->saveconfig_cache_list as $_v) {
				S($_v,null);
			}
		}else{
			S($this->saveconfig_cache_list,null);
		}
		
		//删除的钩子
		$WechatHooksList =array('hooks'=>'WechatAdminLogin,WechatIndexLogin');
				
		return $this->uninstallAddon(array_merge($this->addon_install_info,$WechatHooksList));
		
	}

	//实现的WechatAdminLogin钩子方法
	public function WechatAdminLogin($param){
		$this->assign('addons_Wechatconfig', $this->getConfig());
		$this->display(T('Addons://Wechat@Admin/login'));
	}
	//实现的WechatIndexLogin钩子方法
	public function WechatIndexLogin($param){
		print_r($this->getConfig());
		$this->assign('addons_Wechatconfig', $this->getConfig());
		$this->display(T('Addons://Wechat@Home/login'));
	}
}