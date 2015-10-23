<?php
namespace Addons\Vote\Controller;

use Home\Controller\AddonsController;

/**
 * Created by PhpStorm.
 * User: xinjy
 * Date: 14-3-9
 * Time: 13:44
 */
class ViewVoteController extends AddonsController
{

	public function index()
	{
		$id = I('get.id');
		$list = M('vote')->where('id=' . $id)->order('id desc')->find();
		$options = $list["options"];
		$options = json_decode($options, true);
		$this->assign("id",$list['id']);
		$this->assign("title", $list["title"]);
		$this->assign("voteconfig", $list['voteconfig']);
		$this->assign("options", $options);
		$this->display(T('Addons://Vote@./index'));
	}

	/**
	 * 显示投票结果
	 */
	public function ViewVoteResult()
	{
		$id = I('get.id');
		$list = M('vote')->where('id=' . $id)->find();
		$options = $list["options"];
		$options = json_decode($options, true);

		$votecount = 0; //总票数
		while (list($key) = each($options)) {
			$votecount += $options[$key]['num'];
		}

		$this->assign("title", $list["title"]);
		$this->assign("votecount", $votecount);
		$this->assign("voteconfig", $list['voteconfig']);
		$this->assign("description", $list['description']);
		$this->assign("options", $options);

		$this->display(T('Addons://Vote@./ViewVoteResult'));
	}


}