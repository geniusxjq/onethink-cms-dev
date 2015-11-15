+$(function(){
    $(document).on('submit','.comment-box form' ,function(){
        var $form = $(this);
        var url = $form.attr('action');
        var data = {};
        data.did = $form.find('input[name="did"]').val();
        data.pid = $form.find('input[name="pid"]').val();
        data.content = $form.find('textarea[name="content"]').val();
        data.verify_code = $form.find('input[name="verify_code"]').val();
		if(!data.content){
			$.zui.messager.info("请填写评论内容",{placement:"center"});
			return false;
		}
        $.post(url, data, function(res) {
            if (res.status) {
                $.zui.messager.success(res.info,{placement:"center"});
				$('.comment-box .comment-verify-img').click();
            }else {
                $.zui.messager.danger(res.info,{placement:"center"});
            }
        }, 'json');
		
		return false;
    });
	
	$(function(){
		$('.comment-box .comment-verify-img').click(function(){  
			// 刷新验证码
			$(this).attr('src',$(this).attr('src').replace(/\?.*$/,'')+'?'+Date.parse (new Date ()));
		});
	});
	
	$(document).on('click','.comment-box .comments .comment >.content .quote',function(){
		 
		setPID($(this).data('pid'));
		
		$("html,body").animate({scrollTop:($('#comment-reply-form').offset().top)},"slow");
		
		$(".comment-box textarea").focus();
		
	});
	
    function setPID(id) {
        $('input[name="pid"]').val(id);
    }
	
})(jQuery);