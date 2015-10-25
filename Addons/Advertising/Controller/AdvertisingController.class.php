<?php
/**
 * 
 * @author quick
 *
 */
namespace Addons\Advertising\Controller;
use Admin\Controller\AddonsController;

class AdvertisingController extends AddonsController{
		
	public function _initialize(){

		parent::_initialize();

		$this->_AdModel=D('Addons://Advertising/Advertising');
		
	}
	/**
	 * 添加广告位
	 */
	public function add(){
		$this->display(T('Addons://Advertising@Advertising/edit'));
	}
	
	/* 编辑 */
	public function edit(){
		$id     =   I('get.id','');
		$detail =$this->_AdModel->detail($id);
		$this->assign('info',$detail);
		$this->display(T('Addons://Advertising@Advertising/edit'));
	}
	
	/* 禁用 */
	public function forbidden(){
		$id     =   I('get.id','');
		if($this->_AdModel->forbidden($id)){
			$this->success('成功禁用', Cookie('__forward__'));
		}else{
			$this->error($this->_AdModel->getError());
		}
	}
	
	/* 启用 */
	public function off(){
		$id     =   I('get.id','');
		if($this->_AdModel->off($id)){
			$this->success('成功启用',Cookie('__forward__'));
		}else{
			$this->error($this->_AdModel->getError());
		}
	}
	
	/* 删除 */
	public function del(){
		$id     =   I('get.id','');
		if($this->_AdModel->del($id)){
			$this->success('删除成功', Cookie('__forward__'));
		}else{
			$this->error($this->_AdModel->getError());
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
			$this->success('成功启用',Cookie('__forward__'));
		}else{
			foreach ($ids as $id)
			{
				$this->_AdModel->forbidden($id);
			}
			$this->success('成功禁用',Cookie('__forward__'));
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
}