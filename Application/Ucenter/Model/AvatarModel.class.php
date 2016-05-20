<?php
// +----------------------------------------------------------------------
// | Author: geniusxjq <app880.com>
// +----------------------------------------------------------------------

namespace Ucenter\Model;
use Think\Model;
use Think\Storage;

/**
 * 文档基础模型
 */
class AvatarModel extends Model{
	
	public $upload_config=array(
		'rootPath' => './Uploads/',//保存根路径		
		'savePath'   =>'Avatar/',
		'saveName'   =>'avatar_',
		'saveExt'  => 'jpg', 
		'autoSub'    => true,
		'replace'=> true
	);
		
	public function _initialize(){
		
		if(!defined('UID')) define('UID',is_login());
		
	}

	public function getAvatar($uid=UID){
		
		$_conf=$this->upload_config;
		
		$_url=$_conf['rootPath'].$_conf['savePath'].$uid.'/'.$_conf['saveName'].$uid.'.'.$_conf['saveExt'];
		
		if(Storage::has($_url)) {
			
			if(substr($_url,0,1)=='.'){
				
				$_url=substr($_url,1);
				
			}
			
		    return $_url;
		
		}
		
		return false;
		
	}
	
	public function dealAvatar($type=null,$uid=UID){
		
		if($type=='crop'){
						
			$info=$this->crop(I('post.path',''),I('post.crop_rect','0,0,128,128'),I('post.crop_size','128,128'),$uid);
			
			if($info){
			   $return['status'] = 1;
			   $return['info'] ="头像剪裁成功";
			} else {
				$return['status'] = 0;
				$return['info'] =$this->getError();
			}
			
			return $return;
		
		}
		
		if($type=='file'){
				
			$info=$this->upload($_FILES);
			
			if($info){
			   $return['status'] = 1;
			   $return['info'] ="头像上传成功";
			   $return['url'] =$info;
			} else {
				$return['status'] = 0;
				$return['info'] =$this->getError();
			}
			
			return $return;
		
		}
		
	}
	
	public function crop($img_path,$crop_rect,$crop_size='128,128',$uid=UID){
		 
		 if(!$crop_rect){
			 
			 $this->error="请选择剪裁区域";
			 
			 return false; 
			 
		 }
		 
		 if(!$img_path){
			 
			 $this->error="没有指定图片文件路径";
				 
			 return false; 
		 
		 }
		 
		 $img=(substr($img_path,0,1)=='.'?'':'.').$img_path;
		 
		 if(!Storage::has($img)){
			 
			 $this->error="指定的图片文件不存在";
				 
			 return false; 
		 
		 }
		 
		 $IMG=new \Think\Image;
		 
		 $IMG->open($img);

		 list($x,$y,$w,$h)=explode(',',$crop_rect);//解析获取剪裁区域
		 
		 list($width,$height)=explode(',',$crop_size);//解析获取保存图片的高度
		 
		 //生成将单位换算成为像素
		 
		 $_w=$IMG->width();
		 $_h=$IMG->height();
		 
		 $x = $x * $_w;
		 $y = $y * $_h;
		 $w = $w * $_w;
		 $h = $h* $_h;
		 
		 //如果宽度和高度近似相等，则令宽和高一样
		 
		 if (abs($h - $w) < $h * 0.01) {
			$h = min($h, $w);
			$w = $h;
		 }
		 
		 if($_w>$width||$_h>$height){
			 $IMG->crop($w,$h,$x,$y,$width,$height);
			 $IMG->save(preg_replace('/'.$this->upload_config['saveName'].'temp'.'/',$this->upload_config['saveName'].$uid,$img));
		 }
		 
		 return true;
		 
	}

    public function upload($files,$uid=UID){
		
		$pic_driver = C('PICTURE_UPLOAD_DRIVER');	
			
		$_conf=$this->upload_config;
		
		$config =array_merge(C('PICTURE_UPLOAD'),$_conf);
		
		$config =array_merge($config,array(		
			'saveName'   =>$_conf['saveName'].'temp',
			'subName'    =>$uid,
			)
		);
		
		/* 调用文件上传组件上传文件 */
		 
        $Upload = new \Think\Upload($config,$pic_driver,C("UPLOAD_".$pic_driver."_CONFIG"));
		
        $info = $Upload->upload($files); 
		
        if($info){
			
			if($info['file']['id']){
				
				return $info['file']['path'];
			
			}
			
			$path=substr($config['rootPath'],1).$info['file']['savepath'].$info['file']['savename'];
			
			return $path;
			
        }else{
			
			$this->error=$Upload->getError();
			
        }
		
		return false;
		
    }
	
}
