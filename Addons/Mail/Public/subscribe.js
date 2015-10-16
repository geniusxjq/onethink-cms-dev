$(function () {
	$('.subscribe_btn').click(function (e) {
		$('#frame_subscribe').toggle();
	})
	$('#subscribe_submit_btn').click(function () {


		var patterns = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
		var email_address = $('#email_address').val();
		if (email_address == '' || !patterns.test(email_address)) {
			alert('请输入正确的邮箱格式');
		}
		else {
			$.post("{:addons_url('Mail://MailRss/subScribe')}", {email_address: email_address}, function (res) {
				if (res.status) {
					alert(res.info);
					$('#email_address').val('');
					$('#frame_subscribe').hide();
				} else {
				   alert(res.info);
				}
			}, 'json')
		}

	})
})