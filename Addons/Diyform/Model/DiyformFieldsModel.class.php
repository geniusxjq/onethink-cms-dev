<?php
namespace Addons\Diyform\Model;
use Think\Model;
class DiyformFieldsModel extends Model{
    /* 自动验证规则 */
    protected $_validate = array(
        array('name', 'require', '字段名必须', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('name', '/^[a-zA-Z][\w_]{1,29}$/', '字段名不合法', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('name', 'checkName', '字段名已存在', self::MUST_VALIDATE, 'callback', self::MODEL_BOTH),
        array('field', 'require', '字段定义必须', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('field', '1,100', '注释长度不能超过100个字符', self::VALUE_VALIDATE, 'length', self::MODEL_BOTH),
        array('title', '1,100', '注释长度不能超过100个字符', self::VALUE_VALIDATE, 'length', self::MODEL_BOTH),
        array('remark', '1,100', '备注不能超过100个字符', self::VALUE_VALIDATE, 'length', self::MODEL_BOTH),
        array('form_id', 'require', '未选择操作的自定义表单', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
    );
    
    /* 自动完成规则 */
    protected $_auto = array(
        array('status', 1, self::MODEL_INSERT, 'string'),
        array('create_time', 'time', self::MODEL_INSERT, 'function'),
        array('update_time', 'time', self::MODEL_BOTH, 'function'),
    );

    /* 操作的表名 */
    protected $table_name = null;
    
    /**
     * 新增或更新一个字段
     * @return boolean fasle 失败 ， int  成功 返回完整的数据
     */
    public function update($data = null, $create = true){
        /* 获取数据对象 */
        $data = empty($data) ? $_POST : $data;
        $data = $this->create($data);
        if(empty($data)){
            return false;
        }
        /* 添加或新增属性 */
        if(empty($data['id'])){ //新增属性

            $id = $this->add();
            if(!$id){
                $this->error = '新增属性出错！';
                return false;
            }

            if($create){
                //新增表字段
                $res = $this->addField($data);
                if(!$res){
                    $this->error = '新建字段出错！';
                    //删除新增数据
                    $this->delete($id);
                    return false;
                }
            }

        } else { //更新数据
            if($create){
            //更新表字段
                $res = $this->updateField($data);
                if(!$res){
                    $this->error = '更新字段出错！';
                    return false;
                }
            }

            $status = $this->save();
            if(false === $status){
                $this->error = '更新属性出错！';
                return false;
            }
        }
        //删除字段缓存文件
        $form_name = M('Diyform')->field('table_name')->find($data['form_id']);
        $cache_name = C('DB_NAME').'.'.preg_replace('/\W+|\_+/','',$form_name['table_name']);
        F($cache_name, null, DATA_PATH.'_fields/');

        //记录行为
        action_log('update_diyformFields', 'diyformfields', $data['id'] ? $data['id'] : $id, UID);

        //内容添加或更新完成
        return $data;

    }
    
    protected function checkName(){
        $name = I('post.name');
        $form_id = I('post.form_id');
        $id = I('post.id');
        $map = array('name'=>$name, 'form_id'=>$form_id);
        if(!empty($id)){
            $map['id'] = array('neq', $id);
        }
        $res = $this->where($map)->find();
        return empty($res);
    }
    
    protected function checkTableExist($form_id){
        $Model = M('Diyform');
        //当前操作的表
        $form = $Model->where(array('id'=>$form_id))->field('table_name')->find();

        $table_name = $this->table_name = C('DB_PREFIX').strtolower($form['table_name']);
        $sql = <<<sql
                SHOW TABLES LIKE '{$table_name}';
sql;
        $res = M()->query($sql);
        return count($res);
    }
   
    protected function addField($field){
        //检查表是否存在
        $table_exist = $this->checkTableExist($field['form_id']);

        //获取默认值
        if($field['value'] === ''){
            $default = '';
        }elseif (is_numeric($field['value'])){
            $default = ' DEFAULT '.$field['value'];
        }elseif (is_string($field['value'])){
            $default = ' DEFAULT \''.$field['value'].'\'';
        }else {
            $default = '';
        }

        if($table_exist){
            $sql = <<<sql
                ALTER TABLE `{$this->table_name}`
ADD COLUMN `{$field['name']}`  {$field['field']} {$default} COMMENT '{$field['title']}';
sql;
        }else{
            
                $sql = <<<sql
                CREATE TABLE IF NOT EXISTS `{$this->table_name}` (
                `id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
                `create_at`  int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间' ,
                `ifcheck` tinyint(1) NOT NULL DEFAULT '0',
                `{$field['name']}`  {$field['field']} {$default} COMMENT '{$field['title']}' ,
                PRIMARY KEY (`id`)
                )
                ENGINE=MyISAM
                DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
                CHECKSUM=0
                ROW_FORMAT=DYNAMIC
                DELAY_KEY_WRITE=0
                ;
sql;
        }
        $res = M()->execute($sql);
        return $res !== false;
    }
    
   
    protected function updateField($field){
        //检查表是否存在
        $table_exist = $this->checkTableExist($field['form_id']);

        //获取原字段名
        $last_field = $this->getFieldById($field['id'], 'name');

        //获取默认值
        $default = $field['value']!='' ? ' DEFAULT '.$field['value'] : '';

        $sql = <<<sql
            ALTER TABLE `{$this->table_name}`
CHANGE COLUMN `{$last_field}` `{$field['name']}`  {$field['field']} {$default} COMMENT '{$field['title']}' ;
sql;
        $res = M()->execute($sql);
        return $res !== false;
    }

    public function deleteField($field){
        //检查表是否存在
        $table_exist = $this->checkTableExist($field['form_id']);

        $sql = <<<sql
            ALTER TABLE `{$this->table_name}`
DROP COLUMN `{$field['name']}`;
sql;
        $res = M()->execute($sql);
        return $res !== false;
    }
}
