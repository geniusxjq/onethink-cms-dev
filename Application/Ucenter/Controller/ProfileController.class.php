<?php
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.ap880.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: geniusxjq <app880.com>
// +----------------------------------------------------------------------
namespace Ucenter\Controller;
use User\Api\UserApi;
/*
用户信息配置
*/

class ProfileController extends UcenterController {
	
	public function _initialize(){
		
		parent::_initialize();
		
	}
	
    /**
     * 修改密码提交
     * @author huajie <banhuajie@163.com>
     */
    public function password(){
		
        if ( IS_POST ) {
            //获取参数
            $uid        =   is_login();
            $password   =   I('post.old');
            $repassword = I('post.repassword');
            $data['password'] = I('post.password');
            empty($password) && $this->error('请输入原密码');
            empty($data['password']) && $this->error('请输入新密码');
            empty($repassword) && $this->error('请输入确认密码');

            if($data['password'] !== $repassword){
                $this->error('您输入的新密码与确认密码不一致');
            }

            $Api = new UserApi();
            $res = $Api->updateInfo($uid, $password, $data);
            if($res['status']){
                $this->success('修改密码成功！');
            }else{
                $this->error($this->showRegError($res['info']));
            }
        }else{
            $this->display();
        }
    }
	
	public function avatar(){
			
		if($_FILES['file']){
			$return=D('Avatar')->dealAvatar('file');
			$this->ajaxReturn($return);
		}else if(IS_POST){
			$return=D('Avatar')->dealAvatar('crop');
			$this->ajaxReturn($return);
		}else{
			$avatar=D('Avatar')->getAvatar(UID);
			$data['avatar']=$avatar;
			$this->assign('data',$data);
			$this->assign('UID',UID);
			$this->display();
		}
		
	}
	
	/**
	 * 获取错误信息
	 * @param  integer $code 错误编码
	 * @return string        错误信息
	 */
	private function showRegError($code = 0){
		switch ($code) {
			case -1:  $error = '用户名长度必须在16个字符以内！'; break;
			case -2:  $error = '用户名被禁止注册！'; break;
			case -3:  $error = '用户名被占用！'; break;
			case -4:  $error = '密码长度必须在6-30个字符之间！'; break;
			case -5:  $error = '邮箱格式不正确！'; break;
			case -6:  $error = '邮箱长度必须在1-32个字符之间！'; break;
			case -7:  $error = '邮箱被禁止注册！'; break;
			case -8:  $error = '邮箱被占用！'; break;
			case -9:  $error = '手机格式不正确！'; break;
			case -10: $error = '手机被禁止注册！'; break;
			case -11: $error = '手机号被占用！'; break;
			default:  $error = '未知错误';
		}
		return $error;
	}
	
}