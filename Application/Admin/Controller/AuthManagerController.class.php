<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 朱亚杰 <zhuyajie@topthink.net>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use Admin\Model\AuthRuleModel;
use Admin\Model\AuthGroupModel;

/**
 * 权限管理控制器
 * Class AuthManagerController
 * @author 朱亚杰 <zhuyajie@topthink.net>
 */
class AuthManagerController extends AdminController{

    /**
     * 后台节点配置的url作为规则存入auth_rule
     * 执行新节点的插入,已有节点的更新,无效规则的删除三项任务
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function updateRules(){
        //需要新增的节点必然位于$nodes
        $nodes    = $this->returnNodes(false);

        $AuthRule = M('AuthRule');
        $map      = array('module'=>'admin','type'=>array('in','1,2'));//status全部取出,以进行更新
        //需要更新和删除的节点必然位于$rules
        $rules    = $AuthRule->where($map)->order('name')->select();

        //构建insert数据
        $data     = array();//保存需要插入和更新的新节点
        foreach ($nodes as $value){
            $temp['name']   = $value['url'];
            $temp['title']  = $value['title'];
            $temp['module'] = 'admin';
            if($value['pid'] >0){
                $temp['type'] = AuthRuleModel::RULE_URL;
            }else{
                $temp['type'] = AuthRuleModel::RULE_MAIN;
            }
            $temp['status']   = 1;
            $data[strtolower($temp['name'].$temp['module'].$temp['type'])] = $temp;//去除重复项
        }

        $update = array();//保存需要更新的节点
        $ids    = array();//保存需要删除的节点的id
        foreach ($rules as $index=>$rule){
            $key = strtolower($rule['name'].$rule['module'].$rule['type']);
            if ( isset($data[$key]) ) {//如果数据库中的规则与配置的节点匹配,说明是需要更新的节点
                $data[$key]['id'] = $rule['id'];//为需要更新的节点补充id值
                $update[] = $data[$key];
                unset($data[$key]);
                unset($rules[$index]);
                unset($rule['condition']);
                $diff[$rule['id']]=$rule;
            }elseif($rule['status']==1){
                $ids[] = $rule['id'];
            }
        }
        if ( count($update) ) {
            foreach ($update as $k=>$row){
                if ( $row!=$diff[$row['id']] ) {
                    $AuthRule->where(array('id'=>$row['id']))->save($row);
                }
            }
        }
        if ( count($ids) ) {
            $AuthRule->where( array( 'id'=>array('IN',implode(',',$ids)) ) )->save(array('status'=>-1));
            //删除规则是否需要从每个用户组的访问授权表中移除该规则?
        }
        if( count($data) ){
            $AuthRule->addAll(array_values($data));
        }
        if ( $AuthRule->getDbError() ) {
            trace('['.__METHOD__.']:'.$AuthRule->getDbError());
            return false;
        }else{
            return true;
        }
    }


    /**
     * 权限管理首页
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function index(){
        $list = $this->lists('AuthGroup',array('module'=>'admin'),'id asc');
        $list = int_to_string($list);
        $this->assign( '_list', $list );
        $this->assign( '_use_tip', true );
        $this->meta_title = '权限管理';
        $this->display();
    }

    /**
     * 创建管理员用户组
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function createGroup(){
        if ( empty($this->auth_group) ) {
            $this->assign('auth_group',array('title'=>null,'id'=>null,'description'=>null,'rules'=>null,));//排除notice信息
        }
        $this->meta_title = '新增用户组';
        $this->display('editgroup');
    }

    /**
     * 编辑管理员用户组
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function editGroup(){
        $auth_group = M('AuthGroup')->where( array('module'=>'admin','type'=>AuthGroupModel::TYPE_ADMIN) )
                                    ->find( (int)$_GET['id'] );
        $this->assign('auth_group',$auth_group);
        $this->meta_title = '编辑用户组';
        $this->display();
    }


    /**
     * 访问授权页面
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function access(){
        $this->updateRules();
        $auth_group = M('AuthGroup')->where( array('status'=>array('egt','0'),'module'=>'admin','type'=>AuthGroupModel::TYPE_ADMIN) )
                                    ->getfield('id,id,title,rules');
        $node_list   = $this->returnNodes();
        $map         = array('module'=>'admin','type'=>AuthRuleModel::RULE_MAIN,'status'=>1);
        $main_rules  = M('AuthRule')->where($map)->getField('name,id');
        $map         = array('module'=>'admin','type'=>AuthRuleModel::RULE_URL,'status'=>1);
        $child_rules = M('AuthRule')->where($map)->getField('name,id');

        $this->assign('main_rules', $main_rules);
        $this->assign('auth_rules', $child_rules);
        $this->assign('node_list',  $node_list);
        $this->assign('auth_group', $auth_group);
        $this->assign('this_group', $auth_group[(int)$_GET['group_id']]);
        $this->meta_title = '访问授权';
        $this->display('managergroup');
    }

    /**
     * 管理员用户组数据写入/更新
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function writeGroup(){
        if(isset($_POST['rules'])){
            sort($_POST['rules']);
            $_POST['rules']  = implode( ',' , array_unique($_POST['rules']));
        }
        $_POST['module'] = 'admin';
        $_POST['type']   =  AuthGroupModel::TYPE_ADMIN;
        
		$AuthGroup       =  D('AuthGroup');
		$old_group = $AuthGroup->find($_POST['id']);
        
		$_POST['rules']= $this->getMergedRules($old_group['rules'],$_POST['rules'], 'eq');
		
        $data = $AuthGroup->create();
		
        if ( $data ) {
			
            if ( empty($data['id']) ) {
                $r = $AuthGroup->add();
            }else{
                $r = $AuthGroup->save();
            }
            if($r===false){
                $this->error('操作失败'.$AuthGroup->getError());
            } else{
                $this->success('操作成功!');
            }
        }else{
            $this->error('操作失败'.$AuthGroup->getError());
        }
    }   
	
    /**
     * 状态修改
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function changeStatus($method=null){
        if ( empty($_REQUEST['id']) ) {
            $this->error('请选择要操作的数据!');
        }
        switch ( strtolower($method) ){
            case 'forbidgroup':
                $this->forbid('AuthGroup');
                break;
            case 'resumegroup':
                $this->resume('AuthGroup');
                break;
            case 'deletegroup':
                $this->delete('AuthGroup');
                break;
            default:
                $this->error($method.'参数非法');
        }
    }

    /**
     * 用户组授权用户列表
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function user($group_id){
        if(empty($group_id)){
            $this->error('参数错误');
        }

        $auth_group = M('AuthGroup')->where( array('status'=>array('egt','0'),'module'=>'admin','type'=>AuthGroupModel::TYPE_ADMIN) )
            ->getfield('id,id,title,rules');
        $prefix   = C('DB_PREFIX');
        $l_table  = $prefix.(AuthGroupModel::MEMBER);
        $r_table  = $prefix.(AuthGroupModel::AUTH_GROUP_ACCESS);
        $model    = M()->table( $l_table.' m' )->join ( $r_table.' a ON m.uid=a.uid' );
        $_REQUEST = array();
        $list = $this->lists($model,array('a.group_id'=>$group_id,'m.status'=>array('egt',0)),'m.uid asc','m.uid,m.nickname,m.last_login_time,m.last_login_ip,m.status');
        int_to_string($list);
        $this->assign( '_list',     $list );
        $this->assign('auth_group', $auth_group);
        $this->assign('this_group', $auth_group[(int)$_GET['group_id']]);
        $this->meta_title = '成员授权';
        $this->display();
    }

    /**
     * 将分类添加到用户组的编辑页面
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function category(){
        $auth_group     =   M('AuthGroup')->where( array('status'=>array('egt','0'),'module'=>'admin','type'=>AuthGroupModel::TYPE_ADMIN) )
            ->getfield('id,id,title,rules');
        $group_list     =   D('Category')->getTree();
        $authed_group   =   AuthGroupModel::getCategoryOfGroup(I('group_id'));
        $this->assign('authed_group',   implode(',',(array)$authed_group));
        $this->assign('group_list',     $group_list);
        $this->assign('auth_group',     $auth_group);
        $this->assign('this_group',     $auth_group[(int)$_GET['group_id']]);
        $this->meta_title = '分类授权';
        $this->display();
    }

    public function tree($tree = null){
        $this->assign('tree', $tree);
        $this->display('tree');
    }

    /**
     * 将用户添加到用户组的编辑页面
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function group(){
        $uid            =   I('uid');
        $auth_groups    =   D('AuthGroup')->getGroups();
        $user_groups    =   AuthGroupModel::getUserGroup($uid);
        $ids = array();
        foreach ($user_groups as $value){
            $ids[]      =   $value['group_id'];
        }
        $nickname       =   D('Member')->getNickName($uid);
        $this->assign('nickname',   $nickname);
        $this->assign('auth_groups',$auth_groups);
        $this->assign('user_groups',implode(',',$ids));
        $this->meta_title = '用户组授权';
        $this->display();
    }

    /**
     * 将用户添加到用户组,入参uid,group_id
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function addToGroup(){
        $uid = I('uid');
        $gid = I('group_id');
        if( empty($uid) ){
            $this->error('参数有误');
        }
        $AuthGroup = D('AuthGroup');
        if(is_numeric($uid)){
            if ( is_administrator($uid) ) {
                $this->error('该用户为超级管理员');
            }
            if( !M('Member')->where(array('uid'=>$uid))->find() ){
                $this->error('用户不存在');
            }
        }

        if( $gid && !$AuthGroup->checkGroupId($gid)){
            $this->error($AuthGroup->error);
        }
        if ( $AuthGroup->addToGroup($uid,$gid) ){
            $this->success('操作成功');
        }else{
            $this->error($AuthGroup->getError());
        }
    }

    /**
     * 将用户从用户组中移除  入参:uid,group_id
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function removeFromGroup(){
        $uid = I('uid');
        $gid = I('group_id');
        if( $uid==UID ){
            $this->error('不允许解除自身授权');
        }
        if( empty($uid) || empty($gid) ){
            $this->error('参数有误');
        }
        $AuthGroup = D('AuthGroup');
        if( !$AuthGroup->find($gid)){
            $this->error('用户组不存在');
        }
        if ( $AuthGroup->removeFromGroup($uid,$gid) ){
            $this->success('操作成功');
        }else{
            $this->error('操作失败');
        }
    }

    /**
     * 将分类添加到用户组  入参:cid,group_id
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function addToCategory(){
        $cid = I('cid');
        $gid = I('group_id');
        if( empty($gid) ){
            $this->error('参数有误');
        }
        $AuthGroup = D('AuthGroup');
        if( !$AuthGroup->find($gid)){
            $this->error('用户组不存在');
        }
        if( $cid && !$AuthGroup->checkCategoryId($cid)){
            $this->error($AuthGroup->error);
        }
        if ( $AuthGroup->addToCategory($gid,$cid) ){
            $this->success('操作成功');
        }else{
            $this->error('操作失败');
        }
    }

    /**
     * 将模型添加到用户组  入参:mid,group_id
     * @author 朱亚杰 <xcoolcc@gmail.com>
     */
    public function addToModel(){
        $mid = I('id');
        $gid = I('get.group_id');
        if( empty($gid) ){
            $this->error('参数有误');
        }
        $AuthGroup = D('AuthGroup');
        if( !$AuthGroup->find($gid)){
            $this->error('用户组不存在');
        }
        if( $mid && !$AuthGroup->checkModelId($mid)){
            $this->error($AuthGroup->error);
        }
        if ( $AuthGroup->addToModel($gid,$mid) ){
            $this->success('操作成功');
        }else{
            $this->error('操作失败');
        }
    }
	
