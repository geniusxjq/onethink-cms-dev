<?php

return array(
			 
    // 预先加载的标签库
    'TAGLIB_PRE_LOAD' => 'OT\\TagLib\\Think',

    /* 主题设置 */
    'DEFAULT_THEME' => 'default', // 默认模板主题名称

    /* SESSION 和 COOKIE 配置 */
    'SESSION_PREFIX' => 'onethink_home', //session前缀
    'COOKIE_PREFIX' => 'onethink_home_', // Cookie前缀 避免冲突

    /* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__STATIC__' => __ROOT__ . '/Public/static',
        '__ADDONS__' => __ROOT__ . '/Public/' . MODULE_NAME . '/Addons',
        '__IMG__' => __ROOT__ . '/Application/' . MODULE_NAME . '/Static/images',
        '__CSS__' => __ROOT__ . '/Application/' . MODULE_NAME . '/Static/css',
        '__JS__' => __ROOT__ . '/Application/' . MODULE_NAME . '/Static/js',
    ),
	
);