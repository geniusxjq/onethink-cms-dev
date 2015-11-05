<?php

// +----------------------------------------------------------------------
// | Author: genisuxjq <app880@foxmail.com> <http://www.app880.com>
// +----------------------------------------------------------------------

/*
 解析文本内容（主要用于内容的过滤。如敏感词过滤）
 @param $content string 要解析的内容
*/

function parse_content($content){
	
	/*调用敏感词过滤插件类(SensitiveAddon)进行敏感词过滤*/
	$class=get_addon_class("Sensitive");
	
	if(class_exists($class)){
		
		$class=new $class();	
		
		$content=$class->parseSensitiveWords($content);
		
	}
	/*敏感词过滤 END*/
	
	return $content;

}

/*
*返回页码（bootstrap风格"<li><a></a></li>"）
*@param int $conut 总记录数
*@param int $pagesize 每页显示记录数
*/

function parse_page($count,$pagesize){
	$result='';
	$page = new \Think\Page($count,$pagesize);
	$page->setConfig('header' ,'<li class="total"><a>%NOW_PAGE%/%TOTAL_PAGE%</a></li>');
	$page->setConfig('theme','<li>%FIRST%</li><li class="previous">%UP_PAGE%</li>%LINK_PAGE%<li class="next">%DOWN_PAGE%</li> %HEADER%');
	$result= preg_replace('/^\<div\>|\<\/div\>$/i','',$page->show());
	$result= preg_replace('/\<span class=\"current\"\>(\w*)\<\/span\>/i','<li class="active current"><a>$1</a></li>',$result);
	$result = preg_replace('/\<a class=\"num\"(\w*[^\<\>]*)\>(\w*[^\<\>]*)\<\/a\>/i','<li class="num"><a $1 >$2</a></li>',$result);
	return $result;
}

/**
 * 取一个二维数组中的每个数组的固定的键知道的值来形成一个新的一维数组
 * @param $array 一个二维数组
 * @param $key 数组的键的名称
 * @return 返回新的一维数组
 */

function get_sub_by_key($array, $key = "", $condition = "")
{
    $result = array();
    if (is_array($array)) {
        foreach ($array as $temp_array) {
            if (is_object($temp_array)) {
                $temp_array = (array)$temp_array;
            }
            if (("" != $condition && $temp_array[$condition[0]] == $condition[1]) || "" == $condition) {
                $result[] = ("" == $key) ? $temp_array : isset($temp_array[$key]) ? $temp_array[$key] : "";
            }
        }
        return $result;
    } else {
        return false;
    }
}

/*获取字串首字母*/

function get_first_letter($s0) {
    $firstchar_ord = ord(strtoupper($s0{0}));
    if($firstchar_ord >= 65 and $firstchar_ord <= 91) return strtoupper($s0{0});
    if($firstchar_ord >= 48 and $firstchar_ord <= 57) return '#';
    $s = iconv("UTF-8", "gb2312", $s0);
    $asc = ord($s{0}) * 256 + ord($s{1}) - 65536;
    if($asc>=-20319 and $asc<=-20284) return "A";
    if($asc>=-20283 and $asc<=-19776) return "B";
    if($asc>=-19775 and $asc<=-19219) return "C";
    if($asc>=-19218 and $asc<=-18711) return "D";
    if($asc>=-18710 and $asc<=-18527) return "E";
    if($asc>=-18526 and $asc<=-18240) return "F";
    if($asc>=-18239 and $asc<=-17923) return "G";
    if($asc>=-17922 and $asc<=-17418) return "H";
    if($asc>=-17417 and $asc<=-16475) return "J";
    if($asc>=-16474 and $asc<=-16213) return "K";
    if($asc>=-16212 and $asc<=-15641) return "L";
    if($asc>=-15640 and $asc<=-15166) return "M";
    if($asc>=-15165 and $asc<=-14923) return "N";
    if($asc>=-14922 and $asc<=-14915) return "O";
    if($asc>=-14914 and $asc<=-14631) return "P";
    if($asc>=-14630 and $asc<=-14150) return "Q";
    if($asc>=-14149 and $asc<=-14091) return "R";
    if($asc>=-14090 and $asc<=-13319) return "S";
    if($asc>=-13318 and $asc<=-12839) return "T";
    if($asc>=-12838 and $asc<=-12557) return "W";
    if($asc>=-12556 and $asc<=-11848) return "X";
    if($asc>=-11847 and $asc<=-11056) return "Y";
    if($asc>=-11055 and $asc<=-10247) return "Z";
    return '#';
}