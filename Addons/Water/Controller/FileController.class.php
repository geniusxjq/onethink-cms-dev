<?php
/**
 *
 * @author quick
 *
 */
namespace Addons\Water\Controller;

use Admin\Controller\AddonsController;

class FileController extends AddonsController
{

    public function uploadPicture(){
		
        $config = array(
			'rootPath' => './Uploads/', //保存根路径			
            'savePath'   =>'Water/',
            'saveName'   =>'Water',
            'autoSub'    => true,
            'subName'    =>'',
            'replace'=> true,
        );
		
        /* 调用文件上传组件上传文件 */
		 
		$pic_driver = C('PICTURE_UPLOAD_DRIVER');
		 
        $Picture = new \Think\Upload(array_merge(C('PICTURE_UPLOAD'),$config),C('PICTURE_UPLOAD_DRIVER'),C("UPLOAD_{$pic_driver}_CONFIG"));
				
        $info = $Picture->upload($_FILES); 
		
        if($info){
            $return['status'] = 1;
            $return['url'] =$config['rootPath'].$config['savePath'].$info['download']['savename'];
        }else{
            $return['status'] = 0;
            $return['info'] = '上传失败';
        }

        $this->ajaxReturn($return);
    }

}