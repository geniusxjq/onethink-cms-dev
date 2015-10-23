<?php

/**
 *  | 023SITE
 *  +----------------------------------------------------------------------
 *  | Copyright (c) 2014 http://www.023site.com All rights reserved.
 *  +----------------------------------------------------------------------
 *  | Author:  IT童老  OneThink号:a53663184  <lwl@outlook.com>
 *
 */
namespace Addons\ImportData;

use Common\Controller\Addon;

/**
 * Blog导入OneThink插件
 * @author IT童老  OneThink号:a53663184
 */
class ImportDataAddon extends Addon
{

    public $info = array(
        'name' => 'ImportData',
        'title' => '数据导入',
        'description' => '这是一个用于从其他博客导入到OneThink的后台插件，目前支持WordPress,主要导入分类和文章！',
        'status' => 1,
        'author' => 'IT童老',
        'version' => '0.1'
    );


    public $admin_list = array(
        'fields' => '*', //要查的字段
    );

    public $custom_adminlist = 'admin.html';

    public function install()
    {
        return true;
    }

    public function uninstall()
    {
        return true;
    }

    //实现的AdminIndex钩子方法，空方法为了能安装
    public function AdminIndex($param)
    {
    }

}