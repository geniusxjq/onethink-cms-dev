<?php

namespace Addons\Support;

use Common\Controller\Addon;

/**
 * QQ客服插件
 * @author 高龙
 */

    class SupportAddon extends Addon{

        public $info = array(
            'name'=>'Support',
            'title'=>'QQ客服',
            'description'=>'网站QQ客服插件',
            'status'=>1,
            'author'=>'高龙',
            'version'=>'0.1'
        );

        public function install(){
            return true;
        }

        public function uninstall(){
            return true;
        }

        //实现的pageFooter钩子方法
        public function pageFooter($param){
		
		$config = $this->getConfig();
		
		$this->assign('config',$config);
		$this->display('qq');

        }

    }