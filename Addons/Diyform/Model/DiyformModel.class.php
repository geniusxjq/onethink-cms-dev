<?php

namespace Addons\Diyform\Model;
use Think\Model;

/**
 * Diyform模型
 */
class DiyformModel extends Model{
    /* 自动验证规则 */
    protected $_validate = array(
        array('diyname', 'require', '自定义表单名称必须填写', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('table_name', 'require', '数据表名不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
        array('table_name', '', '数据表名已存在', self::MUST_VALIDATE, 'unique', self::MODEL_INSERT),
        array('table_name', 'checkTableExist', '数据表名已存在', self::MUST_VALIDATE, 'callback', self::MODEL_INSERT),
        array('list_grid', 'checkListGrid', '列表定义不能为空', self::MUST_VALIDATE, 'callback', self::MODEL_UPDATE),
    );
    /* 自动完成规则 */
    protected $_auto = array(
        array('table_name', 'strtolower', self::MODEL_INSERT, 'function'),
        array('field_sort', 'getFields', self::MODEL_BOTH, 'callback'),
    );
    public $model = array(
        'title'=>'自定义表单',//新增[title]、编辑[title]、删除[title]的提示
        'template_add'=>'View/diyform/add.html',//自定义新增模板自定义html edit.html 会读取插件根目录的模板
        'template_edit'=>'View/diyform/edit.html',//自定义编辑模板html
        'search_key'=>'',// 搜索的字段名，默认是title
        'extend'=>1,
    );

    public $_fields = array(
        'id'=>array(
            'name'=>'id',//字段名
            'title'=>'ID',//显示标题
            'type'=>'num',//字段类型
            'remark'=>'',// 备注，相当于配置里的tip
            'is_show'=>3,// 1-始终显示 2-新增显示 3-编辑显示 0-不显示
            'value'=>0,//默认值
        ),
        'diyname'=>array(
            'name'=>'diyname',
            'title'=>'自定义表单名称',
            'type'=>'string',
            'remark'=>'',
            'is_show'=>1,
            'value'=>0,
        ),
        'table_name'=>array(
            'name'=>'table_name',
            'title'=>'数据表名',
            'type'=>'string',
            'remark'=>'不需要加表前缀，添加后不可修改',
            'is_show'=>2,
            'value'=>0,
        ),
        'listtemplate'=>array(
            'name'=>'listtemplate',
            'title'=>'列表模板',
            'type'=>'string',
            'remark'=>'自定义的列表模板，放在Addons\Diyform\View\default\HomeDiyform下，不写则使用默认模板"list"',
            'is_show'=>1,
            'value'=>'list',
        ),
        'viewtemplate'=>array(
            'name'=>'viewtemplate',
            'title'=>'内容模板',
            'type'=>'string',
            'remark'=>'自定义的新增模板，放在Addons\Diyform\View\default\HomeDiyform下，不写则使用默认模板"view"',
            'is_show'=>1,
            'value'=>'view',
        ),
        'posttemplate'=>array(
            'name'=>'posttemplate',
            'title'=>'发布模板',
            'type'=>'string',
            'remark'=>'自定义的新增模板，放在Addons\Diyform\View\default\HomeDiyform下，不写则使用默认模板"post"',
            'is_show'=>1,
            'value'=>'post',
        ),
        'public'=>array(
            'name'=>'public',
            'title'=>'前台列表和内容页公开?',
            'type'=>'radio',
            'remark'=>'',
            'is_show'=>1,
            'value'  => 1,
            'extra'=>'2:完全公开,1:公开审核的,0:不公开',
        ),
    );

    protected function checkListGrid($data) {
        return !empty($data);
    }
    
    protected function checkTableExist(){
        $table = I("post.table_name");
        $table_name = $this->table_name = C('DB_PREFIX').strtolower($table);
        $sql = <<<sql
                SHOW TABLES LIKE '{$table_name}';
sql;
        $res = M()->query($sql);
        return !(count($res) === 1);
    }
    
    public function getFormInfo ($form_id, $fields = '*') {
        $result = $this->getById($form_id);
        if ($fields == "*") {
            return $result;
        }else {
            return $result[$fields];
        }
    }
    public function getFormName($form_id) {
        return $this->getFormInfo($form_id, "diyname");
    }
    
    public function update(){
        
        $data = $this->create();
        if(empty($data)){
            return false;
        }

        if(empty($data['id'])){ 
            $id = $this->add(); 
            if(!$id){
                $this->error = '新增自定义表单出错！';
                return false;
            }
        } else { 
            unset($data['table_name']);
            $status = $this->save(); 
            if(false === $status){
                $this->error = '更新自定义表单出错！';
                return false;
            }
        }

        action_log('update_diyform','diyform',$data['id'] ? $data['id'] : $id, UID);

        return $data;
    }
    protected function getFields($fields){
        return empty($fields) ? '' : json_encode($fields);
    }
}