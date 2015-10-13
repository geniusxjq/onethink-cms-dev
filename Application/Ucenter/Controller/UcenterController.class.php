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
	
	/* 不用登录即可访问的公共控制器 */
    protected $PUBLIC_CONTROLLER = array( 'Index','Passport');
	
	/* 空操作，用于输出404页面 */
	public function _empty(){
		$this->redirect('Index/index');
	}
	
	public function _initialize(){
		
		$allow=$this->PUBLIC_CONTROLLER;
		if ($allow&&in_array_case(CONTROLLER_NAME,$allow) ) {
			parent::_initialize();
            return false;
        }
		// 获取当前用户ID
        if(defined('UID')) return ;
        define('UID',is_login());
		if(!UID){
			$this->error('您还没有登录，请先登录！',U('Passport/login'));
		}
		parent::_initialize();
		
	}
}