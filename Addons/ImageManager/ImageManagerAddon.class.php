<?php

namespace Addons\ImageManager;
use Common\Controller\Addon;

/**
 * 图片管理插件
 * @author 凡人
 */

class ImageManagerAddon extends Addon{
	
	public $info = array(
		'name'=>'ImageManager',
		'title'=>'图片管理',
		'description'=>'图片管理，快速选择已上传图片到封面',
		'status'=>1,
		'author'=>'凡人',
		'version'=>'0.1'
	);
	
	public $addon_install_info=array(
		//'hooks'=>'AdminPageFooter:1:调用（显示）留言板的钩子',
	);

	public function install(){
		return $this->installAddon();
	}

	public function uninstall(){
		return $this->uninstallAddon();
	}

	//实现的AdminPageFooter钩子方法
	public function AdminPageFooter(){
		$this->assign("addon_path", $this->addon_path);
		$this->display("widget");
	}
		
}