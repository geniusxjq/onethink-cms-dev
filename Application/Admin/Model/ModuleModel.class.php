<?php
/**
 * 所属项目 110.
 * 开发者: 陈一枭
 * 创建日期: 2014-11-18
 * 创建时间: 10:27
 * 版权所有 想天软件工作室(www.ourstu.com)
 */

namespace Admin\Model;

use Think\Model;

class ModuleModel extends Model
{

   /*
   *获取模块信息
   */
  
    public function getModules()
    {

        $module ='';// S('module_all');//暂时不用缓存功能
		
        if (empty($module)) {
			
			$map=array('is_setup'=>1);
			
			$module=$this->where($map)->select();
			
            //S('module_all', $module);//暂时不用缓存功能
			
        }

        return $module;
		
    }
	
} 