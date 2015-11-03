<?php
return array(
	'is_open'=>array(//配置在表单中的键名 ,这个会是config[random]
		'title'=>'是否开启:',//表单的文字
		'type'=>'radio',		 //表单的类型：text、textarea、checkbox、radio、select等
		'options'=>array(		 //select 和radion、checkbox的子选项
			'1'=>'开启',		 //值=>文字
			'0'=>'关闭',
		),
		'value'=>'1',			 //表单的默认值
	),
	'is_open_log'=>array(//配置在表单中的键名 ,这个会是config[random]
		'title'=>'是否开启日志功能',//表单的文字
		'tip'=>'日志功能在云部署中不可用建议关闭，如 新浪的 SAE ',
		'type'=>'radio',		 //表单的类型：text、textarea、checkbox、radio、select等
		'options'=>array(		 //select 和radion、checkbox的子选项
			'1'=>'开启',		 //值=>文字
			'0'=>'关闭',
		),
		'value'=>'1',			 //表单的默认值
	),
);
					