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

/**
 * 文档基础模型
 */
class AvatarModel extends Model{

    /* 用户模型自动完成 */
    protected $_auto = array(
        array('status', 1, self::MODEL_INSERT),
        array('create_time', NOW_TIME, self::MODEL_INSERT),
    );

    public function upload($files, $setting, $driver = 'Local', $config = null){
        
		/* 调用文件上传组件上传文件 */
		 
        $Upload = new \Think\Upload($setting,$driver,$config);
				
        $info = $Upload->upload($files); 
		
        if($info){
			return $info;
        }else{
			$this->error = $Upload->getError();
			return false;
        }
       
    }

}
