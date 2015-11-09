<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Ucenter\Model;
use Think\Model;
use User\Api\UserApi;

/**
 * 文档基础模型
 */
class AvatarModel extends Model{

    /* 用户模型自动完成 */
    protected $_auto = array(
        array('login', 0, self::MODEL_INSERT),
        array('reg_ip', 'get_client_ip', self::MODEL_INSERT, 'function', 1),
        array('reg_time', NOW_TIME, self::MODEL_INSERT),
        array('last_login_ip', 0, self::MODEL_INSERT),
        array('last_login_time', 0, self::MODEL_INSERT),
        array('status', 1, self::MODEL_INSERT),
    );

    /**
     * 登录指定用户
     * @param  integer $uid 用户ID
     * @return boolean      ture-登录成功，false-登录失败
     */
    public function upload($file){
		$config = array(
            'maxSize'    =>    2*1024*1024,
            'rootPath'   =>    './Uploads/',
            'savePath'   =>    'water/',
            'saveName'   =>    'water',
            'exts'       =>    array('jpg', 'gif', 'png', 'jpeg'),
            'autoSub'    =>    true,
            'subName'    =>    '',
            'replace'=> true,
        );
        $upload = new \Think\Upload($config);// 实例化上传类
        $info   =   $upload->upload($_FILES);
        if($info){
            $return['status'] = 1;
            $return['url'] = './Uploads/water/'.$info['download']['savename'];
        }else{
            $return['status'] = 0;
            $return['info'] = '上传失败';
        }

        $this->ajaxReturn($return);
    }

}
