<?php
/**
 * @Description: 投票插件
 * @author Microrain  xinjy@qq.com
 * @date 14-3-9
 * @version V0.1
 */
 
namespace Addons\Vote\Controller;

use Home\Controller\AddonsController;

class VoteController extends AddonsController
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

	public function saveSubmit()
	{
		$id = I('post.id'); //获取操作投票的ID
		$op = I('post.op'); //投票数据
		//查询操作的投票记录
		$list = M('vote')->where('id=' . $id)->find();
		$options = $list['options'];
		$arrop = json_decode($options, true);
		while (list($key) = each($arrop)) {
			if ($arrop[$key]['voteconfig'] == '2') { //多选值的处理
				if (in_array($arrop[$key]['id'], $op))
					$arrop[$key]['num'] += 1;

			} else {
				if ($arrop[$key]['id'] == $op) 		//单选值的处理
					$arrop[$key]['num'] += 1;

			}
		}
		$voteobj = M("vote");
		$data['options'] = json_encode($arrop);
		$voteobj->where('id=' . $id)->save($data);
		$this->success('投票成功！',U('Home/addons/execute', array('_addons' => 'Vote', '_controller' => 'ViewVote', '_action' => 'ViewVoteResult', 'id' => $id), true, false, true));
	}

}
