<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Ucenter\Api;

class UcenterApi{

	public function get_avatar($uid) {
		
		$_path=C('TMPL_PARSE_STRING.__IMG__').'/default_avatar.png';
		
		if(!$uid) return array('path'=>$_path);
		
		$data=D('Avatar')->getAvatar($uid);
		
		if(!$data) $data['path']=$_path;
		
		return $data;
		
	}

}
