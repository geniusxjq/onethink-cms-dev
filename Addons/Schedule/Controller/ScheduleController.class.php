<?php

namespace Addons\Schedule\Controller;
use Admin\Controller\AddonsController;

class ScheduleController extends AddonsController{
	
	public function _initialize(){

		parent::_initialize();
		
		$this->_Model=D('Addons://Schedule/Schedule');
		
	}
	
	//添加计划
	public function add(){
		
		if(IS_POST){
			$res = $this->_Model->addSchedule(I('post.'));
			if($res) {
				// TODO:记录日志
				$this->success('新增成功',U('addons/adminlist',array('name'=>Schedule)));
			} else {
				$this->error('新增失败');
			}		 
		}else {
			$this->meta_title = '添加计划';
			$this->display(T('Addons://Schedule@Schedule/add'));			
		}
	}
	
	//删除计划
	public function del(){
		if (!I('post.id')) {
			$this->error('请选择至少一条数据！');
		}
		$id = implode(I('post.id'), ',');
		if ($this->_Model->del($id)){
			$this->success('删除计划记录成功！');
		}else {
			$this->error('删除计划记录失败！');
		}		
	}
	
	/* 禁用 */
	public function forbidden(){
		$id     =   I('get.id','');
		if($this->_Model->forbidden($id)){
			$this->success('成功禁用');
		}else{
			$this->error($this->_Model->getError());
		}
	}
	
	/* 启用 */
	public function off(){
		$id     =   I('get.id','');
		if($this->_Model->off($id)){
			$this->success('成功启用');
		}else{
			$this->error($this->_Model->getError());
		}
	}
	
	/**
	 * 批量处理
	 */
	public function savestatus(){
		$status = I('get.status');
		$ids = I('post.id');
		
		if(!$ids){
			
			$this->error("请选择记录！");
		}
		
		if($status == 1){
			foreach ($ids as $id)
			{
				$this->_Model->off($id);
			}
			
			if($this->_Model->error) {
			
			$this->error($this->_Model->getError());
			
			return false;
			
			}
			$this->success('成功启用');
			
		}else{
			foreach ($ids as $id)
			{
				$this->_Model->forbidden($id);
			}
			
			if($this->_Model->error) {
			
			$this->error($this->_Model->getError());
			
			return false;
			
			}
			$this->success('禁用成功');
		}

	}

}
