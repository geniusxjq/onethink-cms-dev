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
	
	public function dealAvatar(){
		
		if(''!==$_FILES){
			
			$info=$this->crop();
			
			if($info){
				
			   $return['status'] = 1;
			   $return['info'] ="头像剪裁成功";
			} else {
				$return['status'] = 0;
				$return['info'] =$this->getError();
			}
			
			return $return;
		
		}else{
				
			$info=$this->upload();
			
			if($info){
			   $return['status'] = 1;
			   $return['url'] =$info['path'];
			   
			} else {
				$return['status'] = 0;
				$return['info'] =$this->getError();
			}
			
			return $return;
		
		}
		
	}
	
	public function crop(){
		
		return true;
		
	}

    public function upload(){
		
		$pic_driver = C('PICTURE_UPLOAD_DRIVER');
					 
		$config = array_merge(C('PICTURE_UPLOAD'),array(
			'rootPath' => './Uploads/', //保存根路径			
			'savePath'   =>'Avatar/',
			'saveName'   =>'avatar',
			'autoSub'    => true,
			'subName'    =>UID,
			'replace'=> true,
		));
		         
		/* 调用文件上传组件上传文件 */
		 
        $Upload = new \Think\Upload($config,C('DOWNLOAD_UPLOAD_DRIVER'),C("UPLOAD_{$pic_driver}_CONFIG"));
				
        $info = $Upload->upload($_FILES); 
		
        if($info){
			
			return $result['path']=$config['rootPath'].$info['avatar']['savepath'].$info['avatar']['savename'];
			
        }else{
			
			$this->error=$Upload->getError();
			
        }
		
		return false;
		
    }

}
