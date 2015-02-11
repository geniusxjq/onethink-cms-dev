<?php
/**
 * 同步登陆插件
 * @author jry
 */
 
namespace Addons\SyncLogin;
use Common\Controller\Addon;


class SyncLoginAddon extends Addon{

    public $info = array(
        'name' => 'SyncLogin',
        'title' => '第三方账号同步登陆',
        'description' => '第三方账号同步登陆',
        'status' => 1,
        'author' => 'yidian',
        'version' => '0.1'
    );
	
	public $addon_install_info = array(
									   
			'hooks'=>"SyncLogin", 
										   						
			'install_sql'=>"DROP TABLE IF EXISTS onethink_sync_login;
			CREATE TABLE `onethink_sync_login` (
			  `uid` int(11) NOT NULL,
			  `openid` varchar(255) NOT NULL,
			  `type` varchar(255) NOT NULL,
			  `access_token` varchar(255) NOT NULL,
			  `refresh_token` varchar(255) NOT NULL,
			  `status` tinyint(4) NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;
			",
			  
			'uninstall_sql'=>"DROP TABLE IF EXISTS onethink_sync_login;",
			
    );

    public function install(){ 
       return $this->installAddon($this->addon_install_info);
    }

    public function uninstall(){
       return $this->uninstallAddon($this->addon_install_info);
    }

    //登录按钮钩子
    public function SyncLogin($param)
    {
        $this->assign($param);
        $config = $this->getConfig();
        $this->assign('config',$config);
        $this->display('login');
    }

    /**
     * meta代码钩子
     * @param $param
     * autor:xjw129xjt
     */
    public function syncMeta($param)
    {
        $platform_options = $this->getConfig();
        echo $platform_options['meta'];
    }
    
}