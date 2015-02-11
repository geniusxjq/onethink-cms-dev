<?php
/**
 * Created by PhpStorm.
 * User: caipeichao
 * Date: 14-3-11
 * Time: PM5:41
 */




namespace Addons\Mail\Controller;
use Admin\Builder\AdminConfigBuilder;
use Admin\Builder\AdminListBuilder;
use Admin\Builder\AdminTreeListBuilder;
use Admin\Controller\AddonsController;
/**
 * 邮件订阅模块
 * Class MailController
 * @package Addons\Mail\Controller
 * @author:xjw129xjt xjt@ourstu.com
 */

class MailController extends AddonsController
{

    /**
     * 后台首页-邮件配置
     * @param string $id
     * autor:xjw129xjt
     */
    public function saveConfig()
    {

        if($_POST['config'] && is_array($_POST['config'])){
            $Config = M('Config');
            foreach ($_POST['config'] as $name => $value) {
                $map = array('name' => $name);
                $Config->where($map)->setField('value', $value);
            }
        }
        S('DB_CONFIG_DATA',null);
            $this->success('编辑成功。');
    }

    /**
     * 发送测试邮件
     * autor:xjw129xjt
     */
    public function sendTestMail()
    {
        //发送邮件
        $res = $this->send_mail();
        if ($res) {
            $this->success('发送测试邮件成功');
        } else {
            $this->error('发送失败');
        }
    }

    /**
     * 邮箱列表
     * @param string $address
     * autor:xjw129xjt
     */
    public function mailList()
    {
        $address = I('address');
        $map = array('status' => 1);
        if ($address != '')
            $map['address'] = array('like', '%' . $address . '%');
        $mailList = D('MailList')->where($map)->select();
        $this->assign('mailList', $mailList);
        $this->assign('current','list');

        $this->display(T('Addons://Mail@Mail/mailList'));
    }

    /**
     * 添加邮箱
     * @param string $address
     * autor:xjw129xjt
     */
    public function addEmail()
    {
        $address = I('address');
        if (IS_POST) {
            $check =  D('MailList')->where(array('address'=>$address))->find();
            if($check){
                if($check['status']){
                    $this->error('该邮箱已经存在');
                }
                else{
                   $res = D('MailList')->where(array('address'=>$address))->setField('status', 1);
                }
            }else{
                $res = D('MailList')->add(array('address' => $address, 'status' => 1, 'create_time' => time()));
           }
            if ($res) {
                $this->success('添加成功。');
            } else {
                $this->error('添加失败。');
            }


        } else {

            $this->display(T('Addons://Mail@Mail/addEmail'));

        }
    }

    /**删除邮箱
     * @param $ids
     * autor:xjw129xjt
     */
    public function delEmail()
    {
        $ids = I('ids');
        $res = D('MailList')->where(array('id' => array('in', $ids)))->setField('status', 0);
        if ($res) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }


    /**
     * 发送邮件页面
     * @param string $ids
     * autor:xjw129xjt
     */
    public function sendEmail()
    {
        $ids = I('ids');
        $list = D('MailList')->where(array('id' => array('in', $ids)))->select();
        foreach ($list as $k => $v) {
            $address[$v['id']] = $v['address'];
        }
        $data['address'] = implode('; ', $address);
        $this->assign($data);
        $this->display(T('Addons://Mail@Mail/sendEmail'));
    }

    /**
     * 执行发送邮件操作
     * @param $address 地址列表
     * @param string $title 邮件标题
     * @param string $body 邮件正文
     * autor:xjw129xjt
     */
    public function doSendEmail()
    {
        $address = I('address');
        $title =I('title');
        $body = I('body');

        $server_host = "http://" . $_SERVER ['HTTP_HOST'];
        if ($title == '' || $body == '') {
            $this->error('请填写完整！');
        }
        //获取邮件配置信息

        $address = explode('; ', $address);
        //将邮件内容写入数据库
        $data = D('MailHistory')->create();
        $data['create_time'] = time();
        $data['status'] = 1;
        $data['from'] =C('WEB_SITE_NAME');
        $history = D('MailHistory')->add($data);
        //匹配图片地址
        preg_match_all('/src="([^http].*?)"/', $body, $out);
        $body = str_replace($out[1][0], $server_host . $out[1][0], $body);

        if ($address[0] == '') {
            $address = D('MailList')->where(array('status' => 1))->field('address')->select();
            foreach ($address as $k => &$v) {
                $v = $v['address'];
            }
        }

        foreach ($address as $k => $v) {
            if ($token_data = D('MailToken')->where(array('email' => $v))->select()) {
                $token = $token_data[0]['token'];
            } else {
                $token = $this->create_rand(10);
                $data_token['token'] = $token;
                $data_token['email'] = $v;
                D('MailToken')->add($data_token);
            }
            $url = $server_host .addons_url('Mail://Mail/unsubscribe', array('token' => $token));
            //发送邮件

            $body1 = $body . '<hr/><div style="float:right;margin-right: 20px;"><a href="' . $url . '">取消订阅</a></div>';
            $status = $this->send_mail($v, $title, $body1);
            //将发送情况和状态写入数据库
            $data_link['status'] = $status;
            $data_link['mail_id'] = $history;
            $data_link['to'] = $v;
            $link = D('MailHistoryLink')->add($data_link);
        }
        $this->success('邮件发送成功。', addons_url('Mail://Mail/mailList'));
    }

