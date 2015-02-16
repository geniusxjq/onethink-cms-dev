<?php
return array(
	'random'=>array(//配置在表单中的键名 ,这个会是config[random]
		'title'=>'是否开启随机:',//表单的文字
		'type'=>'radio',		 //表单的类型：text、textarea、checkbox、radio、select等
		'options'=>array(		 //select 和radion、checkbox的子选项
			'1'=>'开启',		 //值=>文字
			'0'=>'关闭',
		),
		'value'=>'1',			 //表单的默认值
	),
	
	
	
	 'group'=>array(
        'type'=>'group',
        'options'=>array(
            'Qq'=>array(
                'title'=>'QQ配置',
                'options'=>array(
                    'QqKEY'=>array(
                        'title'=>'QQ：',
                        'type'=>'text',
                        'value'=>'',
                        'tip'=>'填写客服QQ号',
                    ),
                   
                ),
             ),
			 
			  'Anli'=>array(
                'title'=>'案例',
                'options'=>array(
                    'AnliKEY'=>array(
                        'title'=>'案例：',
                        'type'=>'text',
                        'value'=>'',
                        'tip'=>'填写案例页链接',
                    ),
                   
                ),
             ),
            'sina'=>array(
                'title'=>'新浪微博',
                'options'=>array(

                    'sinaKEY'=>array(
                        'title'=>'微博：',
                        'type'=>'text',
                        'value'=>'',
                        'tip'=>'填写您的微博地址',
                    ),
                    

                ),

            )
        )
    )

);
	