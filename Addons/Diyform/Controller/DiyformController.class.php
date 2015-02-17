<?php

namespace Addons\Diyform\Controller;
use Admin\Controller\AddonsController;

class DiyformController extends AddonsController{
    private $DiyModel;
    public function _initialize() {
        parent::_initialize();
        include_once './Addons/Diyform/functions.php';
        $this->DiyModel = D ( 'Addons://Diyform/Diyform' );
    }
    
    public function form_data_list() {
        $id = I('get.form_id','');
        if(empty($id)){
            $this->error('参数不能为空！');
        }
        $formInfo = $this->DiyModel->getFormInfo($id);
        if (empty($formInfo)) {
            $this->error('自定义表单不存在！');
        }
        //解析列表规则
        $fields =	array();
        $grids  =	preg_split('/[;\r\n]+/s', trim($formInfo['list_grid']));
        foreach ($grids as &$value) {
            // 字段:标题:链接
            $val      = explode(':', $value);
            // 支持多个字段显示
            $field   = explode(',', $val[0]);
            $value    = array('field' => $field, 'title' => $val[1]);
            if(isset($val[2])){
                // 链接信息
                $value['href']  =   $val[2];
                // 搜索链接信息中的字段信息
                preg_replace_callback('/\[([a-z_]+)\]/', function($match) use(&$fields){$fields[]=$match[1];}, $value['href']);
            }
            if(strpos($val[1],'|')){
                // 显示格式定义
                list($value['title'],$value['format'])    =   explode('|',$val[1]);
            }
            foreach($field as $val){
                $array  =   explode('|',$val);
                $fields[] = $array[0];
            }
        }
        $fields[] = "id";
        $fields[] = "ifcheck";
        $fields[] = "create_at";
        $field = array_unique($fields);
        $list = $this->lists($formInfo["table_name"]);
        $this->meta_title = $formInfo['diyname'];
        $this->assign('title', $formInfo['diyname']);
        $this->assign('form_id', $formInfo['id']);
        $this->assign('_list', $list);
        $this->assign('list_grid', $grids);
        $this->display(T("Addons://Diyform@Diyform/form_data_list"));
    }
    
    public function make_encode () {
        $chars='abcdefghigklmnopqrstuvwxwyABCDEFGHIGKLMNOPQRSTUVWXWY0123456789';
        $hash='';
        $length = rand(28,32);
        $max = strlen($chars) - 1;
        for($i = 0; $i < $length; $i++) {
            $hash .= $chars[mt_rand(0, $max)];
        }
        echo $hash;
        exit();
    }
    
    public function edit(){
        $id = I('get.id','');
        if(empty($id)){
            $this->error('参数不能为空！');
        }

        /*获取一条记录的详细数据*/
        $data = $this->DiyModel->field(true)->find($id);
        if(!$data){
            $this->error($this->DiyModel->getError());
        }
        $data['attribute_list'] = empty($data['attribute_list']) ? '' : explode(",", $data['attribute_list']);
        $fields = M('DiyformFields')->where(array('form_id'=>$data['id']))->getField('id,name,title,is_show',true);
        $fields = empty($fields) ? array() : $fields;
        
        // 梳理属性的可见性
        foreach ($fields as $key=>$field){
            if (!empty($data['attribute_list']) && !in_array($field['id'], $data['attribute_list'])) {
                $fields[$key]['is_show'] = 0;
            }
        }
        
        // 获取模型排序字段
        $field_sort = json_decode($data['field_sort'], true);
        if(!empty($field_sort)){
            foreach($field_sort as $group => $ids){
                foreach($ids as $key => $value){
                    $fields[$value]['group']  =  $group;
                    $fields[$value]['sort']   =  $key;
                }
            }
        }
        
        // 模型字段列表排序
        $fields = list_sort_by($fields,"sort");
        
        $this->assign('fields', $fields);
        $this->assign('info', $data);
        $this->meta_title = '编辑模型';
        $this->display(T("Addons://Diyform@Diyform/edit"));
    }
    
    public function update(){
        $res = $this->DiyModel->update();
        if(!$res){
            $this->error($this->DiyModel->getError());
        }else{
            $this->success($res['id']?'更新自定义表单成功':'新增自定义表单成功', Cookie('__forward__'));
        }
    }
    
    public function del() {
        $form_id = I("get.form_id");
        if(empty($form_id)){
            $this->error('参数不能为空！');
        }
        $formInfo = $this->DiyModel->getFormInfo($form_id);
        if (empty($formInfo)) {
            $this->error('自定义表单不存在！');
        }
        $ids = array_unique((array)I('ids',0));

        if ( empty($ids) ) {
            $this->error('请选择要操作的数据!');
        }

        if(empty($formInfo['table_name'])){
            $this->error('自定义表单信息错误！');
        }
        $Model = M($formInfo['table_name']);
        $map = array('id' => array('in', $ids) );
        if($Model->where($map)->delete()){
            $this->success('删除成功');
        } else {
            $this->error('删除失败！');
        }
    }
    
    public function setIfcheck() {
        $form_id = I("get.form_id");
        if(empty($form_id)){
            $this->error('参数不能为空！');
        }
        $formInfo = $this->DiyModel->getFormInfo($form_id);
        if (empty($formInfo)) {
            $this->error('自定义表单不存在！');
        }
        $ids = array_unique((array)I('ids',0));

        if ( empty($ids) ) {
            $this->error('请选择要操作的数据!');
        }

        if(empty($formInfo['table_name'])){
            $this->error('自定义表单信息错误！');
        }
        $Model = M($formInfo['table_name']);
        $map = array('id' => array('in', $ids) );
        if($Model->where($map)->setField('ifcheck', 1)){
            $this->success('审核成功');
        } else {
            $this->error('审核失败！');
        }
    }
}
