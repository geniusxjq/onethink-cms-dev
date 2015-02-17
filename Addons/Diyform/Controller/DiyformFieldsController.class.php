<?php

namespace Addons\Diyform\Controller;
use Admin\Controller\AddonsController;
class DiyformFieldsController extends AddonsController{
    private $FieldsModel;
    public function _initialize() {
        parent::_initialize();
        include_once './Addons/Diyform/functions.php';
        $this->FieldsModel = D ( 'Addons://Diyform/DiyformFields' );
    }
    
    public function index(){
        $form_id = I('get.form_id');
        /* 查询条件初始化 */
        $map['form_id']    =   $form_id;
        $list = $this->lists('DiyformFields', $map);
        int_to_string($list);
        
        $form_name = D ( 'Addons://Diyform/Diyform' )->getFormName($form_id);
        // 记录当前列表页的cookie
        Cookie('__forward__',       $_SERVER['REQUEST_URI']);
        $this->assign('_list',      $list);
        $this->assign('form_id',   $form_id);
        $this->assign('form_name',   $form_name);
        $this->meta_title = '字段列表';
        $this->display(T("Addons://Diyform@DiyformFields/list"));
    }
    
    public function add(){
        $form_id   =   I('get.form_id');
        $Form     =  D ( 'Addons://Diyform/Diyform' )->getFormInfo($form_id);
        $this->assign('form',$Form);
        $this->assign('info', array('form_id'=>$form_id));
        $this->meta_title = '新增自动';
        $this->display(T("Addons://Diyform@DiyformFields/edit"));
    }
    
   
    public function edit(){
        $id = I('get.id','');
        if(empty($id)){
            $this->error('参数不能为空！');
        }

        /*获取一条记录的详细数据*/
        $data = $this->FieldsModel->field(true)->find($id);
        if(!$data){
            $this->error($this->FieldsModel->getError());
        }
        $Form     =  D ( 'Addons://Diyform/Diyform' )->getFormInfo($data['form_id']);
        $this->assign('form',$Form);
        $this->assign('info', $data);
        $this->meta_title = '编辑字段';
        $this->display(T("Addons://Diyform@DiyformFields/edit"));
    }
   
    public function update(){
        $res = $this->FieldsModel->update();
        if(!$res){
            $this->error($this->FieldsModel->getError());
        }else{
            $this->success($res['id']?'更新成功':'新增成功', Cookie('__forward__'));
        }
    }
    
    
    public function remove(){
        $id = I('id');
        empty($id) && $this->error('参数错误！');

        $info = $this->FieldsModel->getById($id);
        empty($info) && $this->error('该字段不存在！');

        //删除属性数据
        $res = $this->FieldsModel->delete($id);

        //删除表字段
        $this->FieldsModel->deleteField($info);
        if(!$res){
            $this->error($this->FieldsModel->getError());
        }else{
            //记录行为
            action_log('update_diyformFields', 'diyformfields', $id, UID);
            $this->success('删除成功', addons_url('Diyform://DiyformFields/index', array('form_id' => $info['form_id'])));
        }
    }
}
