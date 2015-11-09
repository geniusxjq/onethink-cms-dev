<?php
/**
 * @Description: 投票插件钩子实现
 * @author Microrain  xinjy@qq.com
 * @date 14-3-9
 * @version V0.1
 */
namespace Addons\Vote;

use Common\Controller\Addon;

class VoteAddon extends Addon
{
	
	public $info = array(
		'name' => 'Vote',
		'title' => '微投票',
		'description' => '支持单选、多选的小投票插件。可以用来收集用户对某几个选项的意见。',
		'status' => 1,
		'author' => 'Microrain',
		'version' => '1.0'
	);
	
	public $addon_install_info = array(
									   
		'hooks'=>'Vote:1:调用（显示）投票插件的钩子',
					
		'install_sql'=>"DROP TABLE IF EXISTS `onethink_vote`;
		  CREATE TABLE IF NOT EXISTS `onethink_vote` (
		  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
		  `title` char(80) NOT NULL COMMENT '标题',
		  `description` text COMMENT '描述',
		  `options` text NOT NULL COMMENT '添加各种投票选项',
		  `explanation` varchar(256) DEFAULT NULL COMMENT '备注',
		  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
		  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
		  `voteconfig` char(1) NOT NULL DEFAULT '1',
		  PRIMARY KEY (`id`)
		) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;",
		  
		'uninstall_sql'=>"DROP TABLE IF EXISTS `onethink_vote`;"
	);

	public $admin_list = array(
		'model' => 'vote', //要查的表
		'fields' => '*', //要查的字段
		'map' => '', //查询条件, 如果需要可以再插件类的构造方法里动态重置这个属性
		'order' => 'id desc', //排序,
		'list_grid' => array( //这里定义的是除了id序号外的表格里字段显示的表头名和模型一样支持函数和链接
			'title:标题:[EDIT]',
			'description:说明',
			'voteconfig_text:类型',
			'create_time|time_format:创建时间',
			'id:操作:[EDIT]|编辑,[DELETE]|删除'
		),
	);

	public function install(){
		
		return $this->installAddon($this->addon_install_info);
		
	}
	
	public function uninstall(){
		
		return $this->uninstallAddon($this->addon_install_info);
		
	}

	/**
	 * @param $param
	 *在前台页面加入 {:hook('Vote')}
	 */
	public function Vote($id)
	{
		//获取插件的配置信息
		$config = $this->getConfig();
		
		if($id){
			
			$list = M('vote')->where('id='.$id)->find();
			
		}else{
		
			if($config['defaultid']==0){
				$list = M('vote')->order('id desc')->find();
	
			} else {
				$list = M('vote')->where('id='.$config["defaultid"])->find();
			}
		
		}
		
		if(!$list) return false;

		$options = $list["options"];
		$options = json_decode($options, true);
		$this->assign("id",$list['id']);
		$this->assign("title", $list["title"]);
		$this->assign("voteconfig", $list['voteconfig']);
		$this->assign("options", $options);


		$this->assign('addons_config', $config);
		if($config['display'])
			$this->display('View/Default/viewvote');
	}

}