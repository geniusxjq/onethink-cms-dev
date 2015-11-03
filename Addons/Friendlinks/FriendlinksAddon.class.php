<?php
namespace Addons\Friendlinks;
use Common\Controller\Addon;

/**
 * 合作单位插件
 * @author 苏南
 */

    class FriendlinksAddon extends Addon{
		
        public $info = array(
            'name'=>'Friendlinks',
            'title'=>'友情链接',
            'description'=>'友情链接',
            'status'=>1,
            'author'=>'geniusxjq(app880.com)',
			'url'=>'http://app880.com',
            'version'=>'0.1',
        );
		
		public $addon_install_info = array(
										   
			'hooks'=>'Friendlinks:1:调用（显示）友情链接的钩子',
						
			'install_sql'=>"DROP TABLE IF EXISTS `onethink_friendlinks`;
			  CREATE TABLE IF NOT EXISTS `onethink_friendlinks` (
				`id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
				`type` int(1) NOT NULL DEFAULT '1' COMMENT '类别（1：图片，2：普通）',
				`title` char(80) NOT NULL DEFAULT '' COMMENT '站点名称',
				`cover_id` int(10) NOT NULL COMMENT '图片ID',
				`link` char(140) NOT NULL DEFAULT '' COMMENT '链接地址',
				`level` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
				`status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
				`create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
				PRIMARY KEY (`id`)
			  ) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='友情连接表';",
			  
			'uninstall_sql'=>"DROP TABLE IF EXISTS `onethink_friendlinks`;"
        );
				
        public $admin_list = array(
            'listKey' => array(
        				'title'=>'站点名称',
        				'typetext'=>'类型',
        				'statustext'=>'显示状态',
        				'level'=>'优先级',
        				'create_time'=>'开始时间',
        		),
        		'model'=>'Friendlinks',
        		'order'=>'level desc,id asc',
				
        );
		
        public $custom_adminlist = 'adminlist.html';
		
        public function install(){
			
            return $this->installAddon($this->addon_install_info);
			
        }
		
        public function uninstall(){
			
            return $this->uninstallAddon($this->addon_install_info);
			
        }

        //实现的pageFooter钩子方法
        public function Friendlinks($param){
        	
			$conf=$this->getConfig();
			
			if(!$conf['is_open']) return;//插件已关闭
			
			$list = D('Addons://Friendlinks/Friendlinks')->linkList();
			$this->assign('list',$list);
			$this->assign('link',$param);
			$this->display('widget');
					
        }
		
    }
	