	/*
	+-----------------------------------
	前台权限节点管理部分
	+------------------------------------
	*/
	
	/*
	*添加权限节点
	*@author geniusxjq <app880.com>
	*/
	public function addNode()
    {
        if (empty($this->auth_group)) {
            $this->assign('auth_group', array('title' => null, 'id' => null, 'description' => null, 'rules' => null,));//排除notice信息
        }
        if (IS_POST) {
            $Rule = D('AuthRule');
            $data = $Rule->create();
            if ($data) {
                if (intval($data['id']) == 0) {
                    $id = $Rule->add();
                } else {
                    $Rule->save($data);
                    $id = $data['id'];
                }

                if ($id) {
                    // S('DB_CONFIG_DATA',null);
                    //记录行为
                    $this->success('编辑成功');
                } else {
                    $this->error('编辑失败');
                }
            } else {
                $this->error($Rule->getError());
            }
        } else {
            $a_id = I('id', 0, 'intval');
            if ($a_id == 0) {
                $info['module']=I('module','');
            }else{
                $info = D('AuthRule')->find($a_id);
            }

            $this->assign('info', $info);
            $modules = D('Module')->getModules();
            $this->assign('Modules', $modules);
            $this->meta_title = '新增前台权限节点';
            $this->display();
        }

    }
	
