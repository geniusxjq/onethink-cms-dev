(function($){
    var $comments_wrapper = $('.document-comments');
    var $comments = $('.document-comments .comment-wrapper');
    var $comment_form = $('.addon-comment-form');
    
	$comments.find('.quote').on('click', function(){
        $comment_form.appendTo($(this).parents('.comment-wrapper').eq(0).children('.comment-content'));
        $('.addon-comment-form .cancel-quote').show();
        setPID($(this).attr('data-pid'));
        return false;
    });

    $('.addon-comment-form input.cancel-quote').on('click', function(){
        $comments_wrapper.after($comment_form);
        $(this).hide();
        setPID(0);
    });
    $('.addon-comment-form form').on('submit', function(){
        var $form = $('.addon-comment-form form');
        var url = $form.attr('action');
        var data = {};
        data.did = $form.find('input[name="did"]').val();
        data.pid = $form.find('input[name="pid"]').val();
        data.content = $form.find('textarea[name="content"]').val();
        data.verify_code = $form.find('input[name="verify_code"]').val();
        $.post(url, data, function(r) {
            if (r.status == 1) {
                commentMessage(r.info, true);
            }
            else {
                commentMessage(r.info, false);
            }
        }, 'json');
		
		return false;
    });

    $('.addon-comment-verify-img').on('click', function(){
        refreshVerify();
    });

    function refreshVerify() {
        // 刷新验证码
        var $verify_img = $('.addon-comment-verify-img');
        var verify_img_url = $verify_img.attr('src');
        $verify_img.attr('src', '').attr('src', verify_img_url+'?'+Date.parse (new Date ()));
    }

    function commentMessage(message, refresh) {
        $.zui.messager.danger(message,{placement:"center"});
        if (refresh) window.location.reload();
		return false;
    }

    function setPID(id) {
        $('input[name="pid"]').val(id);
    }
})(jQuery);