<?php

/*
+--------------------------------
@Autor geniusxjq <app880.com>
+--------------------------------
*/

namespace Addons\Water;

use Common\Controller\Addon;

class WaterAddon extends Addon
{
    public $info = array(
        'name' => 'Water',
        'title' => '图片水印',
        'description' => '用于为上传的图片添加水印',
        'status' => 1,
        'author' => 'geniusxjq(app880.com)',
		'url'=>'http://app880.com',
        'version' => '0.1',
    );
	public $addon_install_info = array(
			'hooks'=>'dealPicture:2'						   
	);
    public $custom_config = 'admin_config.html';
	
    public function install()
    {
		return $this->installAddon($this->addon_install_info);
    }

    public function uninstall()
    {
		return $this->uninstallAddon();
    }
	
	/*
	图片处理钩子
	@param $param 传入参数
	
	格式:
	
	array(
		  
		'Path'=>'path',//文件路径
		
		'Water-Off'=>true,//是否关闭水印.'true'关闭/不设置或'false'不关闭 (在某些情况下想关闭(不使用)水印功能时可以单独设置)
		
	);
	
	关闭方式: 
	
	在实例化上传类的配置中加入'Water-Off=>true'即可,如下:
		
	$config = array('Water-Off'=>true);
	
    $upload = new \Think\Upload($config);// 实例化上传类
	
	*/
	
    public function dealPicture($param)
    {
		
		if(!$param) return $param;
		
		if(!$param['Path']) return $param;
		
		if($param['Water-Off']&&$param['Water-Off']==true){//判断是否启用水印功能
			
			return $param;
			
		}
		
		try{
			
			$config = $this->getConfig();
			if($config['switch']){
				if($config['water']){
					$water = $config['water'];
				}
				else{
					$water =$this->addon_path.'water.png';
				}
				$water_open=file_exists($water);
				$picture_open=file_exists($param['path']);
				require_once($this->addon_path."WaterMark.class.php");
				if($water_open&&$picture_open)
				{
					$watermark=new \WaterMark($param['path'],$config['position']);
					$watermark->setWaterImage($water);
					$watermark->imageWaterMark();
				}
			}
			
		}catch(Exception $e){}
		
        return $param;
     }

    public function AdminIndex($param)
    {
        $config = $this->getConfig();
        $this->assign('addons_config', $config);
        if ($config['display'])
            $this->display('widget');
    }

}