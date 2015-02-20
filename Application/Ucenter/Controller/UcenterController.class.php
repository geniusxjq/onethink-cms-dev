<?php
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.ap880.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: geniusxjq <app880.com>
// +----------------------------------------------------------------------
namespace Ucenter\Controller;

use Common\Controller\BaseController;

/**
 * 用户中心基类控制器
 * 继承此类的控制器必须登录后才能访问
 */

class UcenterController extends BaseController {
	
	public function _initialize(){
		
		// 获取当前用户ID
		
        if(defined('UID')) return ;
		
        define('UID',is_login());
		
		if(!UID){
			
			$this->redirect('Member/login');
			
		}
		
		parent::_initialize();
				
	}
	
    public function index(){}
	
}