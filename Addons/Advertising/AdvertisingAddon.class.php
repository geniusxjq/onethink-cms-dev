<?php

namespace Addons\Advertising;
use Common\Controller\Addon;

/**
 * 广告插件
 * @author quick
 */

class AdvertisingAddon extends Addon{

        public $info = array(
            'name'=>'Advertising',
            'title'=>'广告管理',
            'description'=>'广告位插件，为网站增加广告管理功能。',
            'status'=>1,
            'author'=>'geniusxjq',
			'url'=>'http://www.app880.com',
            'version'=>'2.0'
        );
                
        /**
         * 配置列表页面
         * @var unknown_type
         */
        public $admin_list = array(
        		'listKey' => array(
        				'title'=>'广告位名称',
        				'typetext'=>'广告位类型',
        				'width'=>'广告位宽度',
        				'height'=>'广告位高度',
        				'statustext'=>'位置状态',
        		),
        		'model'=>'Advertising',
        		'order'=>'id asc'
        );
        public $custom_adminlist = 'adminlist.html';
		
		public $addon_install_info = array(
										   
			'hooks'=>"Advertising:1:调用广告位广告的钩子",
										   										   						
			'install_sql'=>"DROP TABLE IF EXISTS `onethink_advertising`;
			CREATE TABLE IF NOT EXISTS `onethink_advertising` (
			`id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
			`title` char(80) NOT NULL DEFAULT '' COMMENT '广告位置名称',
			`type` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '广告位置类型',
			`same_limit` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '广告位同时展示的广告数量限制  1为默认展示一张',
			`idle_content` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT  '广告位闲置时默认显示的广告内容',
			`width` char(20) NOT NULL DEFAULT '' COMMENT '广告位置宽度',
			`height` char(20) NOT NULL DEFAULT '' COMMENT '广告位置高度',
			`status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
			PRIMARY KEY (`id`)
			) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告位置表';
			DROP TABLE IF EXISTS `onethink_advertisement`;
			CREATE TABLE IF NOT EXISTS `onethink_advertisement` (
			`id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
			`title` char(80) NOT NULL DEFAULT '' COMMENT '广告名称',
			`position` int(11) NOT NULL COMMENT '广告位置',
			`advspic` int(11) NOT NULL COMMENT '图片地址(ID)',
			`advstext` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT  '文字广告内容',
			`advshtml` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT  '代码广告内容',
			`link` char(140) NOT NULL DEFAULT '' COMMENT '链接地址',
			`level` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
			`status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
			`create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
			`end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
			PRIMARY KEY (`id`)
			) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告表';",
			  
			'uninstall_sql'=>"DROP TABLE IF EXISTS `onethink_advertising`;
			DROP TABLE IF EXISTS `onethink_advertisement`;",
        );

        public function install(){
			
            return $this->installAddon($this->addon_install_info);
			
        }
		
        public function uninstall(){
			
            return $this->uninstallAddon($this->addon_install_info);
			
        }
		
		//实现的广告钩子
        public function Advertising($param){
			
			if(!$param)return ;
        	$data=D('Addons://Advertising/Advertising')->getAdvertising($param);
			if(!$data)return ;
			$this->assign('data',$data);
			$this->display('widget');
			
        }              

}