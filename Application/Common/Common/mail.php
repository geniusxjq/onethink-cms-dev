<?php

// +----------------------------------------------------------------------
// | Author: genisuxjq <app880@foxmail.com> <http://www.app880.com>
// +----------------------------------------------------------------------

	/**
 * 用常规方式发送邮件。
 */
function sendMail($to = '', $subject = '', $body = '', $name = '', $attachment = null){

	$from_email = C('MAIL_SMTP_USER');
	$from_name =  C('WEB_SITE_NAME');
	$reply_email = C('MAIL_REPLY_EMAIL');
	$reply_name = C('MAIL_REPLY_NAME');
	$mail_type=C('MAIL_TYPE');
	$mail_host = C('MAIL_SMTP_HOST'); // SMTP 服务器
	$mail_port = C('MAIL_SMTP_PORT'); // SMTP服务器的端口号
	$mail_username = C('MAIL_SMTP_USER'); // SMTP服务器用户名
	$mail_password = C('MAIL_SMTP_PASS'); // SMTP服务器密码
	
	//如果SMTP方式下服务器信息不完整则不执行发送
	if($mail_type==0&&(!$mail_host||!$mail_port||!$mail_username||!$mail_password)){
	  
		return false;
	
	}

	$mail = new \Vendor\PHPMailer\PHPMailer(); //实例化PHPMailer
	$mail->CharSet = 'UTF-8'; //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码
	$mail->IsSMTP(); // 设定使用SMTP服务
	$mail->SMTPDebug = 0; // 关闭SMTP调试功能
	$mail->SMTPAuth = true; // 启用 SMTP 验证功能
	$mail->SMTPSecure = ''; // 使用安全协议
	$mail->Host =$mail_host; // SMTP 服务器
	$mail->Port = $mail_port; // SMTP服务器的端口号
	$mail->Username =$mail_username; // SMTP服务器用户名
	$mail->Password =$mail_password; // SMTP服务器密码
	
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
