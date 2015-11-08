<?php

namespace Addons\Water\Model;

/**
 * 配置模型
 */
 
class WaterModel{
	
	public $_class=NULL;
	
	 public function __construct() {
		
		$class=get_addon_class('Water'); 
		 
		if(class_exists($class)){
			
			$this->_class=new $class;
		
		}
		
	}
	
	/*
	获取字体数据列表
	*/
	
	public function get_font_list(){
	
		//返回字体数据
	
		$font_list=array();
		
		$font_dirs_path=$this->_class->addon_path.'fonts/';
		
		$font_dirs = glob($font_dirs_path.'*', GLOB_ONLYDIR);
		
		foreach($font_dirs as $dirsname){
		    			
			$file_name=basename($dirsname);
			
			$font_list[$file_name]=$file_name;
			
			$config_file=$dirsname.'/config.txt';
		
			$file_res=file_get_contents($config_file);
			
			if($file_res){
				
				$_ST=new \Org\Util\String;
				
				!$_ST->isUtf8($file_res)&&$file_res=$_ST->autoCharset($file_res);
			
				$file_res=json_decode($file_res);
				
				is_object($file_res)&&$font_list[$file_name]=$file_res->name?$file_res->name:$file_name;
				
			}
			
		}
		
		return $font_list;
		
	}
	
	/*获取字体配置*/
	
	public function get_font_config($filename){
	
		$res=file_get_contents($filename);
		
		if(!$res) return false;
		
		if($res){
			
			$_ST=new \Org\Util\String;
				
			!$_ST->isUtf8($res)&&$res=$_ST->autoCharset($res);
			
			$res=json_decode($res);
			
		}
		
		return is_object($res)?$res:false;
			
	}
	
	/*
	判断是否包含中文如果包含，且当前字体是英文字体，则自动切换到中文默认字体。
	*/
	public  function font_switch(&$config,$config_temp){
		
		if (preg_match("/[\x7f-\xff]/",$config['text'])){
			
			$_config=$this->get_font_config($this->_class->addon_path.'fonts/'.$config['font'].'/config.txt');
			
			if($_config&&strtolower($_config->lang)!='cn'){
				
				$config['font']=$config_temp['font'][value];
				
			}
			
		}
		
	}
	
	/*
	判断是否包含中文如果包含，且当前字体是英文字体，则自动切换到中文默认字体。
	*/
	public  function param_deal(&$config,$config_temp,$type){
		
		 if($type=='text'){
		
			  !is_numeric($config['fontsize'])&&$config['fontsize']=$config_temp['fontsize'][value];//默认32号字体
			  
			  empty($config['font'])&&$config['font']=$config_temp['font'][value];//默认体字
			  
			  empty($config['textcolor'])&&$config['textcolor']=$config_temp['textcolor'][value];//默认黑色
			  
			  empty($config['text'])&&$config['text']=$config_temp['text'][value];
			  
			  !is_numeric($config['offset'])&&$config['offset']=$config_temp['offset'][value];//偏移量默认20
			  
			  !is_numeric($config['angle'])&&$config['angle']=$config_temp['angle'][value];//文字角度
		  
		 }else if($type=='image'){
			 
			 !$config['water']&&$config['water']=$this->_class->addon_path.'water.png';
			 
			 !is_numeric($config['alpha'])&&$config['alpha']=$config_temp['alpha'][value];
			 
		 }
		  
	}
	
	public function position_deal(&$config){
		
		//如果位置为随机
		if($config['position']==10){
			
			$config['position']=rand(1,9);
			
		}
		
		$offset=$config['offset'];
		
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
		
		$config['offset']=$offset;
		
	}
	
}