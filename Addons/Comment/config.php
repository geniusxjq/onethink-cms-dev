<?php

return array(
  'comment_title' => array(
    'title'   => '评论标题',
    'type'    => 'text',
    'value'   => '评论列表',
    'tip'     => '可以设置文档中评论列表的标题',
    ),
  'comment_enable' => array(
    'title' => '开启评论',
    'tip'   => '评论全局开关',
    'type'  => 'radio',
    'options' => array(
      '0' => '关闭',
      '1' => '开启',
      ),
    'value' => '1',
    ),
  
  'comment_show_examine_not' => array(
    'title' => '显示未审核评论',
    'tip'   => '是否显示未审核的评论',
    'type'  => 'radio',
    'options' => array(
      '0' => '否',
      '1' => '是',
      ),
    'value' => '1',
    ),
  
  'comment_verify' => array(
    'title'   => '使用验证码',
    'type'    => 'radio',
    'options' => array(
      '0' => '不使用',
      '1' => '使用'
      ),
    'value'   => '1',
    'tip'     => '提交评论时使用验证码'
    ),
    'comment_max_length' => array(
    'title'   => '评论字数限制',
    'type'    => 'text',
    'value'   => '150',
    'tip'     => '评论最大字数限制',
    ),
  'comment_pagesize' => array(
    'title'   => '每页显示评论条数',
    'type'    => 'text',
    'value'   => '25',
    'tip'     => '每页显示评论的数量，太大可能会影响性能',
    ),
  'comment_need_login' => array(
    'title'   => '登录评论',
    'type'    => 'radio',
    'options' => array(
      '0' => '否',
      '1' => '是'
      ),
    'value'   => '0',
    'tip'     => '登录用户才可以评论'
    ),
  'comment_template' => array(
    'title'   => '评论主题模版',
    'tip'     => '主题模版的目录名称，默认为default',
    'type'    => 'text',
    'value'   => 'default'
    )
  );