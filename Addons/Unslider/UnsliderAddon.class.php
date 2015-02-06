<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------


namespace Addons\Unslider;
use Common\Controller\Addon;

/**
 * 开发团队信息插件
 * @author thinkphp
 */

    class UnsliderAddon extends Addon{

        public $info = array(
            'name'=>'Unslider',
            'title'=>'焦点图',
            'description'=>'焦点图',
            'status'=>1,
            'author'=>'cepljxiongjun',
            'version'=>'0.1'
        );
		
		public $addon_install_info = array(
				'hooks'=>'Unslider'						   
		);

        public function install(){
             return $this->addon_install($this->$addon_install_info);
        }

        public function uninstall(){
            return $this->addon_uninstall($this->$addon_install_info);
        }

        //实现的AdminIndex钩子方法
        public function Unslider(){
            $config = $this->getConfig();
            $Document = D('Document');
            $list = $Document->where('cover_id >0')->select();
            $Picture = M('Picture');
            foreach ($list as $k=>$v)
            {
            	$list[$k]['url_path'] = $Picture->where('id ='.$v['cover_id'])->getField('path');
            }
            $this->assign('list', $list);
            $this->assign('addons_config', $config);
            if($config['display'])
                $this->display('index');
        }
		/**
		 * 加载css
		 */
		public function pageHeader(){
            $config = $this->getConfig();
            if($config['display'])
                $this->display('herder');
        }
        /**
		 * 加载js
		 */
		 public function pageFooter(){
            $config = $this->getConfig();
            if($config['display'])
                $this->display('weight');
        }
    }