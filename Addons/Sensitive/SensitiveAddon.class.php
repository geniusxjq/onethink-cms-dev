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
        'author' => 'geniusxjq(app880.com)',
		'url'=>"http://app880.com",
        'version' => '0.1'
    );
	
	public $addon_install_info=array(
				
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
        'list_grid' => array(
				'id:ID',
				'title:名称',
				'status_text:状态:',
				'create_time|time_format:创建时间',
        ),
        'model' => 'Sensitive',
        'order' => 'id asc'
    );
    public $custom_adminlist = 'adminlist.html';

	public function install(){
		
		return $this->installAddon($this->addon_install_info);
		
	}
	
	public function uninstall(){
		
		return $this->uninstallAddon($this->addon_install_info);
		
	}
	
	/*
	
	过滤敏感词（外部调用的方法，非钩子）
	
	方法已经在公共函数文件"Common/Common/parse.php"中的"parseContent"公共方法中调用
	
	@param array $param 传入的内容
	
	格式：
	
	$param=array('content'=>'');
	
	*/
	
	 public function parseSensitiveWords($content)
    {
		
		if(!$content) return "";
		
		if(!$this->isSetup($this->info['name'])) return $content;//如果未安装则直接返回内容（不做处理）
		
        $config = $this->getConfig();
        if ($config['is_open']) {
            $replace_words = S('replace_sensitive_words');
            if(empty($replace_words)){
                $words = D('Sensitive')->where(array('status'=>1))->select();
                $words = get_sub_by_key($words,'title');
                $replace_words = array_combine($words, array_fill(0, count($words), '***'));
                S('replace_sensitive_words',$replace_words);
            }

            !empty($replace_words) && $content = strtr( $content, $replace_words);

        }
		
		return $content;
		
	}
	
}