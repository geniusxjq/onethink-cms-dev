<?php

// +----------------------------------------------------------------------
// | Author: genisuxjq <app880@foxmail.com> <http://www.app880.com>
// +----------------------------------------------------------------------

/**
 * 友好的时间显示
 *
 * @param int    $time 待显示的时间
 * @param string $precision 精度
 * @return string
 */
 
function friendly_time($time,$precision=false) {
	
	$date=new \Org\Util\Date();
	
	//如果为时间戳那么就将其转换成日期格式
	!preg_match("/[^\d]+/",$time)&&$time=time_format($time);
	
	return $date->timeDiff($time,$precision);
	
}
