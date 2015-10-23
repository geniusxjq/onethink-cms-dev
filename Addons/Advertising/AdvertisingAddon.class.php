<?php

namespace Addons\Advertising;
use Common\Controller\Addon;
use Think\Db;
/**
 * 广告插件
 * @author quick
 */

    class AdvertisingAddon extends Addon{

        public $info = array(
            'name'=>'Advertising',
            'title'=>'广告位置',
            'description'=>'广告位插件',
            'status'=>1,
            'author'=>'onep2p',
            'version'=>'0.1'
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
										   										   						
			'install_sql'=>"DROP TABLE IF EXISTS `onethink_advertising`;
			CREATE TABLE IF NOT EXISTS `onethink_advertising` (
			`id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
			`title` char(80) NOT NULL DEFAULT '' COMMENT '广告位置名称',
			`type` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '广告位置展示方式  0为默认展示一张',
			`width` char(20) NOT NULL DEFAULT '' COMMENT '广告位置宽度',
			`height` char(20) NOT NULL DEFAULT '' COMMENT '广告位置高度',
			`status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
			PRIMARY KEY (`id`)
			) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告位置表';",
			  
			'uninstall_sql'=>"DROP TABLE IF EXISTS `onethink_advertising`;",
        );

        public function install(){
			
            return $this->installAddon($this->addon_install_info);
			
        }
		
        public function uninstall(){
			
            return $this->uninstallAddon($this->addon_install_info);
			
        }

}