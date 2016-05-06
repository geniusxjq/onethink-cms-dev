<?php

namespace Addons\ReturnTop\Model;

/**
 * 配置模型
 */
 
class BaseModel{
	
	public $_class=NULL;
	
	 public function __construct() {
		
		$class=get_addon_class('ReturnTop'); 
		 
		if(class_exists($class)){
			
			$this->_class=new $class;
		
		}
		
	}
	
	/*
	获取主题数据列表
	*/
	
	public function get_theme_list(){
	
		//返回字体数据
	
		$_list=array();
		
		$_dirs_path=$this->_class->addon_path.'theme/';
		
		$_dirs = glob($_dirs_path.'*', GLOB_ONLYDIR);
		
		foreach($_dirs as $dirsname){
		    			
			$file_name=basename($dirsname);
			
			$_list[$file_name]=$file_name;
			
			$config_file=$dirsname.'/config.txt';
		
			$file_res=file_get_contents($config_file);
			
			if($file_res){
				
				$_ST=new \Org\Util\String;
				
				!$_ST->isUtf8($file_res)&&$file_res=$_ST->autoCharset($file_res);
			
				$file_res=json_decode($file_res);
				
				is_object($file_res)&&$_list[$file_name]=$file_res->name?$file_res->name:$file_name;
				
			}
			
		}
		
		return $_list;
		
	}
	
}