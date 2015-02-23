<?php
/**
 * Onethink 评论插件，功能演示版本
 * @copyright   
 * @author      Wolix Li <wolixli@gmail.com>
 * @link        
 * 各位叔叔大爷、婶婶大娘、哥哥姐姐、弟弟妹妹们行行好，如果哪位走在网路上可怜我四十几岁的小乞丐，可顺便给我打点零花钱，
 * 半年在家呆着没挣着钱，快过年了，没钱给小孩子们包红包、没钱给老人们孝敬槽子糕，也没钱给我那可怜的老婆买新衣服。
 * 一块两块不嫌少，10万八万的不嫌多，美元、日元都可以，最欢迎人民币，我的支付宝账号和 paypal的账号都是： wolix@139.com
 * 专业组团定制互联网php产品，联系QQ: 4118814
 * 现在做雷锋也留名，请不要再叫我雷锋了，叫我“老李”就行了！
 * 2014/1/14
 **/
namespace Addons\Comment\Model;
use Think\Model;

/**
 * 评论模型
 */
class CommentModel extends Model{
	/**
	 * 评论模型自动完成
	 * @var array
	 */
	protected $_auto = array(
		array('uid', 'session', self::MODEL_INSERT, 'function', 'user_auth.uid'),
		array('create_time', NOW_TIME, self::MODEL_INSERT),
        array('com_ip', 'get_client_ip', self::MODEL_INSERT, 'function', 1),
		array('status', 1, self::MODEL_BOTH),
		array('digg', 0, self::MODEL_INSERT),
		array('model_id','require','不知道是哪个类型的内容!'),
		array('comment','require','没有评论内容，就别发表了!'),
		array('comment', 'htmlspecialchars', self::MODEL_BOTH, 'function'),
		array('cid','require','不知道是哪个内容的评论!'),
	);
	
	public $model = array(
        'title'=>'留言',//新增[title]、编辑[title]、删除[title]的提示
        'template_add'=>'',//自定义新增模板自定义html edit.html 会读取插件根目录的模板
        'template_edit'=>'',//自定义编辑模板html
        'search_key'=>'',// 搜索的字段名，默认是title
        'extend'=>1,
    );

	protected function _after_find(&$result,$options) {
		
		$result['create_time_text'] = friendly_date($result['create_time']);
		$result['ip'] = long2ip($result['com_ip']);
		$result['comment']=parse_content($result['comment']);//过滤文本

		 
	}

	protected function _after_select(&$result,$options){
		foreach($result as &$record){
			$this->_after_find($record,$options);
		}
	}

	public function diggit($id){
		return $this->where('id='.$id)->setInc('digg');
	}
	
	public $_fields = array(
        'id'=>array(
            'name'=>'id',//字段名
            'title'=>'ID',//显示标题
            'type'=>'num',//字段类型
            'remark'=>'',// 备注，相当于配置里的tip
            'is_show'=>3,// 1-始终显示 2-新增显示 3-编辑显示 0-不显示
            'value'=>0,//默认值
        ),
        'is_pass'=>array(
            'name'=>'is_pass',
            'title'=>'是否通过',
            'type'=>'radio',
            'extra'=>'0:不通过,1:通过',
            'is_show'=>3,
            'value'=>0,
        ),
        'is_reply'=>array(
            'name'=>'is_reply',
            'title'=>'是否回复',
            'type'=>'radio',
            'extra'=>'0:不回复,1:回复',
            'is_show'=>3,
            'value'=>0,
        ), 
        'r_content'=>array(
            'name'=>'r_content',
            'title'=>'回复内容',
            'type'=>'textarea',
            'is_show'=>3,
        ),
    );

}