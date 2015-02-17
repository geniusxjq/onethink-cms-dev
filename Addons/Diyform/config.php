<?php
$encode_url = addons_url("Diyform://Diyform/make_encode");
return array(
	'key'=>array(//配置在表单中的键名 ,这个会是config[key]
                'title' =>  '密钥:',//表单的文字
		'type'  =>  'text',		 //表单的类型：text、textarea、checkbox、radio、select等
		'value' =>  'oX2xnvnpEDhyhpLp8pqqTeeWXuB3i',			 //表单的默认值
                'tip'   =>  '<a style="color:blue" href="javascript:resetCookieEncode();">[重新生成]</a><script>function resetCookieEncode(){jQuery.get("'.$encode_url.'", function(data){jQuery(\'input[name="config\[key\]"]\').val(data);});}</script>'
	),
        'open_verify'=>array(
                'title'=>'验证码',
                'type'=>'radio',
                'options'=>array(
                    '0'=>'关闭',
                    '1'=>'开启'
                ),
                'value'=>'1'
        ),
);
					