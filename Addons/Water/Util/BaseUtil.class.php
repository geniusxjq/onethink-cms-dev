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
		    
			$res=array('fontname'=>basename($dirsname),'name'=>'');
			
			$config_file=$dirsname.'/config.txt';
		
			$res['name']=file_get_contents($config_file);
			
			if($res['name']){
				
				if(!(new \Org\Util\String)->isUtf8($res['name'])){
					
					$res['name']=mb_convert_encoding($res['name'], 'UTF-8', 'GBK'); 
					
				}
				
				$res['name']=json_decode($res['name']);
				
				$res['name']=is_object($res['name']->name)?$res['name']->name:$res['fontname'];
				
			}else{
				
				$res['name']=$res['fontname'];
				
			}
			
			$font_list[]=$res;
		
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