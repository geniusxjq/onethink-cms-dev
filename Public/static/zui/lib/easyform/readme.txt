表单验证插件 easyform
Author:LeeLanfei
2014-11-5
用于表单验证

只要在需要验证的控件上添加easyform属性即可，多个属性用[;]连接

属性列表：
null                  空值验证
email                  邮件格式验证
char-normal           英文、数字、下划线
char-chinese          中文、英文、数字、下划线、中文标点符号
char-english          英文、数字、下划线、英文标点符号
length:1-10 / length:4
equal:xxx             等于某个对象的值，冒号后是jq选择器语法
ajax:fun()
real-time                               实时检查
date                    2014-10-31
time                    10:30:00
datetime            2014-10-31 10:30:00
money               正数，两位小数
uint :1                 正整数 , 参数为起始值

***********
 
easytip属性是对提示框的配置，可配置属性有

left: 0,

top: 0,

position: "right",       //top, left, bottom, right

disappear: "other",        //self, other, lost-focus, none, N seconds

speed: "fast",

theme: "white",      //目前只有white、black、blue、red

arrow: "bottom",        //top, left, bottom, right

*******

在ready事件中$(form).easyform()即可。

目前只有一个配置项，{easytip:false}可以关闭提示，默认为true。

实例：

<form id="reg-form" action="" method="post">
<input name="uid" type="text" id="uid" easyform="length:4-16;char-normal;ajax:uid_exist();real-time;" message="用户名必须为4—16位的英文字母或数字" easytip="disappear:lost-focus;theme:blue;" ajax-message="用户名已存在!">
</form>

可以这样定义一个input，通过属性easyform来定义判断条件，message为默认提示，ajax-message属性【-】号前面可以是任意规则的名字，比如length-message即可对某一条件定义一个特殊的提示。

$(document).ready(function (){

  $('#reg-form').easyform();

});