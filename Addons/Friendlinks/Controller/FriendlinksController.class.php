<?php
namespace Addons\Friendlinks\Controller;
use Admin\Controller\AddonsController;

class FriendlinksController extends AddonsController{
	/* 添加友情连接 */
	
	public function add(){
		$this->meta_title = '添加友情链接';
		$current = Cookie('__forward__');
		$this->assign('current',$current);
		$this->display(T('Addons://Friendlinks@Friendlinks/edit'));
	}
	
	/* 编辑友情连接 */
	public function edit(){
		$this->meta_title = '修改友情链接';
		$id     =   I('get.id','');
		$current = Cookie('__forward__');
		$detail = D('Addons://Friendlinks/Friendlinks')->detail($id);
		$this->assign('info',$detail);
		$this->assign('current',$current);
		$this->display(T('Addons://Friendlinks@Friendlinks/edit'));
	}
	
	/* 禁用友情连接 */
	public function disable(){
		$id     =   I('get.id','');
		if(D('Addons://Friendlinks/Friendlinks')->off($id)){
			$this->success('成功禁用该友情连接', Cookie('__forward__'));
		}else{
			$this->error(D('Addons://Friendlinks/Friendlinks')->getError());
		}
	}
	
	/* 启用友情连接 */
	public function enable(){
		$id = I('get.id','');
		if(D('Addons://Friendlinks/Friendlinks')->on($id)){
			$this->success('成功启用该友情连接', Cookie('__forward__'));
		}else{
			$this->error(D('Addons://Friendlinks/Friendlinks')->getError());
		}
	}
	
	/* 删除友情连接 */
	public function del(){
		$id = I('get.id','');
		if(D('Addons://Friendlinks/Friendlinks')->del($id)){
			$this->success('删除成功', Cookie('__forward__'));
		}else{
			$this->error(D('Addons://Friendlinks/Friendlinks')->getError());
		}
	}
	
	/* 更新友情连接 */
	public function update(){
		$res = D('Addons://Friendlinks/Friendlinks')->update();
		if(!$res){
			$this->error(D('Addons://Friendlinks/Friendlinks')->getError());
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
				D('Addons://Friendlinks/Friendlinks')->on($id);
			}
			$this->success('成功启用',Cookie('__forward__'));
		}else{
			foreach ($ids as $id)
			{
				D('Addons://Friendlinks/Friendlinks')->off($id);
			}
			$this->success('成功禁用',Cookie('__forward__'));
		}			

	}

}
