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
			
			$config_temp_arr = include $this->config_file;
			
			$config = $this->getConfig();
			
			if($config['switch']){
								
				$result=false;
				
				$watermark=new \Think\Image;
				 
				$watermark->open($path);
				
				//如果位置为随机
				if($config['position']==10){
					$config['position']=rand(1,9);
				}
				
				if($config['type']==0){
					
					$fontsize=is_numeric($config['fontsize'])?$config['fontsize']:$config_temp_arr['fontsize'][value];//默认32号字体
					$font=!empty($config['font'])?$config['font']:$config_temp_arr['font'][value];//默认体字
					$textcolor=!empty($config['textcolor'])?$config['textcolor']:$config_temp_arr['textcolor'][value];//默认黑色
					$water_text=!empty($config['text'])?$config['text']:$config_temp_arr['text'][value];
					$offset=is_numeric($config['offset'])?$config['offset']:$config_temp_arr['offset'][value];//偏移量默认20
					$angle=is_numeric($config['angle'])?$config['angle']:$config_temp_arr['angle'][value];//文字角度
					
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
						
						case 9:
							$offset=$offset*(-1);
						break;	
						
					}
					
					//判断是否包含中文如果包含，且当前字体是英文字体，则自动切换到中文默认字体。
					if (preg_match("/[\x7f-\xff]/",$water_text)){
						
						$the_font_config=A('Addons://Water/Base','Util')->get_font_config($this->addon_path.'fonts/'.$font.'/config.txt');
						
						if($the_font_config&&strtolower($the_font_config->lang)!='cn'){
							
							$font=$config_temp_arr['font'][value];
							
						}
						
					}
					
					$result=$watermark->text($water_text,$this->addon_path.'fonts/'.$font.'/'.$font.'.ttf',$fontsize,$textcolor,$config['position'],$offset,$angle);
					
				}else{
					
					if($config['water']){
						$water = $config['water'];
					}else{
						$water =$this->addon_path.'water.png';
					}
					
					$water_open=file_exists($water);
					
					$alpha=is_numeric($config['alpha'])?$config['alpha']:$config_temp_arr['alpha'][value];
					
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