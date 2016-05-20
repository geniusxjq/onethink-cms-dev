<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Addons\Advertising\Model;
use Think\Model;

/**
 * 分类模型
 */
class AdvertisementModel extends Model{
	
	/* 自动完成规则 */
	protected $_auto = array(
			array('create_time', 'getCreateTime', self::MODEL_BOTH,'callback'),
			array('end_time', 'getEndTime', self::MODEL_BOTH,'callback'),
	);
	
	
	protected function _after_find(&$result,$options) {
		$_advertising = M('advertising')->find($result['position']);
		$result['positiontext'] = $_advertising['title'];
		$result['create_time'] = date('Y-m-d H:i', $result['create_time']);
		$result['end_time'] = date('Y-m-d H:i', $result['end_time']);
	}
	
	protected function _after_select(&$result,$options){
		
		foreach($result as &$record){
			$this->_after_find($record,$options);
		}
				
		int_to_string($result,array('is_never'=>array(0=>'否',1=>'是')));
		
	}
		
	/* 获取编辑数据 */
	public function detail($id){
		$data = $this->find($id);
		$cover = M('picture')->find($data['advspic']);
		$_advertising = M('advertising')->find($data['position']);
		$data['path'] = $cover['path'];
		$data['type'] = $_advertising['type'];
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
	
	/**
	 * 新增或更新一个文档
	 * @return boolean fasle 失败 ， int  成功 返回完整的数据
	 */
	public function update(){
		/* 获取数据对象 */
		$data = $this->create();
		$_advertising = M('advertising')->find($data['position']);
		
		//广告位的禁用判断
		if($_advertising['status'] == 0){
			$this->error = '这是个禁用的广告位！';
			return false;
		}
		
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
	
	/* 时间处理规则 */
	protected function getCreateTime(){
		$create_time    =   I('post.create_time');
		return $create_time?strtotime($create_time):NOW_TIME;
	}
	
	/* 时间处理规则 */
	protected function getEndTime(){
		$end_time    =   I('post.end_time');
		return $end_time?strtotime($end_time):NOW_TIME;
	}	
	
}