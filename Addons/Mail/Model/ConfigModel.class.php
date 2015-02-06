<?php

namespace Addons\Mail\Model;
use Think\Model;

/**
 * Friendlink模型
 */
class ConfigModel extends Model{
	
    public $model = array(
        'title'=>'留言',//新增[title]、编辑[title]、删除[title]的提示
        'template_add'=>'',//自定义新增模板自定义html edit.html 会读取插件根目录的模板
        'template_edit'=>'',//自定义编辑模板html
        'search_key'=>0,// 搜索的字段名，默认是title
        'extend'=>0,
    );

}