	/*
	*删除权限节点
	*@author geniusxjq <app880.com>
	*/
    public function deleteNode(){
        $a_id=I('id',0,'intval');
        if($a_id>0){
           $result=   M('AuthRule')->where(array('id'=>$a_id))->delete();
            if($result){
                $this->success('删除成功。');
            }else{
                $this->error('删除失败。');
            }
        }else{
            $this->error('必须选择节点。');
        }
    }
	
	/*
	*用户前台权限节点管理页面/权限保存
	*@author geniusxjq <app880.com>
	*/
	
    public function accessUser()
    {

        if (IS_POST) {
						            
			$AuthGroup=M('AuthGroup');
			
			$a_old_rule=$AuthGroup->find(I('post.id',0));
			
			$_POST['rules'] = $this->getMergedRules($a_old_rule['rules'], I('post.rules',''));
						
			$data=$AuthGroup->create(); 
			
			if($data){
								
				$res=$AuthGroup->save();
					
				if($res===false){
					
					$this->error('保存失败'.$AuthGroup->getError());
				
				} else{
					
					$this->success('保存成功');
					
				}
				
			}else{
				
				$this->error('操作失败'.$AuthGroup->getError());
				
			}

        }else{
			
			$this->updateRules();
			$auth_group = M('AuthGroup')->where(array('status' => array('egt', '0'), 'module' => array('neq', ''), 'type' => AuthGroupModel::TYPE_ADMIN))->getfield('id,id,title,rules');
			
			$node_list =$this->getNodeListFromModule(D('Module')->getModules());
		
			$map = array('module' => array('neq', 'admin'), 'type' => AuthRuleModel::RULE_MAIN, 'status' => 1);
			$main_rules = M('AuthRule')->where($map)->getField('name,id');
			$map = array('module' => array('neq', 'admin'), 'type' => AuthRuleModel::RULE_URL, 'status' => 1);
			$child_rules = M('AuthRule')->where($map)->getField('name,id');
	
			$group = M('AuthGroup')->find(I('get.group_id',0));
			$this->assign('main_rules', $main_rules);
			$this->assign('auth_rules', $child_rules);
			$this->assign('node_list', $node_list);
			$this->assign('auth_group', $auth_group);
			$this->assign('this_group', $group);
			$this->meta_title = '用户前台授权';
			$this->display('');
			
		}
    }
	
