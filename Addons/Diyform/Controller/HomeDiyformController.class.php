<?php

namespace Addons\Diyform\Controller;
use Home\Controller\AddonsController;
class HomeDiyformController extends AddonsController{
    private $listtmaplate = "list";//列表模板
    private $posttmaplate = "post";//发布模板
    private $viewtmaplate = "view";//内容模板
    private $formInfo     = NULL;
    private $formFields   = "";
    private $form_id      = 0;
    private $table_name   = "";
    private $list_grid   = "";
    public function _initialize() {
        parent::_initialize();
        include_once './Addons/Diyform/functions.php';
        $this->form_id  = I("get.form_id", 0, "intval");
        if(empty($this->form_id)){
            $this->error('自定义表单ID有误！');
        }
        $this->formInfo = D ('Addons://Diyform/Diyform' )->getFormInfo($this->form_id);
		
        if (empty($this->formInfo)) {
            $this->error('自定义表单不存在！');
        }
        $this->table_name = $this->formInfo['table_name'];
        $this->listtmaplate = empty($this->formInfo['listtmaplate']) ? "list" : $this->formInfo['listtmaplate'];
        $this->posttmaplate = empty($this->formInfo['posttmaplate']) ? "post" : $this->formInfo['posttmaplate'];
        $this->viewtmaplate = empty($this->formInfo['viewtmaplate']) ? "view" : $this->formInfo['viewtmaplate'];
       
        //解析列表规则
        $fields =	array();
        $grids  =	preg_split('/[;\r\n]+/s', trim($this->formInfo['list_grid']));
		
		if(empty($grids)){
			
			 $this->error('列表定义不存在，请到"自定义表单内容列表"，设计表单列表定义（默认列表模板要展示的字段）！');
			 
		}
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
		
        $this->formFields = array_unique($fields);
        $this->list_grid = $grids;
        $this->assign('list_grid', $grids);
        $this->assign('form_id', $this->form_id);
        $this->assign('form', $this->formInfo);
    }
    public function index() {
        if (empty($this->formInfo['public'])) {
            $this->error("后台关闭前台浏览");
        }
        
        if ($this->formInfo['public'] == 1) {
            $where = array("ifcheck" => 1);
        }
        $list = $this->getData($this->formFields, $where);
        $this->meta_title = $this->formInfo['diyname'] . "文档列表";
        $this->assign('_list', $list);
        $this->display(T("Addons://Diyform@HomeDiyform/list"));
    }
    
    public function post() {
        $Model = D ( 'Addons://Diyform/HomeDiyform' );
        $config = get_addon_config("Diyform");
        if (IS_POST) {
            if ($config['open_verify'] == 1) {
                $verify = I("post.verify", "", "trim");
                if(!check_verify($verify)){
                    $this->error('验证码输入错误！');
                }
            }
            $diyformtoken = I("post.diyformtoken");
            if ($diyformtoken != md5($config['key'] . $this->form_id)) {
                $this->error('token有误！');
            }
            if (!$Model->SaveData($this->formInfo)) {
                $this->error($Model->getError());
            }else {
                if ($this->formInfo['public'] == 2) {
                    $goto = addons_url("Diyform://HomeDiyform/index", array("form_id" => $this->form_id));
                    $message = '发布成功，现在转向表单列表页...';
                }else {
                    $goto = '/';
                    $message = '发布成功，请等待管理员处理...';
                }
                $this->success($message, $goto);
            }
        }else {
            $fields = $Model->get_form_fields($this->form_id);
            $this->assign($config);
            $this->assign('diyformtoken', md5($config['key'] . $this->form_id));
            $this->assign('fields', $fields);
            $this->assign('field_group', $this->parse_config_attr($this->formInfo['field_group']));
            $this->meta_title = $this->formInfo['diyname'];
            $this->display(T("Addons://Diyform@HomeDiyform/post"));
        }
    }
    
    public function verify(){
        $verify = new \Think\Verify();
        $verify->entry(1);
    }
    public function view() {
        if (empty($this->formInfo['public'])) {
            $this->error("后台关闭前台浏览");
        }
        $id = I("ids", "", "intval");
        if (empty($id)) {
            $this->error("非法操作！未指定id");
        }
        $Model = D ( 'Addons://Diyform/HomeDiyform' );
        $result = $Model->getDetail($id, $this->formInfo);
        $fields = $Model->get_form_fields($this->form_id, false);
        //var_dump($result);die;
        unset($result['ifcheck']);
        $this->meta_title = $this->formInfo['diyname'];
        $this->assign('info', $result);
        $this->assign('fields', $fields);
        $this->display(T("Addons://Diyform@HomeDiyform/view"));
    }
    
    protected function getData($field = true, $where = array(), $order = ''){
        $options    =   array();
        $REQUEST    =   (array)I('request.');
        $model = M($this->table_name);
		
        $total = $model->where($where)->count();
         
        $pk         =   $model->getPk();
        if($order===null){
            //order置空
        }else if ( isset($REQUEST['_order']) && isset($REQUEST['_field']) && in_array(strtolower($REQUEST['_order']),array('desc','asc')) ) {
            $options['order'] = '`'.$REQUEST['_field'].'` '.$REQUEST['_order'];
        }elseif( $order==='' && empty($options['order']) && !empty($pk) ){
            $options['order'] = $pk.' desc';
        }elseif($order){
            $options['order'] = $order;
        }
        unset($REQUEST['_order'],$REQUEST['_field']);
        
        if( isset($REQUEST['r']) ){
            $listRows = (int)$REQUEST['r'];
        }else{
            $listRows = $this->formInfo['list_row'] > 0 ? $this->formInfo['list_row'] : (C('LIST_ROWS') > 0 ? C('LIST_ROWS') : 10);
        }
        $page = new \Think\Page($total, $listRows, $REQUEST);
        if($total>$listRows){
            $page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
        }
        $p = $page->show();
        $this->assign('_page', $p ? $p : '');
        $this->assign('_total', $total);
        $options['limit'] = $page->firstRow.','.$page->listRows;

        $model->setProperty('options', $options);
        return $model->field($field)->select();
    }
    
    protected  function parse_config_attr($string) {
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
