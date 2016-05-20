<?php

namespace Addons\Atlas;
use Common\Controller\Addon;

/**
 * 图片批量上传插件
 * @author 原作者:tjr&jj
 * @author 木梁大囧
 */

    class AtlasAddon extends Addon{
        public $info = array(
            'name' => 'Atlas',
            'title' => '图集',
            'description' => '多图上传',
            'status' => 1,
            'author' => '木梁大囧',
            'version' => '1.2'
        );

        public function install(){
            return true;
        }

        public function uninstall(){
            return true;
        }

        //实现的Atlas钩子方法
        public function Atlas($param){
			
			if(in_array_case(MODULE_NAME,array('Admin'))){
	  
				$name = $param['name'] ?: 'pics';
				$valArr = $param['value'] ? explode(',', $param['value']) : array();
				$this->assign('name',$name);
				$this->assign('valStr',$param['value']);
				$this->assign('valArr',$valArr);
				$this->display('upload');
			
			}else{
				
				$info=$param["atlas"];
				$info=explode(',',$info);
				$this->assign('list',$info);
				$this->display('widget');
				
			}
			
        }
		
    }