	/*
	*合并新的规则/删除全部非Admin（后台管理）模块下的权限，排除老的权限的影响
	*@author geniusxjq <app880.com>
	*/

    private function getMergedRules($old_rules, $rules, $isAdmin = 'neq')
    {
        $old_rules=is_array($old_rules)?$old_rules:explode(',',$old_rules);
		
		$rules=is_array($rules)?$rules:explode(',',$rules);
		
		$map = array('module' => array($isAdmin, 'admin'), 'status' => 1);
        
		$otherRules = M('AuthRule')->where($map)->field('id')->select();
				
        $other_rules_array = get_sub_by_key($otherRules,'id');

        /*
		1.删除全部非Admin模块下的权限，排除老的权限的影响
        2.合并新的规则
		*/
        foreach ($other_rules_array as $key => $v) {
			
            if (in_array($v, $old_rules)) {
				
                $key_search = array_search($v, $old_rules);
				
                if ($key_search !== false)
				
                    array_splice($old_rules, $key_search, 1);
					
            }
        }

        return implode(',',array_filter(array_unique(array_merge($old_rules, $rules)),function($v){ return $v?true:false; }));

    }
	
	//预处理规则，去掉未安装的模块
    private function getNodeListFromModule($modules)
    {
        $node_list = array();
        foreach ($modules as $module) {
			
            if ($module['is_setup']) {

                $node = array('name' => $module['name'], 'alias' => $module['alias']);
                $map = array('module' => $module['name'], 'type' => AuthRuleModel::RULE_URL, 'status' => 1);

                $node['child'] = M('AuthRule')->where($map)->select();
                $node_list[] = $node;
            }

        }
        return $node_list;
    }
	
}
