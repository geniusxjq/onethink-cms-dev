<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use OT\DataDictionary;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends HomeController {
	
	public function hooksInfoToArray($info){
		
		$result=array();
		
		if($info){
			
			$temp_arr=array(
				
			  'name'=>'',
			  
			  'type'=>'',
			  
			  'description'=>'',
			  				
			);
			
			if(is_array($info)){
				
				$hooks=$info;
				
				foreach($hooks as $key=>$value){
					
					if(is_string($key)){
						
						$result[]=array_merge($temp_arr,$hooks);
						
						break;
						
					}	
					
					if(is_int($key)&&is_array($value)){
						
						$result[]=array_merge($temp_arr,$value);
						
						continue;
						
					}
																
				}
				
			}else{
				
				$hooks=explode(',',$info);
					
				foreach($hooks as $hook_name){
					
					$_arr=array();
														
					list($_arr['name'],$_arr['type'],$_arr['description'])=explode(':',$hook_name);
					
					$result[]=array_merge($temp_arr,$_arr);
					
					continue;
																
				}

			}
						
		}
		
		return $result;
		 
	}

	//系统首页
    public function index(){
		
		dump($this->hooksInfoToArray("hooks"));
		
		return ;
        $category = D('Category')->getTree();
        $lists    = D('Document')->lists(null);

        $this->assign('category',$category);//栏目
        $this->assign('lists',$lists);//列表
        $this->assign('page',D('Document')->page);//分页
                 
        $this->display();
    }

}