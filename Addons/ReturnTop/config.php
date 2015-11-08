<?php
// +----------------------------------------------------------------------
// | Author: geniusxjq <app880.com>
// +----------------------------------------------------------------------

//获取字体数据

$options_theme=R('Addons://ReturnTop/Base/get_theme_list','','Model');

return array(
    'status'=>array(
        'title'=>'是否开启:',
        'type'=>'radio',
        'options'=>array(
            '1'=>'开启',
            '0'=>'关闭',
        ),
        'value'=>'1',
    ),
    'theme'=>array(
        'title'=>'主题:',
        'type'=>'select',
        'options'=>$options_theme,
        'value'=>'rocket'
    ),
    'group'=>array(
        'type'=>'group',
        'options'=>array(
            'flat'=>array(
                'title'=>'客服配置',
                'options'=>array(
                    'support_title'=>array(
                        'title'=>'客服标题',
                        'type'=>'text',
                        'value'=>'客服咨询',
                        'tip'=>'',
                    ),
					'customer'=>array(
                        'title'=>'客服中心',
                        'type'=>'text',
                        'value'=>'',
                        'tip'=>'',
                    ),
                    'case'=>array(
                        'title'=>'客户案例',
                        'type'=>'text',
                        'value'=>'',
                        'tip'=>'',
                    ),
                    'tel'=>array(
                        'title'=>'电话',
                        'type'=>'text',
                        'value'=>'',
                        'tip'=>'',
                    ),
					'qq'=>array(
                        'title'=>'QQ咨询',
                        'type'=>'text',
                        'value'=>'',
                        'tip'=>'',
                    ),
                    'weibo'=>array(
                        'title'=>'新浪微博',
                        'type'=>'text',
                        'value'=>'',
                        'tip'=>'',
                    )
                ),
            )
        )
    )
);