    public function unsubscribe()
    {
        $token = I('token');
        if ($token) {
            $arr = D('MailToken')->where(array('token' => $token))->find();
            $res = D('MailList')->where(array('address' => $arr['email']))->setField('status', 0);
            D('MailToken')->where(array('token' => $token))->delete();
            if ($res) {
                $this->success('取消订阅成功', U('Home/Index/index'));
            } else {
                $this->error('取消订阅失败', U('Home/Index/index'));
            }
        }
    }
    public function subscribe()
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

    /**
     * 邮件发送历史
     * @param string $title
     * autor:xjw129xjt
     */
    public function history()
    {
        $title = I('title');
        $map = array('status' => 1);
        if ($title != '')
            $map['title'] = array('like', '%' . $title . '%');
        $mailList = D('MailHistory')->where($map)->order('create_time desc')->select();
        foreach ($mailList as $k => &$v) {
			$v['title'] = $this->getShortSp($v['title'],20);
            $v['body'] = $this->getShortSp($v['body'],50);
        }
        $this->assign('mailList',$mailList);

        $this->display(T('Addons://Mail@Mail/history'));
    }
	
	/**
     * 字符串截取
     * @param string $title
     * @param string $lenth
     * autor:Marvin9002
     */
    public function getShortSp($title,$lenth=20){
        $str=  substr($title, 0,$lenth);
        if (mb_detect_encoding($str) == 'UTF-8') {//判断内容编码是否为UTF-8
            $str = $str;
        } else {
            $str = iconv('GB2312', 'UTF-8', $str);
        }
        return $str; 
    }

    public function setStatus()
    {
        $ids = I('ids');
        $status = I('get.status');
        $builder = new AdminListBuilder();
        $builder->doSetStatus('mail_history', $ids, $status);

    }

    /**
     * 邮件详情
     * @param string $id
     * autor:xjw129xjt
     */
    public function mailDetail()
    {
        $id = I('id');
        $history = D('MailHistory')->where(array('id' => $id))->find();
        $link = D('MailHistoryLink')->where(array('mail_id' => $id))->select();
        $this->assign('history', $history);
        $this->assign('link', $link);
        $this->display(T('Addons://Mail@Mail/mailDetail'));
    }

    /**
     * 随机生成字符串
     * @param int $length
     * @return string
     * autor:xjw129xjt
     */
    private function create_rand($length = 8)
    {
        $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        $password = '';
        for ($i = 0; $i < $length; $i++) {
            $password .= $chars[mt_rand(0, strlen($chars) - 1)];
        }
        return $password;
    }
	
		/**
	 * 用常规方式发送邮件。
	 */
	function send_mail($to = '', $subject = '', $body = '', $name = '', $attachment = null)
	{
		$from_email = C('MAIL_SMTP_USER');
		$from_name =  C('WEB_SITE_NAME');
		$reply_email = C('MAIL_REPLY_EMAIL');
		$reply_name = C('MAIL_REPLY_NAME');
		//require_once('./ThinkPHP/Library/Vendor/PHPMailer/phpmailer.class.php');增加命名空间，可以注释掉此行
		$mail = new \Vendor\PHPMailer\PHPMailer(); //实例化PHPMailer
		$mail->CharSet = 'UTF-8'; //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码
		$mail->IsSMTP(); // 设定使用SMTP服务
		$mail->SMTPDebug = 0; // 关闭SMTP调试功能
		// 1 = errors and messages
		// 2 = messages only
		$mail->SMTPAuth = true; // 启用 SMTP 验证功能
	
		$mail->SMTPSecure = ''; // 使用安全协议
		$mail->Host = C('MAIL_SMTP_HOST'); // SMTP 服务器
		$mail->Port = C('MAIL_SMTP_PORT'); // SMTP服务器的端口号
		$mail->Username = C('MAIL_SMTP_USER'); // SMTP服务器用户名
		$mail->Password = C('MAIL_SMTP_PASS'); // SMTP服务器密码
		
		$replyEmail = $reply_email?$reply_email:$from_email;
		$replyName = $reply_name?$reply_name:$from_name;
		
		$mail->SetFrom($replyEmail, $replyName);
		
		if ($to == '') {
			$to = C('MAIL_SMTP_CE'); //邮件地址为空时，默认使用后台默认邮件测试地址
		}
		if ($name == '') {
			$name = $replyName; //发送者名称为空时，默认使用网站名称
		}
		if ($subject == '') {
			$subject = C('WEB_SITE_NAME'); //邮件主题为空时，默认使用网站名称
		}
		if ($body == '') {
			$body = C('WEB_SITE_DESCRIPTION'); //邮件内容为空时，默认使用网站描述
		}
		$mail->AddReplyTo($replyEmail, $replyName);
		$mail->Subject = $subject;
		$mail->MsgHTML($body); //解析
		$mail->AddAddress($to, $name);
		if (is_array($attachment)) { // 添加附件
			foreach ($attachment as $file) {
				is_file($file) && $mail->AddAttachment($file);
			}
		}
	
		return $mail->Send() ? true : $mail->ErrorInfo; //返回错误信息
	}

}
