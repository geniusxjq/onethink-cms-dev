<?php

namespace Addons\Schedule\Controller;
use Admin\Controller\AddonsController;

class ScheduleController extends AddonsController{
	
	public function _initialize(){

		parent::_initialize();
		
		$this->_Model=D('Addons://Schedule/Schedule');
		
	}
	
	//添加/编辑计划
	public function edit(){
		
		$_name=(I('id')?'编辑':'添加');
				
		if(IS_POST){
			$res = $this->_Model->updateSchedule(I('post.'));
			if($res) {
				// TODO:记录日志
				$this->success($_name.'成功',U('Addons/adminList?name=Schedule'));
			} else {
				$this->error($this->_Model->getError());
			}		 
		}else {
			
			$this->meta_title = $_name.'计划';
			
			if(I('id')) $this->assign('data',$this->_Model->find(I('id')));
			
			$this->display(T('Addons://Schedule@Schedule/edit'));	
			
		}
		
	}
	
	//删除计划
	public function del(){
		if (!I('id')) {
			$this->error('请选择至少一条数据！');
		}
		$id =is_array(I('id'))?implode(I('id'), ','):I('id');
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
