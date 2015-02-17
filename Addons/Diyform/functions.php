<?php

if (!function_exists("get_diyform_field")) {
    /* 解析自定义表单数据列表定义规则*/
    function get_diyform_field($data, $grid, $form_id){
        // 获取当前字段数据
        foreach($grid['field'] as $field){
            $array  =   explode('|',$field);
            $temp  =    $data[$array[0]];
            // 函数支持
            if(isset($array[1])){
                $temp = call_user_func($array[1], $temp);
            }
            $data2[$array[0]]    =   $temp;
        }
        if(!empty($grid['format'])){
            $value  =   preg_replace_callback('/\[([a-z_]+)\]/', function($match) use($data2){return $data2[$match[1]];}, $grid['format']);
        }else{
            $value  =   implode(' ',$data2);
        }

        // 链接支持
        if(!empty($grid['href'])){
            $links  =   explode(',',$grid['href']);
            foreach($links as $link){
                $array  =   explode('|',$link);
                $href   =   $array[0];
                if(preg_match('/^\[([a-z_]+)\]$/', $href, $matches)){
                    $val[]  =   $data2[$matches[1]];
                }else{
                    $show   =   isset($array[1])?$array[1]:$value;
                    // 替换系统特殊字符串
                    $href   =   str_replace(
                        array('[VIEW]', '[FORMID]'),
                        array('Diyform://HomeDiyform/view?ids=[id]&form_id=[FORMID]', $form_id),
                        $href);

                    // 替换数据变量
                    $href   =   preg_replace_callback('/\[([a-z_]+)\]/', function($match) use($data){return $data[$match[1]];}, $href);
                    $val[]  =   '<a target="_blank" href="'.addons_url($href).'">'.$show.'</a>';
                }
            }
            $value  =   implode(' ',$val);
        }
        return $value;
    }
}


if (!function_exists("parse_diyform_field_attr")) {
    function parse_diyform_field_attr($string) {
        if(0 === strpos($string,':')){
            // 采用函数定义
            return   eval('return '.substr($string,1).';');
        }elseif(0 === strpos($string,'[')){
            // 支持读取配置参数（必须是数组类型）
            return C(substr($string,1,-1));
        }

        $array = preg_split('/[,;\r\n]+/', trim($string, ",;\r\n"));
        if(strpos($string,':')){
            $value  =   array();
            foreach ($array as $val) {
                list($k, $v) = explode(':', $val);
                $value[$k]   = $v;
            }
        }else{
            $value  =   $array;
        }
        return $value;
    }
}
if (!function_exists("get_diyform_attribute_type")) {
    // 获取属性类型信息
    function get_diyform_attribute_type($type=''){
        static $_type = array(
            'num'       =>  array('数字','int(10) UNSIGNED NOT NULL'),
            'string'    =>  array('字符串','varchar(255) NOT NULL'),
            'textarea'  =>  array('文本框','text NOT NULL'),
            'date'      =>  array('日期','int(10) NOT NULL'),
            'datetime'  =>  array('时间','int(10) NOT NULL'),
            'bool'      =>  array('布尔','tinyint(2) NOT NULL'),
            'select'    =>  array('枚举','char(50) NOT NULL'),
            'radio'     =>  array('单选','char(10) NOT NULL'),
            'checkbox'  =>  array('多选','varchar(100) NOT NULL'),
            'editor'    =>  array('编辑器','text NOT NULL'),
            //'picture'   =>  array('上传图片','int(10) UNSIGNED NOT NULL'),
            //'file'      =>  array('上传附件','int(10) UNSIGNED NOT NULL'),
            //'pictures'   =>  array('上传多图','varchar(255) NOT NULL'),
        );
        return $type?$_type[$type][0]:$_type;
    }
}