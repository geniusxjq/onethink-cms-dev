<?php

namespace Addons\Diyform;
use Common\Controller\Addon;
use Think\Model;
/**
 * 自定义表单插件
 * @author 凡人
 */

    class DiyformAddon extends Addon{

        public $info = array(
            'name'=>'Diyform',
            'title'=>'自定义表单',
            'description'=>'简单的自定义表单',
            'status'=>1,
            'author'=>'凡人',
            'version'=>'0.1'
        );

        public $admin_list = array(
            'model'=>'diyform',		//要查的表
            'fields'=>'*',			//要查的字段
            'map'=>'',				//查询条件, 如果需要可以再插件类的构造方法里动态重置这个属性
            'order'=>'id desc',		//排序,
            'list_grid'=>array( 		//这里定义的是除了id序号外的表格里字段显示的表头名和模型一样支持函数和链接
                'diyname:表单名称:[EDIT]',
                'table_name:数据表名',
                'id:操作:[EDIT]|编辑,[DELETE]|删除'
            ),
        );
        
        public $custom_adminlist = 'diyform_list.html';
        public function install(){
            //读取SQL文件
            $sql = file_get_contents(__DIR__.'/install.sql');
            $sql = str_replace("\r", "\n", $sql);
            $sql = explode(";\n", $sql);
            // 替换表前缀
            $orginal = 'xy_';
            $prefix = C ( 'DB_PREFIX' );
            $sql = str_replace ( "{$orginal}", "{$prefix}", $sql );
            
            $md = new Model();
            
            foreach ($sql as $value) {
                $value = trim($value);
                if(empty($value)) continue;
                $md->execute($value);
            }
            return true;
        }

        public function uninstall(){
            //读取SQL文件
            $sql = file_get_contents(__DIR__.'/uninstall.sql');
            $sql = str_replace("\r", "\n", $sql);
            $sql = explode(";\n", $sql);
            // 替换表前缀
            $orginal = 'xy_';
            $prefix = C ( 'DB_PREFIX' );
            $sql = str_replace ( "{$orginal}", "{$prefix}", $sql );
            $md = new Model();
            
            foreach ($sql as $value) {
                $value = trim($value);
                if(empty($value)) continue;
                $md->execute($value);
            }
            return true;
        }

        //实现的DiyFormList钩子方法
        public function DiyFormList($param){

        }
        //实现的DiyFormPost钩子方法
        public function DiyFormPost($param){

        }

    }