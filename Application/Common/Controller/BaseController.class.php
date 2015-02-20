<?php

namespace Common\Controller;
use Think\Controller;

class BaseController extends Controller {
	
	public function _initialize(){
		
        /* 读取数据库中的配置 */
        $config =   S('DB_CONFIG_DATA');
        if(!$config){
            $config =   api('Config/lists');
            S('DB_CONFIG_DATA',$config);
        }
        C($config); //添加配置
		
	}
		
}