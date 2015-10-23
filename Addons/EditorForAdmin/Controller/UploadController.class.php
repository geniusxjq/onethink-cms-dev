<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: huajie <banhuajie@163.com>
// +----------------------------------------------------------------------

namespace Addons\EditorForAdmin\Controller;
use Home\Controller\AddonsController;
use Think\Upload;

class UploadController extends AddonsController{

	public $uploader = null;
	
	/*水印*/
	public function dealWater($path){
		/*钩子调用水印插件*/
		hook("dealPicture",$path);
		
	}

	/* 上传图片 */
	public function upload(){
		session('upload_error', null);
		/* 上传配置 */
		$setting = C('EDITOR_UPLOAD');

		/* 调用文件上传组件上传文件 */
		$this->uploader = new Upload($setting, 'Local');
		$info   = $this->uploader->upload($_FILES);
		if($info){
			$url = C('EDITOR_UPLOAD.rootPath').$info['imgFile']['savepath'].$info['imgFile']['savename'];
			$url = str_replace('./', '/', $url);
			$info['fullpath'] = __ROOT__.$url;
			/*水印*/
			$this->dealWater($info['fullpath']);
		}
		session('upload_error', $this->uploader->getError());
		return $info;
	}

	//keditor编辑器上传图片处理
	public function ke_upimg(){
		/* 返回标准数据 */
		$return  = array('error' => 0, 'info' => '上传成功', 'data' => '');
		$img = $this->upload();
		/* 记录附件信息 */
		if($img){
			$return['url'] = $img['fullpath'];
			unset($return['info'], $return['data']);
		} else {
			$return['error'] = 1;
			$return['message']   = session('upload_error');
		}
		/* 返回JSON数据 */
		exit(json_encode($return));
	}

	//ueditor编辑器上传图片处理
	public function ue_upimg(){
		$img = $this->upload();
		$return = array();
		$return['url'] = $img['fullpath'];
		$title = htmlspecialchars($_POST['pictitle'], ENT_QUOTES);
		$return['title'] = $title;
		$return['original'] = $img['imgFile']['name'];
		$return['state'] = ($img)? 'SUCCESS' : session('upload_error');
		/* 返回JSON数据 */
		$this->ajaxReturn($return);
	}
	
	//ueditor编辑器上传图片处理
	public function ue_img_manager(){
		
		header("Content-Type: text/html; charset=utf-8");
		error_reporting( E_ERROR | E_WARNING );
	
		//需要遍历的目录列表，最好使用缩略图地址，否则当网速慢时可能会造成严重的延时
		$paths = array(C('EDITOR_UPLOAD.rootPath'));
	
		$action = htmlspecialchars( $_POST[ "action" ] );
		if ( $action == "get" ) {
			$files = array();
			foreach ( $paths as $path){
				$tmp = $this->ue_img_manager_getfiles( $path );
				if($tmp){
					$files = array_merge($files,$tmp);
				}
			}
			if ( !count($files) ) return;
			rsort($files,SORT_STRING);
			$str = "";
			foreach ( $files as $file ) {
				$file=str_replace('./','/',$file);
				$str .= $file . "ue_separate_ue";
			}
			echo $str;
		}
    
	}
	
	/**ueditor编辑器上传图片处理
     * 遍历获取目录下的指定类型的文件
     * @param $path
     * @param array $files
     * @return array
     */
    public function ue_img_manager_getfiles( $path , &$files = array() )
    {
        if ( !is_dir( $path ) ) return null;
        $handle = opendir( $path );
        while ( false !== ( $file = readdir( $handle ) ) ) {
            if ( $file != '.' && $file != '..' ) {
                $path2 = $path . '/' . $file;
                if ( is_dir( $path2 ) ) {
                    $this->ue_img_manager_getfiles( $path2 , $files );
                } else {
                    if ( preg_match( "/\.(gif|jpeg|jpg|png|bmp)$/i" , $file ) ) {
                        $files[] = $path2;
                    }
                }
            }
        }
        return $files;
    }
	
}
