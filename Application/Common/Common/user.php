<?php

// +----------------------------------------------------------------------
// | Author: genisuxjq <app880@foxmail.com> <http://www.app880.com>
// +----------------------------------------------------------------------

/**
 * 获取用户头像
 *
 * @param int $uid 用户id
 * @return array 
 */
 
function get_avatar($uid) {
	
	return (new \Ucenter\Api\UcenterApi())->get_avatar($uid);
	
}
