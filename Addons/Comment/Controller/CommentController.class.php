<?php
/**
 * @author genisuxjq <app880.com>
 **/
namespace Addons\Comment\Controller;
use Home\Controller\AddonsController;

class CommentController extends AddonsController{

	public $uploader = null;
	public function savedata(){
		$theuser = session('user_auth');
		if($theuser){
			$_POST['uname'] = $theuser['username'];
		}else{
			$_POST['uid'] = 0;
			$_POST['uurl'] = '';
			$uname = I('post.uname','');
			if(empty($uname)){
				$this->error('匿名用户必须填写一个称呼！');
				exit;
			}
			$uemail = I('post.uemail','');
			if(!$this->checkemail($uemail)){
				$this->error('邮箱没有填写或填写错啦！');
				exit;
			}
		}

		$Comment = D('Addons://Comment/comment');
		$Comment->create();
		$id = $Comment->add();
		if($id){
			$this->success('评论发表成功！', '', array('id' => $id));
		} else {
			$this->error('评论发表失败！'.$Comment->getError());
		}


	}
	public function checkemail($email){
		$preg = '/^(\w{1,25})@(\w{1,16})(\.(\w{1,4})){1,3}$/'; 
		return (preg_match($preg, $email));
	}

	public function diggit(){
		$return['status'] = 0;
		$return['info']   = '';
		$id = I('post.id',0);
		if(empty($id)){
			$return['info']   = '顶失败失败！不必到顶什么！';
			/* 返回JSON数据 */
			$this->ajaxReturn($return);
			exit;
		}

		if(session('lasttime_'.get_client_ip(1)) && ((time() - session('lasttime_'.get_client_ip(1))) <10)){
			$return['info']   = '顶的太快了，一个IP最快10秒一次！';
			/* 返回JSON数据 */
			$this->ajaxReturn($return);
			exit;
		}
		$Comment = D('Addons://Comment/comment');
		$rt = $Comment->diggit($id);
		if($rt){
			session('lasttime_'.get_client_ip(1),time());
			$return['status'] = 1;
			$return['info']   = '顶好了！';
		} else {
			$return['info']   = '顶坏了！'.$Comment->getError();
		}
			/* 返回JSON数据 */
		$this->ajaxReturn($return);

	}

}
