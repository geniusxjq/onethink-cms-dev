<?php

namespace Addons\Avator;
use Common\Controller\Addon;

/**
 * 头像上传插件插件
 * @author genisuxjq
 */

    class AvatorAddon extends Addon{

        public $info = array(
            'name'=>'Avator',
            'title'=>'头像上传插件',
            'description'=>'用户头像上传',
            'status'=>1,
            'author'=>'genisuxjq',
            'version'=>'0.1'
        );

        public function install(){
            return true;
        }

        public function uninstall(){
            return true;
        }

        //实现的documentEditFormContent钩子方法
        public function documentEditFormContent($param){

        }

    }