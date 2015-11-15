<?php
// +----------------------------------------------------------------------
// | Author: geniusxjq <app880.com>
// +----------------------------------------------------------------------

namespace Ucenter\Model;
use Think\Model;

/**
 * 文档基础模型
 */
class AvatarModel extends Model{
	
	public function _initialize(){
		
		if(!defined('UID')) define('UID',is_login());
		
	}

	public function getAvatar($uid=UID,$order='create_time desc'){
		
		$where['uid']=$uid;
		$where['is_temp']=0;
		$where['status']=1;
		return $this->where($where)->order($order)->find();
		
	}
	
	public function dealAvatar($type=null,$uid=UID){
		
		if($type=='crop'){
						
			$info=$this->crop(I('post.path',''),I('post.crop','0,0,128,128'),I('post.saveImgSize','128,128'),$uid);
			
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
	
	public function crop($img,$crop,$wh='128,128',$uid=UID){
		
		 if(!$crop){
			 
			 $this->error="请选择剪裁区域";
			 
			 return false; 
			 
		 }
		 
		 if(!$img){
			 
			 $this->error="没有指定图片文件路径";
				 
			 return false; 
		 
		 }
		 
		 $img=(substr($img,0,1)=='.'?'':'.').$img;
		 
		 $IMG=new \Think\Image;
		 
		 $IMG->open($img);

		 list($x,$y,$w,$h)=explode(',',$crop);//解析获取剪裁区域
		 
		 list($width,$height)=explode(',',$wh);//解析获取保存图片的高度
		 
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
			 
			 $IMG->save($img);
		 }
		 
		 $where['uid']=$uid;
		 
		 $where['is_temp']=1;
		 
		 $this->where($where)->save(array('is_temp'=>0));
		 
		 return true;
		
	}

    public function upload($files,$uid=UID){
						
		$pic_driver = C('PICTURE_UPLOAD_DRIVER');
		
		$config=array(
			'rootPath' => './Uploads/', //保存根路径			
			'savePath'   =>'Avatar/',
			'saveName'   =>'avatar_'.NOW_TIME,
			'autoSub'    => true,
			'subName'    =>$uid,
			'replace'=> true,
		);
					 
		$config =array_merge(C('PICTURE_UPLOAD'),$config);
		$config['callback'] = array($this, 'isFile');	
		$config['removeTrash'] = array($this, 'removeTrash');
		/* 调用文件上传组件上传文件 */
		 
        $Upload = new \Think\Upload($config,C('DOWNLOAD_UPLOAD_DRIVER'),C("UPLOAD_{$pic_driver}_CONFIG"));
		
		$Storage=new \Think\Storage(C("DOWNLOAD_UPLOAD_DRIVER"));
				
        $info = $Upload->upload($files); 
		
        if($info){
			
			if($info['file']['id']){
				
				return $info['file']['path'];
			
			}
			
			$path=substr($config['rootPath'],1).$info['file']['savepath'].$info['file']['savename'];
			
			$data=array('path'=>$path,'uid'=>$uid,'status'=>1,'create_time'=>NOW_TIME,'is_temp'=>1,'md5'=>$info['file']['md5']);
			
		   $_count=strval($this->where('uid='.$uid)->count());
		   
		   $_temp_where['uid']=$uid;
		   
		   $_temp_where['is_temp']=1;
		   
		   $_temp_count=strval($this->where($_temp_where)->count());
		   
		   if($_temp_count>0){
		   
			   $where['is_temp']=1;
		   
		   }else{
			   
			   $where['is_temp']=0;
			   
		   }
			   
		   $res=$this->create($data);
		   
		   if($res&&($_count<2)&&($where['is_temp']==0)){
			   
			   $res=$this->add();
			   
		   }else{
			   
			  $where['uid']=$uid;
			  
			  $_data=$this->where($where)->order('create_time asc')->find();
			  
			  if($_data){
				   
				   $Storage::unlink('.'.$_data['path']);
				   $_data['uid']=$uid;
				   $_data['path']=$path;
				   $_data['is_temp']=1;
				   $_data['create_time']=NOW_TIME;
				   $_data['status']=1;
				   $_data['md5']=$data['md5'];
				   $res=$this->save($_data);
			   
			   }else{
			   
			     $res=false;
			   
			   }
			   
		   }
		   
		   if(!$res||$res==0){
								
				$Storage::unlink('.'.$path);
			
				$this->error="图片上传成功，但数据记录保存失败 错误：".$this->getError();
				
			    return false; 
			
			}
			
			return $path;
			
        }else{
			
			$this->error=$Upload->getError();
			
        }
		
		return false;
		
    }
	/**
	 * 检测当前上传的文件是否已经存在
	 * @param  array   $file 文件上传数组
	 * @return boolean       文件信息， false - 不存在该文件
	 */
	public function isFile($file){
		if(empty($file['md5'])){
			throw new Exception('缺少参数:md5');
		}
		/* 查找文件 */
		$map ['md5']=$file['md5'];
		$map ['is_temp']=1;
		
		return $this->field(true)->where($map)->find();
	}
	/**
	 * 清除数据库存在但本地不存在的数据
	 * @param $data
	 */
	public function removeTrash($data){
		$this->where(array('id'=>$data['id'],))->delete();
	}
}
