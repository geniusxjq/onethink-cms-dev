<?php
/**
 * 
 * @author quick
 *
 */
namespace Addons\Sensitive\Model;
use Think\Model;

/**
 * 分类模型
 */
class SensitiveModel extends Model{
		
    protected $_auto = array(
        array('create_time', NOW_TIME, self::MODEL_INSERT),
        array('status', 1, self::MODEL_BOTH),
    );
	
	protected function _afterFilter(&$result,$options) {
		$result['status_text'] =  $result['status'] == 0 ? '禁用' : '正常';
	}
	
	protected function _after_find(&$result,$options) {
		
	}
	
	protected function _after_select(&$result,$options){
		foreach($result as &$record){
			$this->_afterFilter($record,$options);
		}
	}

	/**
	 * 新增或更新
	 * @return boolean fasle 失败 ， int  成功 返回完整的数据
	 */
	public function update(){
		/* 获取数据对象 */
		$data = $this->create();
		if(empty($data)){
			return false;
		}
		/* 添加或新增基础内容 */
		if(empty($data['id'])){ //新增数据
			$id = $this->add(); //添加基础内容
			if(!$id){
				$this->error = '新增出错！';
				return false;
			}
		} else { //更新数据
			$status = $this->save(); //更新基础内容
			if(false === $status){
				$this->error = '更新出错！';
				return false;
			}
		}
	
		//内容添加或更新完成
		return $data;
	
	}
	
	/* 禁用 */
	public function off($id){
		return $this->save(array('id'=>$id,'status'=>'0'));
	}
	
	/* 启用 */
	public function on($id){
		return $this->save(array('id'=>$id,'status'=>'1'));
	}
	
	/* 删除 */
	public function del($id){
		$map = array('id' => array('in',$id));
		return $this->where($map)->delete();
	}	
	
	/* 获取编辑数据 */
	public function detail($id){
		$data = $this->find($id);
		return $data;
	}	
}