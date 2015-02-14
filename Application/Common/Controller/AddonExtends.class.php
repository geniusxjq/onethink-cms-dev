<?php
// +----------------------------------------------------------------------
// | Author: geniusxjq <app880.com>
// +----------------------------------------------------------------------

namespace Common\Controller;
use Think\Storage;
/**
 * 插件类扩展//二次开发自定义的新功能函数（非系统自带）
 * @author geniusxjq <app880.com>
 */
abstract class AddonExtends{
	
	  /*
	  
	  读取SQL文件内容
	  
	  @param string $file 文件路径（文件名）
	  
	  @return multitype:string 返回文件内容
	  
	  */
	  
	  public function readSqlFile($file){
		  
		  return Storage::read($file);
		  
	  }
	
	 /**
	   * 执行SQL文件
	   * @access public
	   * @param string  $sql 要执行的sql
	   * @param string  $sql_db_prefix 要执行的sql语句中的的表前缀（用于指定替换）
	   * @param boolean $stop 遇错是否停止  默认为true
	   * @param string  $db_charset 数据库编码 默认为utf-8
	   * @return array
	   */
	   
	  public function executeSql($sql,$sql_db_prefix='onethink_',$stop = true,$db_charset = 'utf-8') {
		  
		  if(!$sql) return true;

		  $sql = str_replace("\r", "\n", str_replace('`'.$sql_db_prefix, '`'.C('DB_PREFIX'), $sql));
		    
		  foreach (explode(";\n", trim($sql)) as $query) {
			  
			  $query = trim($query);
			  
			  if($query) {
				  
				  if(substr($query, 0, 12) == 'CREATE TABLE') {
					  //预处理建表语句
					  $db_charset = (strpos($db_charset, '-') === FALSE) ? $db_charset : str_replace('-', '', $db_charset);
					  
					  $type   = strtoupper(preg_replace("/^\s*CREATE TABLE\s+.+\s+\(.+?\).*(ENGINE|TYPE)\s*=\s*([a-z]+?).*$/isU", "\\2", $query));
					  
					  $type   = in_array($type, array("MYISAM", "HEAP")) ? $type : "MYISAM";
					  
					  $_temp_query = preg_replace("/^\s*(CREATE TABLE\s+.+\s+\(.+?\)).*$/isU", "\\1", $query).
						  (mysql_get_server_info() > "4.1" ? " ENGINE=$type DEFAULT CHARSET=$db_charset" : " TYPE=$type");
  
					  $res = M('')->execute($_temp_query);
					  
				  }else {
					  
					  $res = M('')->execute($query);
					  
				  }
				  
				  if($res === false) { 
				  
				      $error=true;
				  
					  if($stop){
							  
						  throw new \Exception('数据库错误信息：'.M('')->getDbError().'<br/>出错的SQL语句：'.$query);
						  
					  }
					  					  
				  }
			  }
		  }
		  
		  if($error){
			  			  
			  return false;
			  
		  }
		  
		  return true;
		  
	  } 
	  
   /*
	 将钩子配置信息转换为二维数组
	 @param $info multiType 要转换的数据；
	 @return array(array($key=>$vaule),array($key=>$vaule)...);
   */
   
	public function hooksInfoToArray($info){
		
		$result=array();
		
		if($info){
			
			$temp_arr=array(
				
			  'name'=>'',
			  
			  'type'=>'',
			  
			  'description'=>'',
			  				
			);
			
			if(is_array($info)){
				
				$hooks=$info;
				
				foreach($hooks as $key=>$value){
					
					if(is_string($key)){
						
						$result[]=array_merge($temp_arr,$hooks);
						
						break;
						
					}	
					
					if(is_int($key)&&is_array($value)){
						
						$result[]=array_merge($temp_arr,$value);
						
						continue;
						
					}
																
				}
				
			}else{
				
				$hooks=explode(',',$info);
					
				foreach($hooks as $hook_name){
					
					$_arr=array();
														
					list($_arr['name'],$_arr['type'],$_arr['description'])=explode(':',$hook_name);
					
					$result[]=array_merge($temp_arr,$_arr);
					
					continue;
																
				}

			}
						
		}
		
		return $result;
		 
	}
    
