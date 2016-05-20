<?php

namespace Addons\Comment\Controller;
use Home\Controller\AddonsController;

class CommentController extends AddonsController{
	
    public function __construct() {
        parent::__construct();
    }
	
    /**
     * 后台编辑评论
     * @return void
     */
    public function edit() {
		
        if (!is_administrator()) {
            $this->error('非管理员用户');
        }
        $Comment = D('Addons://Comment/Comment');
        if ($Comment->edit()) {
            $result = array('status' => 1, 'info' => $Comment->Success(), 'data' => '');
            $this->ajaxReturn($result);
        }
        else {
            $this->error($Comment->Error());
        }
    }

    /**
     * 前台提交评论方法
     * @return void
     */
    public function submit() {
        $result = array('status' => 1, 'info' => '', 'data' => '');
        $Comment = D('Addons://Comment/Comment');
        if ($Comment->submit()) {
            $result['info'] = '提交成功';
        }
        else {
            $result['status'] = 0;
            $result['info'] = $Comment->Error();
        }
        $this->ajaxReturn($result);
    }

    /**
     * 后台评论列表快速切换状态
     * @return void
     */
    public function status() {
        if (!is_administrator()) {
            $this->error('非管理员用户');
        }
        $result = array('status'=> 1, 'info'=> '', 'data'=> '');
        $Comment = D('Addons://Comment/Comment');
        if ($Comment->status()) {
            $result['info'] = '成功改变状态';
        }
        else {
            $result['status'] = 0;
            $result['info'] = $Comment->Error();
        }
        $this->ajaxReturn($result);
    }

    /**
     * 显示验证码
     * @return void
     */
    public function verifyCode() {
        $Verify = new \Think\Verify();
        $Verify->entry('#comment-addon-verify-code#');
    }

}