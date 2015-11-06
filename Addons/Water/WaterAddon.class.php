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
		
		if(!$path||strtolower(C('PICTURE_UPLOAD_DRIVER'))!='local') return false;
		
		if(substr($path,0,1)=='/'){
			
			$path='.'.$path;
			
		}
		
		//如果文件不存在或不是文件

		if(!is_file($path)||!file_exists($path)) return false;
		
		try{
			
			$config = $this->getConfig();
			
			if($config['switch']){
								
				$result=false;
				
				$watermark=new \Think\Image;
				 
				$watermark->open($path);
				
				if($config['type']==0){
					
					$fontsize=is_numeric($config['fontsize'])?$config['fontsize']:32;//默认32号字体
					$font=is_numeric($config['font'])?$config['font']:'simhei';//默认黑体字
					$textcolor=!empty($config['textcolor'])?$config['textcolor']:'#000';//默认黑色
					$water_text=!empty($config['text'])?$config['text']:'请设置水印文字';
					$offset=is_numeric($config['offset'])?$config['offset']:20;//偏移量默认20
					
					//根据水印位置调整边距值
					switch($config['position']){
						
						case 1:
						 $offset=array($offset,$offset);
						break;
						
						case 2:
						  $offset=array(0,$offset);
						break;
						
						case 3:
						 $offset=array(($offset*(-1)),$offset);
						break;
						
						case 4:
						   $offset=array($offset,0);
						break;
						
						case 5:
						$offset=0;
						break;
						
						case 6:
						    $offset=array(($offset*(-1)),0);
						break;
						
						case 7:
						$offset=array($offset,($offset*(-1)));
						break;
						
						case 8:
						$offset=array(0,($offset*(-1)));
						break;
						
						case 8:
						$offset=$offset*(-1);
						break;	
						
					}
					
					$result=$watermark->text($water_text,$this->addon_path.'fonts/'.$font.'.ttf',$fontsize,$textcolor,$config['position'],$offset);
					
				}else{
					
					if($config['water']){
						$water = $config['water'];
					}else{
						$water =$this->addon_path.'water.png';
					}
					$water_open=file_exists($water);
					$alpha=is_numeric($config['alpha'])?$config['alpha']:80;
					if($water_open){
						$result=$watermark->water($water,$config['position'],$alpha);
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