<?php

namespace Addons\Advertising\Controller;

use Admin\Controller\AddonsController; 

class AdvertisementController extends AddonsController{
	
	public function _initialize(){

		parent::_initialize();
		
		$this->_AdModel=D('Addons://Advertising/Advertisement');
		
	}
	
	public function advsList(){
		 // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);
		$main_title=$this->meta_title = '广告管理';
		$title = I('title');
		$position=I('position');
		$map=array();
		
		if ($title != ''){
            $map['title'] = array('like', '%' . $title . '%');
		}
		
		if($position){
			$map['position'] = array('like', '%' . $position . '%');
			$_model=M('advertising')->find($position);
			$_model&&$main_title = '广告位 ['.$_model['title'].'] > 广告管理';
		}
			
		$list=$this->_AdModel->where($map)->select();
		
		$listKey=array(
				'title'=>'广告名称',
				'positiontext'=>'广告位置',
				'link'=>'连接地址',
				'create_time'=>'开始时间',
				'end_time'=>'结束时间',
				'is_nevertext'=>'永久有效',
				'statustext'=>'状态',
				'level'=>'优先级',
		);
		
		$this->assign('main_title',$main_title);
		$this->assign('listKey',$listKey);
		$this->assign('_list',$list);
		$this->display(T('Addons://Advertising@Advertisement/advsList'));
	}
	
	/* 添加 */
	public function add(){
		$_advertising = M('advertising')->where('status = 1')->select();
		$this->assign('_advertising',$_advertising);
		$this->display(T('Addons://Advertising@Advertisement/edit'));
	}
	
	/* 编辑 */
	public function edit(){
		$id     =   I('get.id','');
		$_advertising = M('advertising')->where('status = 1')->select();
		$detail = $this->_AdModel->detail($id);
		$this->assign('info',$detail);
		$this->assign('_advertising',$_advertising);
		$this->display(T('Addons://Advertising@Advertisement/edit'));
	}
	
	/* 禁用 */
	public function forbidden(){
		$id     =   I('get.id','');
		if($this->_AdModel->forbidden($id)){
			$this->success('成功禁用该广告');
		}else{
			$this->error($this->_AdModel->getError());
		}
	}
	
	/* 启用 */
	public function off(){
		$id     =   I('get.id','');
		if($this->_AdModel->off($id)){
			$this->success('成功启用该广告');
		}else{
			$this->error($this->_AdModel->getError());
		}
	}
	
	/* 删除 */
	public function del(){
		$id     =   I('get.id','');
		if($this->_AdModel->del($id)){
			$this->success('删除成功');
		}else{
			$this->error($this->_AdModel->getError());
		}
	}
	
	/* 更新 */
	public function update(){
		$res = $this->_AdModel->update();
		if(!$res){
			$this->error($this->_AdModel->getError());
		}else{
			if($res['id']){
				$this->success('更新成功', Cookie('__forward__'));
			}else{
				$this->success('新增成功', Cookie('__forward__'));
			}
		}
	}
	/**
	 * 批量处理
	 */
	public function savestatus(){
		$status = I('get.status');
		$ids = I('post.id');
		
		if($status == 1){
			foreach ($ids as $id)
			{
				$this->_AdModel->off($id);
			}
			$this->success('成功启用该广告');
		}else{
			foreach ($ids as $id)
			{
				$this->_AdModel->forbidden($id);
			}
			$this->success('成功禁用该广告');
		}			

	}
}
