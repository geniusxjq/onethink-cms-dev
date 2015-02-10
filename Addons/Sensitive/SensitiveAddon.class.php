<?php

namespace Addons\Sensitive;

use Common\Controller\Addon;

/**
 * 敏感词插件
 * @author quick
 */
 
class SensitiveAddon extends Addon
{

    public $info = array(
        'name' => 'Sensitive',
        'title' => '敏感词',
        'description' => '敏感词过滤插件',
        'status' => 1,
        'author' => 'xjw129xjt',
        'version' => '0.1'
    );
	
	public $addon_install_info=array(
									 
		'hooks'=>"replaceSensitiveWords:2",
		
		'install_sql'=>"DROP TABLE IF EXISTS `onethink_sensitive`;
		CREATE TABLE IF NOT EXISTS `onethink_sensitive` (
		`id` int(11) NOT NULL AUTO_INCREMENT,
		`title` varchar(50) NOT NULL,
		`status` tinyint(4) NOT NULL,
		`create_time` int(11) NOT NULL,
		PRIMARY KEY (`id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ",
		
		'uninstall_sql'=>"DROP TABLE IF EXISTS `onethink_sensitive`;",
									 
	);

    /**
     * 配置列表页面
     * @var unknown_type
     */
    public $admin_list = array(
        'listKey' => array(
            'title' => '名称',
            'status' => '状态',
            'create_time' => '创建时间',

        ),
        'model' => 'Sensitive',
        'order' => 'id asc'
    );
    public $custom_adminlist = 'adminlist.html';

	public function install(){
		
		return $this->addon_install($this->addon_install_info);
		
	}
	
	public function uninstall(){
		
		return $this->addon_uninstall($this->addon_install_info);
		
	}

    public function replaceSensitiveWords($content)
    {

        $config = $this->getConfig();
        if ($config['is_open']) {
            $replace_words = S('replace_sensitive_words');
            if(empty($replace_words)){
                $words = D('Sensitive')->where(array('status'=>1))->select();
                $words = getSubByKey($words,'title');
                $replace_words = array_combine($words, array_fill(0, count($words), '***'));
                S('replace_sensitive_words',$replace_words);
            }

            !empty($replace_words) && $content = strtr( $content, $replace_words);

        }

        return  $content;
    }

}