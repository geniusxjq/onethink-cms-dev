<?php

namespace Addons\Wechat\Model;
use Think\Model;

/**
 * Friendlink模型
 */
 
class WechatModel extends Model{
	
	protected $tableName='wechat_message';
    
	public $model = array(
        'title'=>'微信',//新增[title]、编辑[title]、删除[title]的提示
        'template_add'=>'',//自定义新增模板自定义html edit.html 会读取插件根目录的模板
        'template_edit'=>'',//自定义编辑模板html
        'search_key'=>'',// 搜索的字段名，默认是title
        'extend'=>1,
    );

}
