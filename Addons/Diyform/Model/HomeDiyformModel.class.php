<?php

namespace Addons\Diyform\Model;
use Think\Model;

class HomeDiyformModel extends Model{
    protected $tableName = 'diyform';
    private $formInfo;
    public function SaveData($formInfo){
        $this->formInfo = $formInfo;
        if (empty($formInfo['table_name'])) {
            $this->error = '数据提交失败！';
            return false;
        }
        $Model = M($formInfo['table_name']);
        $this->checkFormAttr($Model, $formInfo['id']);
        /* 获取数据对象 */
        $data = $Model->create();
        if(empty($data)){
            $this->error = $Model->getError();
            return false;
        }
        $data['create_at'] = NOW_TIME;
        $id = $Model->add($data);
        if (!$id) {
            $this->error = '数据提交失败！';
            return false;
        }
        return true;
    }
    
    public function getDetail($id, $formInfo){
        $this->formInfo = $formInfo;
        if (empty($formInfo['table_name'])) {
            return false;
        }
        if ($formInfo['public'] == 1) {
            $where = array("ifcheck" => 1);
        }else {
            $where = array();
        }
        $Model = M($formInfo['table_name']);
        return $Model->where($where)->find($id);
    }
    public function checkFormAttr($Model, $form_id){
        $fields     = $this->get_form_fields($form_id, false);
        $validate   =   $auto   =   array();
        foreach($fields as $key=>$attr){
            if($attr['is_must']){// 必填字段
                $validate[]  =  array($attr['name'],'require',$attr['title'].'必须填写!',self::MUST_VALIDATE , 'regex', self::MODEL_BOTH);
            }
            // 自动验证规则
            if(!empty($attr['validate_rule'])) {
                $validate[]  =  array($attr['name'],$attr['validate_rule'],$attr['error_info']?$attr['error_info']:$attr['title'].'验证错误',0,$attr['validate_type'],$attr['validate_time']);
            }
            // 自动完成规则
            if(!empty($attr['auto_rule'])) {
                $auto[]  =  array($attr['name'],$attr['auto_rule'],$attr['auto_time'],$attr['auto_type']);
            }elseif('checkbox'==$attr['type']){ // 多选型
                $auto[] =   array($attr['name'],'arr2str',3,'function');
            }elseif('datetime' == $attr['type'] || 'date' == $attr['type']){ // 日期型
                $auto[] =   array($attr['name'],'strtotime',3,'function');
            }
        }
        $validate   =   array_merge($validate,$this->_validate);
        $auto       =   array_merge($auto,$this->_auto);
        
        return $Model->validate($validate)->auto($auto);
    }
    
    public function get_form_fields($form_id, $group = true, $fields=true){
        static $list;

        /* 非法ID */
        if(empty($form_id) || !is_numeric($form_id)){
            return '';
        }

        /* 获取属性 */
        if(!isset($list[$form_id])){
            $map = array('form_id'=>$form_id);
            $info = M('DiyformFields')->where($map)->field($fields)->select();
            $list[$form_id] = $info;
        }

        $attr   = array();
        $model  = empty($this->formInfo) ? M("Diyform")->find($form_id) : $this->formInfo;
        if($group){
            foreach ($list[$form_id] as $value) {
                $attr[$value['id']] = $value;
            }
            if (empty($model['field_sort'])) { //未排序
                $group = array(1 => array_merge($attr));
            } else {
                $group = json_decode($model['field_sort'], true);

                $keys = array_keys($group);
                foreach ($group as &$value) {
                    foreach ($value as $key => $val) {
                        $value[$key] = $attr[$val];
                        unset($attr[$val]);
                    }
                }

                if (!empty($attr)) {
                    $group[$keys[0]] = array_merge($group[$keys[0]], $attr);
                }
            }

            $attr = $group;
        }else{
            foreach ($list[$form_id] as $value) {
                $attr[$value['name']] = $value;
            }
        }
        return $attr;
    }
}
