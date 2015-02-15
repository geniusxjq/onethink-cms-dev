<?php

/**
+----------------------
@Author geniusxjq <app880.com>
+---------------------
 */

namespace Addons\Mail\Controller;
use Home\Controller\AddonsController;

/**
 * 邮件订阅模块
 * Class MailRssController
 * @package Addons\Mail\Controller
 * @author:xjw129xjt xjt@ourstu.com
 */
 
class MailRssController extends AddonsController
{
	
    public function unSubScribe()
    {
        $token = I('token');
        if ($token) {
			
            $arr = D('MailToken')->where(array('token' => $token))->find();
			
			if($arr){
				
				$res = D('MailList')->where(array('address' => $arr['email']))->setField('status', 0);
				
				D('MailToken')->where(array('token' => $token))->delete();
				
				if ($res) {
					$this->success('取消订阅成功', U('Home/Index/index'));
				} else {
					$this->error('取消订阅失败', U('Home/Index/index'));
				}
				
			}else{
			
				$this->error('取消订阅失败', U('Home/Index/index'));
			
			}
			
        }
    }
	
    public function subScribe()
    {
        $email_address = I('email_address');
        $match = preg_match("/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/", $email_address);

        if( $email_address =='' || !$match){
            $this->error('邮箱格式不正确');
        }

        $check = D('MailList')->where(array('address' => $email_address))->find();
        if ($check) {
             if($check['status']){
                    $this->error('该邮箱已经存在');
                }
                else{
                    $res = D('MailList')->where(array('address'=>$email_address))->setField('status', 1);
                }

        } else {
            $res = D('MailList')->add(array('address' => $email_address, 'status' => 1, 'create_time' => time()));

        }
        if ($res) {
            $this->success('订阅成功.');
        } else {
            $this->error(' 订阅失败');
        }
    }

}
