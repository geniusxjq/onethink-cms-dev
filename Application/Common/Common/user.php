<?php

// +----------------------------------------------------------------------
// | Author: genisuxjq <app880@foxmail.com> <http://www.app880.com>
// +----------------------------------------------------------------------
/**
 * 检测用户是否登录
 * @return integer 0-未登录，大于0-当前登录用户ID
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function is_login(){
    $user = session('user_auth');
    if (empty($user)) {
        return 0;
    } else {
        return session('user_auth_sign') == data_auth_sign($user) ? $user['uid'] : 0;
    }
}

/**
 * 检测当前用户是否为管理员
 * @return boolean true-管理员，false-非管理员
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function is_administrator($uid = null){
    $uid = is_null($uid) ? is_login() : $uid;
    return $uid && (intval($uid) === C('USER_ADMINISTRATOR'));
}

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
	return D('Ucenter/Avatar')->getAvatar($uid);// return url
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

/**
 * 显示验证码
 * @return void
 */
function verify_code($id) {
	$Verify = new \Think\Verify();
	return $Verify->entry($id);
}
