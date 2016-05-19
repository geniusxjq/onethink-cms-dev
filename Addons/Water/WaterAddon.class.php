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
	@param $path string 文件路径	
	*/
	
    public function dealPicture($path)
    {
		
		if(is_array($path)){
			
			foreach ($info as $key => $value) {
					
				$this->dealPicture($value['rootPath'].$value['savepath'].$value['savename']);
				
			}
			
		}
		
		if(!$path||strtolower(C('PICTURE_UPLOAD_DRIVER'))!='local') return false;
		
		if(substr($path,0,1)=='/'){
			
			$path='.'.$path;
			
		}
		
		//如果文件不存在或不是文件

		if(!is_file($path)||!file_exists($path)) return false;
		
		try{
			
			$_Model=A('Addons://Water/Water','Model');
			
			$config_temp=include $this->config_file;
			
			$config=$this->getConfig();
			
			if($config['switch']){
								
				$result=false;
				
				$watermark=new \Think\Image;
				 
				$watermark->open($path);
				
				if($config['type']==0){
					
					$_Model->param_deal($config,$config_temp,'text');//参数调整
					
					$_Model->font_switch($config,$config_temp);//字体自动判断切换
					
					$_Model->position_deal($config);//偏移位置调整
					
					$font_path=$this->addon_path.'fonts/'.$config['font'].'/'.$config['font'].'.ttf';
					
					$result=$watermark->text($config['text'],$font_path,$config['fontsize'],$config['textcolor'],$config['position'],$config['offset'],$config['angle']);
					
				}else{
					
					$_Model->param_deal($config,$config_temp,'image');//参数调整
					
					$water=$config['water'];
					
					$water_open=file_exists($water);
					
					if($water_open){
						
						$result=$watermark->water($water,$config['position'],$config['alpha']);
						
					}
					
				}
				
				if($result)$watermark->save($path);
				
			}
			
		}catch(Exception $e){}
		
        return true;
     }

    public function AdminIndex($param)
    {
        $config = $this->getConfig();
        $this->assign('addons_config', $config);
        if ($config['display'])
            $this->display('widget');
    }

}