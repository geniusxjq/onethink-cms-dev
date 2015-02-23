<?php

/**
 * @author genisuxjq <app880.com>
 **/
namespace Addons\Comment;
use Common\Controller\Addon;

/**
 * 评论功能插件
 * @author Wolixli
 */

    class CommentAddon extends Addon{

        public $info = array(
            'name'=>'Comment',
            'title'=>'评论功能',
            'description'=>'用于各种类型文档评论',
            'status'=>1,
            'author'=>'Wolixli',
            'version'=>'0.1'
        );
		
		public $addon_install_info = array(
										   						
			'install_sql'=>"DROP TABLE IF EXISTS `onethink_comment`;
			CREATE TABLE `onethink_comment` (
			`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
			`pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '被回复评论的ID',
			`model_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '是哪个文档模型的',
			`cid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '内容id,name和cid来定位是哪个内容的',
			`comment` text COMMENT '评论内容',
			`digg` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '赞数（顶）',
			`com_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '评论IP',
			`create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
			`status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被删除',
			`uid` int(10) unsigned DEFAULT NULL COMMENT '是哪位回复的,0为非网站用户',
			`uname` varchar(200) DEFAULT NULL COMMENT '非网站用户使用的名称',
			`uemail` varchar(200) DEFAULT NULL COMMENT '非网站用户使用的邮箱',
			`uurl` varchar(200) DEFAULT NULL COMMENT '非网站用户使用网站地址',
			PRIMARY KEY (`id`),
			KEY `uid` (`uid`),
			KEY `model_id` (`model_id`),
			KEY `cid` (`cid`)
			)  ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论功能表';
			",
			  
			'uninstall_sql'=>"DROP TABLE IF EXISTS `onethink_comment`;"
        );

        public $admin_list = array(
			'list_grid'=>array( 		//这里定义的是除了id序号外的表格里字段显示的表头名和模型一样支持函数和链接
               'uid:登录用户ID',
				'uname:用户名',
				'uemail:用户邮箱',
				'comment:内容',
				'create_time_text:时间',
				'ip:IP',
                'id:操作:[EDIT]|编辑,[DELETE]|删除'
            ),
			'fields'=>'*',			//要查的字段
			'map'=>'',				//查询条件, 如果需要可以再插件类的构造方法里动态重置这个属性
            'model'=>'Comment',		//要查的表
			'order'=>'id desc',		//排序,
			
        );

        public function install(){
			
            return $this->installAddon($this->addon_install_info);
			
        }
		
        public function uninstall(){
			
            return $this->uninstallAddon($this->addon_install_info);
			
        }

        //实现的documentDetailAfter钩子方法
        public function documentDetailAfter($info = array()){
			
			if(empty($info) || empty($info['id']) ||  empty($info['model_id'])){ //数据不正确
				return ;
			}

			/* 获取当评论 */
			$commenDao = D('Addons://Comment/Comment');
			$map = array('model_id' => $info['model_id'],'cid' => $info['id'], 'status' => 1);
			$allcomments = $commenDao->where($map)->order('create_time DESC, id DESC')->select();
			$comments = list_to_tree($allcomments, 'id', 'pid', 'reply', 0);
			$comments_number = $commenDao->where($map)->order('create_time DESC, id DESC')->count();
			$this->assign('comments',   $comments);
			$this->assign('comments_number',   $comments_number);
			$this->display(T('Addons://Comment@Content/comment'));
			
        }

    }