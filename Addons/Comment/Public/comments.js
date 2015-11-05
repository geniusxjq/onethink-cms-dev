(function($){
    $('.comment-box form').on('submit', function(){
        var $form = $('.comment-box form');
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

    $('.comment-verify-img').on('click', function(){
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