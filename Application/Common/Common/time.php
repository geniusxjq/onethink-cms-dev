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
	
	if(!$time||intval($time)<=0) return;
	
	$date=new \Org\Util\Date();
	
	return $date->timeDiff($time,$precision);
	
}
