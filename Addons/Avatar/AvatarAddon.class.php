<?php

namespace Addons\Avatar;
use Common\Controller\Addon;

/**
 * 头像上传插件插件
 * @author genisuxjq
 */

class AvatarAddon extends Addon{

	public $info = array(
		'name'=>'Avatar',
		'title'=>'头像上传插件',
		'description'=>'用户头像上传',
		'status'=>1,
		'author'=>'genisuxjq',
		'version'=>'0.1'
	);
	
	public $addon_install_info = array(
									   
		'hooks'=>'UploadAvatar:1:调用（显示）头像上传的钩子',
					
	);

	public function install(){
		
		return $this->installAddon($this->addon_install_info);
		
	}
	
	public function uninstall(){
		
		return $this->uninstallAddon($this->addon_install_info);
		
	}
	
	//实现的documentEditFormContent钩子方法
	public function UploadAvatar($param){
		
		if(IS_POST){
			
		  $targ_w = $targ_h = 150;
		  $jpeg_quality = 90;
	  
		  $src = $this->addon_path.'img/pool.jpg';
		  $img_r = imagecreatefromjpeg($src);
		  $dst_r = ImageCreateTrueColor( $targ_w, $targ_h );
	  
		  imagecopyresampled($dst_r,$img_r,0,0,$_POST['x'],$_POST['y'],
		  $targ_w,$targ_h,$_POST['w'],$_POST['h']);
	  
		  header('Content-type: image/jpeg');
		  imagejpeg($dst_r,null,$jpeg_quality);
			
		}else{
			
		  $this->assign('mate_title','头像上传');
		  
		  $this->display('widget');
		
		}

	}

}