<?php
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.ap880.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: geniusxjq <app880.com>
// +----------------------------------------------------------------------
namespace Ucenter\Controller;

/*
用户信息配置
*/

class ConfigController extends UcenterController {
	
	public function _initialize(){
		
		parent::_initialize();
		
	}
	
    public function index(){
      
	  
	  
    }
	
	public function avatar(){
		
		hook("UploadAvatar");
		
	}
	
}