<?php

namespace Addons\Water;

use Common\Controller\Addon;

class WaterAddon extends Addon
{
    public $info = array(
        'name' => 'Water',
        'title' => '图片水印',
        'description' => '用于为上传的图片添加水印',
        'status' => 1,
        'author' => 'xjw129xjt',
        'version' => '0.1',
    );
	public $addon_install_info = array(
			'hooks'=>'dealPicture:2'						   
	);
    public $custom_config = 'admin_config.html';
	
    public function install()
    {
		return $this->addon_install($this->addon_install_info);
    }

    public function uninstall()
    {
		return $this->addon_uninstall();
    }
	
	//图片处理钩子
    public function dealPicture($param)
    {
		
		if(!$param) return $param;
		
		try{
			
			$config = $this->getConfig();
			if($config['switch']){
				if($config['water']){
					$water = $config['water'];
				}
				else{
					$water ='./'.$this->addon_path.'water.png';
				}
				$water_open=file_exists($water);
				$picture_open=file_exists($water);
				require_once('./'.$this->addon_path."WaterMark.class.php");
				if($water_open&&$picture_open)
				{
					$watermark=new \WaterMark($param ,$config['position']);
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