<?php

return array(
   
	'switch' => array( //配置在表单中的键名 ,这个会是config[title]
        'title' => '是否开启添加水印：', //表单的文字
        'type' => 'radio', //表单的类型：text、textarea、checkbox、radio、select等
        'options' => array(
            '1' => '是',
            '0' => '否',
        ),
        'value' => '1',
        'tip' => '默认关闭水印'
    ),
    'type' => array( //配置在表单中的键名 ,这个会是config[title]
        'title' => '水印类型：', //表单的文字
        'type' => 'select', //表单的类型：text、textarea、checkbox、radio、select等
        'options' => array(
            '0' => '文字',
			'1' => '图片',
        ),
        'value' => '0',
        'tip' => '选择使用图片还是文字做水印'
    ),
	'position' => array(
        'title' => '水印位置',
        'type'=>'select',		 //表单的类型：text、textarea、checkbox、radio、select等
        'options'=>array(		 //select 和radion、checkbox的子选项
            '1'=>'左上',		 //值=>文字
            '2'=>'中上',
            '3'=>'右上',
            '4'=>'左中',
            '5'=>'中间',
            '6'=>'右中',
            '7'=>'左下',
            '8'=>'中下',
            '9'=>'右下',

        ),
        'value'=>'9',
        'tip' => '配置水印的位置'
    ),		
	'textcolor' => array(
        'title' => '水印文字色彩',
        'type' => 'color',
        'value' => '#000',
		'tip' => '选择文字水印色彩，默认黑色。'
    ),
	'fontsize' => array(
        'title' => '字体大小',
        'type' => 'text',
        'value' => '21',
		'tip' => '文字水印的字体大小，默认32号'
    ),	
	'font' => array(
        'title' => '水印字体',
        'type'=>'select',		 //表单的类型：text、textarea、checkbox、radio、select等
        'options'=>array(		 //select 和radion、checkbox的子选项
            'simhei'=>'黑体',		 //值=>文字
            'NightClub'=>'NightClub（英文）',
        ),
        'value'=>'1',
        'tip' => '文字水印的字体，默认黑体'
    ),	
	'offset' => array(
        'title' => '水印文字相对边距',
        'type'=>'text',		 //表单的类型：text、textarea、checkbox、radio、select等
        'value'=>'20',
        'tip' => '文字水印的文字相对图片边缘的边距，默认0px，水印位置是中间时忽略。'
    ),	
	
	'alpha' => array(
        'title' => '水印图片透明度',
        'type' => 'text',
        'value' => '80',
		'tip' => '图片透明度有效值0-100，默认80'
    ),
	
	'text' => array(
        'title' => '水印文字',
        'type' => 'text',
        'value' => '请设置水印文字',
		'tip' => '文字水印'
    ),

	'water' => array(
        'title' => '水印图片',
        'type' => 'water',
        'value' => '',
		'tip' => '图片水印'
    ),

);
