<?php

// +----------------------------------------------------------------------
// | Author: genisuxjq <app880@foxmail.com> <http://www.app880.com>
// +----------------------------------------------------------------------

/*
*获取用户ID
*@return integer 0-未登录，大于0-当前登录用户ID
*@author genisuxjq <app880.com>
*/

function get_uid(){
    return is_login();
}

/**
 * 获取用户头像图片路径
 *
 * @param int $uid 用户id
 * @return array 
 * @author genisuxjq <app880.com>
 */
 
function get_avatar($uid){
	
	return (new \Ucenter\Api\UcenterApi())->get_avatar($uid);// return url
	
}

/*
*检测用户权限
* @param string  $rule    检测的规则
* @param string  $mode    check模式
* @return boolean
*@author genisuxjq <app880.com>
*/

function check_auth($rule, $type = AuthRuleModel::RULE_URL ){
	
    if (is_administrator()) return true;//管理员允许访问任何页面 
	
    $Auth = null;
	
    if (!$Auth) $Auth = new \Think\Auth();
	
    if (!$Auth->check($rule, is_login(),$type)){
		
        return false;
		
    }
	
    return true;
	
}