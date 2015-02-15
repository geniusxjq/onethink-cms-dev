<?php
/**
 * @Description: 投票插件
 * @author Microrain  xinjy@qq.com
 * @date 14-3-9
 * @version V0.1
 */
 
namespace Addons\Vote\Controller;

use Admin\Controller\AddonsController;

class VoteAdminController extends AddonsController
{
	public function saveVote()
	{

		if (IS_POST) {
			$id = I('post.id');
			$title = I('post.title');
			$description = I('post.description');
			$options = I('post.options');
			$explanation = I('post.explanation');
			$voteconfig = I('post.voteconfig');
			$data = array(
				'title' => $title,
				'description' => $description,
				'options' => $options,
				'explanation' => $explanation,
				'voteconfig' => $voteconfig,
			);

			if ($id == "") {					//新建
				$data['create_time'] = time();
				$ov = M('vote')->add($data);
			} else {							//修改
				$data['update_time'] = time();
				$ov = M('vote')->where('id=' . $id)->save($data);
			}

			if ($ov) {
				$status = 1;
			} else {
				$status = 0;
			}
			echo($status);
		}
	}

}
