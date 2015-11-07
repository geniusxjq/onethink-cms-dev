<?php

namespace Addons\Water\Util;

/**
 * 配置模型
 */
class BaseUtil{
	
	public function get_font_list(){
	
		//返回字体数据
	
		$font_list=array();
		
		$class=get_addon_class('Water');
		 
		if(!class_exists($class)) return $font_list;
		
		$class=new $class;
		
		$font_dirs_path=$class->addon_path.'fonts/';
		
		$font_dirs = glob($font_dirs_path.'*', GLOB_ONLYDIR);
		
		foreach($font_dirs as $dirsname){
		    			
			$file_name=basename($dirsname);
			
			$config_file=$dirsname.'/config.txt';
		
			$file_res=file_get_contents($config_file);
			
			if($file_res){
				
				if(!(new \Org\Util\String)->isUtf8($file_res)){
					
					$file_res=mb_convert_encoding($file_res, 'UTF-8', 'GBK'); 
					
				}
				
				$file_res=json_decode($file_res);
				
				is_object($file_res)&&$font_list[$file_name]=$file_res->name?$file_res->name:$file_name;
				
			}
			
		}
		
		return $font_list;
		
	}
	
	public function get_font_config($filename){
	
		$res=file_get_contents($filename);
		
		if(!$res) return false;
		
		if($res){
			
			if(!(new \Org\Util\String)->isUtf8($res)){
			
				$res=mb_convert_encoding($res, 'UTF-8', 'GBK'); 
			
			}
			
			$res=json_decode($res);
			
		}
		
		return is_object($res)?$res:false;
			
	}
	
}