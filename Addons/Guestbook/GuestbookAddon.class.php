<?php

namespace Addons\Guestbook;
use Common\Controller\Addon;
use Think\Model;
/**
 * 留言板插件
 * @author 马剑威
 */

    class GuestbookAddon extends Addon{

        public $info = array(
            'name'=>'Guestbook',
            'title'=>'留言板',
            'description'=>'这是一个简单的留言板',
            'status'=>1,
            'author'=>'geniusxjq(ap880.com)',
			'url'=>'http://app880.com',
            'version'=>'0.2',
        );

        public $admin_list = array(
            'model'=>'Guestbook',		//要查的表
			'fields'=>'',			//要查的字段
			'map'=>'',				//查询条件, 如果需要可以再插件类的构造方法里动态重置这个属性
			'order'=>'id desc',		//排序,
			'list_grid'=>array( 		//这里定义的是除了id序号外的表格里字段显示的表头名和模型一样支持函数和链接
                'nickname:昵称',
                'contact:联系方式',
                'content:留言内容',
                'r_content:回复内容',
                'starttime|time_format:留言时间',
                'is_reply:是否回复',
                'is_pass:是否通过',
                'id:操作:[EDIT]|编辑,[DELETE]|删除'
            ),
        );
		
		public $addon_install_info = array(
										   
			'hooks'=>'GuestbookDisplay',
						
			'install_sql'=>"DROP TABLE IF EXISTS `onethink_guestbook`;
			CREATE TABLE IF NOT EXISTS `onethink_guestbook` (
			  `id` int(11) NOT NULL AUTO_INCREMENT,
			  `nickname` varchar(224) NOT NULL COMMENT '留言昵称',
			  `contact` varchar(225) NOT NULL COMMENT '留言者联系方式',
			  `content` varchar(225) NOT NULL COMMENT '留言内容',
			  `starttime` int(10) NOT NULL COMMENT '留言时间',
			  `is_reply` int(11) NOT NULL COMMENT '是否回复',
			  `is_pass` int(11) NOT NULL COMMENT '是否通过',
			  `r_content` varchar(225) NOT NULL COMMENT '回复内容',
			  PRIMARY KEY (`id`)
			) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='留言板表';",
			
			'uninstall_sql'=>"DROP TABLE IF EXISTS `onethink_guestbook;"
        );

        public function install(){
			
            return $this->addon_install($this->addon_install_info);
			
        }
		
        public function uninstall(){
			
            return $this->addon_uninstall($this->addon_install_info);
			
        }

        public function GuestbookDisplay($param)
        {
            $config = $this->getConfig();
			
			$map=array();
			
			if($config['messages_check']==1) $map['is_pass']='1';
			
            $listdb = M('Guestbook')->where($map)->order('id DESC')->select();
			
            $this->assign('addons_config',$config);
            $this->assign('listdb',$listdb);
            if($config['display']==1)
                $this->display('widget');
        }

    }