    /**
     * 添加钩子（不存在时添加）
     * @param string $hook_name 钩子名称
     * @param string $hook_description= 钩子简介
	 * @param int $hook_type  钩子类型（默认为1）
	 * @param string $addons_name 插件名称
     */
    public function addHook($hook_name='',$hook_description='',$hook_type=1,$addon_name=''){
		
		if(!$hook_name) return;
		
        $hook_mod = M('Hooks');
		
        $where['name'] = $hook_name;
		
        $gethook = $hook_mod->where($where)->find();
		
        if(!$gethook || empty($gethook) || !is_array($gethook)){
			
            $data['name'] = $hook_name;
			
            $data['description'] = $hook_description;
			
            $data['type'] = $hook_type;
			
            $data['update_time'] = NOW_TIME;
			
            $data['addons'] = $addon_name?$addon_name:$this->getName();
			
            if( false !== $hook_mod->create($data)){
				
                $hook_mod->add();
				
            }
			
        }
		
    }
    
    /**
     * 删除钩子（只在钩子为唯一（独立）钩子时才删除）
     * @param string $hook_name  钩子名称
     */
    public function deleteHook($hook_name){
		
		if(!$hook_name) return;
		
        $model = M('hooks');
		
        $condition = array(//删除条件,只在钩子为唯一（独立）钩子时才删除，避免钩子删除影响其他插件。
            
			'name' => $hook_name,
			
			'addons'=>($this->getName()),
			
        );
		
        $model->where($condition)->delete();
    }
	
	/*
	
	判断插件是否已经安装
	
	@param $addon_name string  插件名称(name)
	
	*/
	
	public function isInstalled($addon_name=''){
				
		if(!$addon_name) return false;
		
		$model=M("Addons");
		
		$map['name']=$addon_name;
				   		
		return ($model->where($map)->find())?true:false;
		
	}

	/*
	
	安装插件自带的SQL数据库（表）
	
	* @param array $install_info 安装插件用到的配置参数，如下：

	array(
		  
		  'hooks'=>''，// multitype 需要创建的钩子（可选）		  
		  
		  'install_sql'=>'',//string 安装时执行的SQL语句（可选）
		  
		  'uninstall_sql'=>'',//string 卸载时执行的SQL语句（可选）
	) 
	
	'hooks' 格式如：		  	 
	1."hook:typeID:description"  
	2.array('name'=>'name','type'=>typeId,'description'=>'description');
	3.array(array('name'=>'name','type'=>typeId,'description'=>'description'));
	
	*/
	public function installAddon($install_info=array()){
		
		/* 先判断插件需要的钩子是否存在 */
		if($install_info['hooks']){
			
			$hooks=$this->hooksInfoToArray($install_info['hooks']);
						
			foreach($hooks as $key=>$value){
				
				$_name=$value['name'];
				
				$_description=$value['description']?$value['description']:($this->info['name'].'('.$this->info['title'].')的'.$value['name'].'钩子');
				
				$_type=$value['type']?$value['type']:1;
															
				$this->addHook($_name,$_description,$_type);
			
			}
		
		}

		//读取插件sql文件
		$sqldata =$install_info['install_sql']?$install_info['install_sql']:$this->readSqlFile($this->addon_path.'/install.sql');
		
		return $this->executeSql($sqldata);
		
	}
	
	/*
	
	卸载插件自带的SQL数据库（表）
	
	* @param array $install_info 安装插件用到的配置参数，如下：
	
	array(
		  
		  'hooks'=>''，// multitype 需要创建的钩子（可选）		  
		  
		  'install_sql'=>'',//string 安装时执行的SQL语句（可选）
		  
		  'uninstall_sql'=>'',//string 卸载时执行的SQL语句（可选）
	) 
	
	'hooks' 格式如：		  	 
	1."hook:typeID:description"  
	2.array('name'=>'name','type'=>typeId,'description'=>'description');
	3.array(array('name'=>'name','type'=>typeId,'description'=>'description'));
	
	*/ 
	public function uninstallAddon($install_info=array()){
			
		//删除钩子
		if($install_info['hooks']){
			
			$hooks=$this->hooksInfoToArray($install_info['hooks']);
			
			foreach($hooks as $key=>$value){
															
				$this->deleteHook($value['name']);
			
			}
		
		}
		
		//读取插件sql文件
					
		$sqldata =$install_info['uninstall_sql']?$install_info['uninstall_sql']:$this->readSqlFile($this->addon_path.'/uninstall.sql');
				
		return $this->executeSql($sqldata);
		
	}
	
}
