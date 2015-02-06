<?php

namespace Addons\Guestbook\Model;
use Think\Model;

/**
 * Friendlink模型
 */
class GuestbookModel extends Model{
    
    protected $_auto = array(
        array('uid', 'session', self::MODEL_INSERT, 'function', 'user_auth.uid'),
        array('end_time', 'strtotime', self::MODEL_BOTH, 'function'),
        array('update_time', NOW_TIME, self::MODEL_BOTH),
        array('status', 1, self::MODEL_BOTH),
    );
	
	protected function _after_find(&$result,$options) {
		$result['is_reply'] =  $result['is_reply'] == 0 ? '不回复' : '回复'; 
		$result['is_pass'] =  $result['is_pass'] == 0 ? '不通过' : '通过';

	}
	
	protected function _after_select(&$result,$options){
		foreach($result as &$record){
			$this->_after_find($record,$options);
		}
	}
    
    public $model = array(
        'title'=>'留言',//新增[title]、编辑[title]、删除[title]的提示
        'template_add'=>'',//自定义新增模板自定义html edit.html 会读取插件根目录的模板
        'template_edit'=>'',//自定义编辑模板html
        'search_key'=>'',// 搜索的字段名，默认是title
        'extend'=>1,
    );

    public $_fields = array(
        'id'=>array(
            'name'=>'id',//字段名
            'title'=>'ID',//显示标题
            'type'=>'num',//字段类型
            'remark'=>'',// 备注，相当于配置里的tip
            'is_show'=>3,// 1-始终显示 2-新增显示 3-编辑显示 0-不显示
            'value'=>0,//默认值
        ),
        'is_pass'=>array(
            'name'=>'is_pass',
            'title'=>'是否通过',
            'type'=>'radio',
            'extra'=>'0:不通过,1:通过',
            'is_show'=>3,
            'value'=>0,
        ),
        'is_reply'=>array(
            'name'=>'is_reply',
            'title'=>'是否回复',
            'type'=>'radio',
            'extra'=>'0:不回复,1:回复',
            'is_show'=>3,
            'value'=>0,
        ), 
        'r_content'=>array(
            'name'=>'r_content',
            'title'=>'回复内容',
            'type'=>'textarea',
            'is_show'=>3,
        ),
    );
}
