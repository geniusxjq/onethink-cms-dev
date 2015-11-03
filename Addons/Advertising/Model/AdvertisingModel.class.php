<?php
/**
 * 
 * @author quick
 *
 */
namespace Addons\Advertising\Model;
use Think\Model;

/**
 * 分类模型
 */
class AdvertisingModel extends Model{
	/* 自动完成规则 */
	protected $_auto = array(
			array('same_limit', '_autoSameLimit', self::MODEL_BOTH,'callback'),
	);
		
	/*广告位显示限制返回值填充补全*/
	
	public function _autoSameLimit(){
		$same_limit= I('post.same_limit');
		return ($same_limit&&is_numeric($same_limit))?$same_limit:1;
	}
	
	protected function _after_find(&$result,$options) {
		$typetext = array(1=>'文字',2=>'图片',3=>'代码');//有其他广告位置自行添加  2，0版本将添加后台广告分类功能
		$result['typetext'] = $typetext[$result['type']];
		$result['statustext'] =  $result['status'] == 0 ? '禁用' : '正常';
	}	
	
	protected function _after_select(&$result,$options){
		foreach($result as &$record){
			$this->_after_find($record,$options);
		}
	}
		
	/**
	 * 新增或更新一个文档
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
				$this->error = '新增广告内容出错！';
				return false;
			}
		} else { //更新数据
			$status = $this->save(); //更新基础内容
			if(false === $status){
				$this->error = '更新广告内容出错！';
				return false;
			}
		}
	
		//内容添加或更新完成
		return $data;
	
	}
	
	/* 禁用 */
	public function forbidden($id){
		return $this->save(array('id'=>$id,'status'=>'0'));
	}
	
	/* 启用 */
	public function off($id){
		return $this->save(array('id'=>$id,'status'=>'1'));
	}
	
	/* 删除 */
	public function del($id){
		return $this->delete($id);
	}	
	
	/* 获取编辑数据 */
	public function detail($id){
		$data = $this->find($id);
		return $data;
	}
	
	/*  获取广告位  */
	public function getAdvertising($ids){
		
		if(!isset($ids)) return false;
		
		(!is_array($ids))&&($ids=str2arr($ids));
		
		$datas=array();
		
		foreach($ids as $id){
			
			$ad_space = $this->find($id);//找到当前调用的广告位
			
			if(!$ad_space) continue;
			
			$where = ' and position = '.$id;
					
			$data=array();
			$list=D('Advertisement')->where('status = 1 and create_time < '.time().' and end_time > '.time().$where)
			->order('level desc,id asc')->limit($ad_space['same_limit'])->select();
			
			if(!$list&&!$ad_space['idle_content']) continue;
			
			$data['type'] = $ad_space['type'];
			$data['width'] = $ad_space['width'];
			$data['height'] = $ad_space['height'];
			$data['idle_content'] = $ad_space['idle_content'];
			$data['list'] =$list;
			
			$datas[]=$data;
		
		}
		
		return $datas;
	}

}