<?php

/*

解析文本内容（主要用于内容的过滤。如敏感词过滤）

@param $content string 要解析的内容

*/

function parseContent($content){
	
	/*
	调用敏感词过滤插件类(SensitiveAddon)进行敏感此过滤
	*/
	
	$class=get_addon_class("Sensitive");
	
	if(class_exists($class)){
		
		$class=new $class();	
		
		$content=$class->parseSensitiveWords(array('content'=>$content));
		
	}
	
	/*
	敏感词过滤 END
	*/
	
	return $content;

}

/**
 * 取一个二维数组中的每个数组的固定的键知道的值来形成一个新的一维数组
 * @param $pArray 一个二维数组
 * @param $pKey 数组的键的名称
 * @return 返回新的一维数组
 */

function getSubByKey($pArray, $pKey = "", $pCondition = "")
{
    $result = array();
    if (is_array($pArray)) {
        foreach ($pArray as $temp_array) {
            if (is_object($temp_array)) {
                $temp_array = (array)$temp_array;
            }
            if (("" != $pCondition && $temp_array[$pCondition[0]] == $pCondition[1]) || "" == $pCondition) {
                $result[] = ("" == $pKey) ? $temp_array : isset($temp_array[$pKey]) ? $temp_array[$pKey] : "";
            }
        }
        return $result;
    } else {
        return false;
    }
}

