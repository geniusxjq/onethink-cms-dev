<?php
namespace Addons\Friendlinks\Controller;
use Admin\Controller\AddonsController;
class FriendlinksController extends AddonsController{
	/* 添加友情连接 */
	public function add(){
		$this->meta_title = '添加友情链接';
		$current = cookie('__forward__');
		$this->assign('current',$current);
		$this->display(T('Addons://Friendlinks@Friendlinks/edit'));
	}
	
	/* 编辑友情连接 */
	public function edit(){
		$this->meta_title = '修改友情链接';
		$id     =   I('get.id','');
		$current = cookie('__forward__');
		$detail = D('Addons://Friendlinks/Friendlinks')->detail($id);
		$this->assign('info',$detail);
		$this->assign('current',$current);
		$this->display(T('Addons://Friendlinks@Friendlinks/edit'));
	}
	
	/* 禁用友情连接 */
	public function forbidden(){
		$this->meta_title = '禁用友情链接';
		$id     =   I('get.id','');
		if(D('Addons://Friendlinks/Friendlinks')->forbidden($id)){
			$this->success('成功禁用该友情连接', cookie('__forward__'));
		}else{
			$this->error(D('Addons://Friendlinks/Friendlinks')->getError());
		}
	}
	
	/* 启用友情连接 */
	public function off(){
		$this->meta_title = '启用友情链接';
		$id     =   I('get.id','');
		if(D('Addons://Friendlinks/Friendlinks')->off($id)){
			$this->success('成功启用该友情连接', cookie('__forward__'));
		}else{
			$this->error(D('Addons://Friendlinks/Friendlinks')->getError());
		}
	}
	
	/* 删除友情连接 */
	public function del(){
		$this->meta_title = '删除友情链接';
		$id     =   I('get.id','');
		if(D('Addons://Friendlinks/Friendlinks')->del($id)){
			$this->success('删除成功', cookie('__forward__'));
		}else{
			$this->error(D('Addons://Friendlinks/Friendlinks')->getError());
		}
	}
	
	/* 更新友情连接 */
	public function update(){
		$this->meta_title = '更新友情链接';
		$res = D('Addons://Friendlinks/Friendlinks')->update();
		if(!$res){
			$this->error(D('Addons://Friendlinks/Friendlinks')->getError());
		}else{
			if($res['id']){
				$this->success('更新成功', cookie('__forward__'));
			}else{
				$this->success('新增成功', cookie('__forward__'));
			}
		}
	}
}
