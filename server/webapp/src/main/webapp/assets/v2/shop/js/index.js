/**
 * aigechibaole.com
 */
 
$().ready(function () {
	
	var $msg_name = $("#msg_name");
	var $msg_phone = $("#msg_phone");
	var $msg_email = $("#msg_email");
	var $msg_msg = $("#msg_msg");
	
	var $msgForm = $("#msg_form");
	
	var $msgCaptcha = $("#msgCaptcha");
	var $msgCaptchaImage = $("#msgCaptchaImage");
	
	// 表单验证
	$msgForm.validate({
		rules: {
			msg_name: {
				required: true,
				pattern: /^[0-9a-z_A-Z\u4e00-\u9fa5]+$/,
				minlength: setting.usernameMinLength,
				maxlength: setting.usernameMaxLength
			},
			msg_phone: {
				required: true,
				pattern: /(^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$)|(^0{0,1}1[3|4|5|6|7|8|9][0-9]{9}$)/
			},
			msg_email: {
				required: true,
				email: true
			},
			msg_msg: {
				required: true,
				minlength: setting.msgMinLength,
				maxlength: setting.msgMaxLength
			},
			captcha: "required"
		},
		messages: {
		},
		submitHandler: function(form) {
			
			$.ajax({
				url: $msgForm.attr("action"),
				type: "POST",
				data: {
					name: $msg_name.val(),
					phone: $msg_phone.val(),
					email: $msg_email.val(),
					msg: $msg_msg.val(),
					captchaId: msgCaptchaId,
					captcha: $msgCaptcha.val()
				},
				dataType: "json",
				cache: false,
				success: function(message) {
					$.message(message);
					if (message.type == "success") {
						
					} else {
						$msgCaptcha.val("");
						$msgCaptchaImage.attr("src", baseURL + "/common/captcha.jhtml?captchaId=" + msgCaptchaId + "&timestamp=" + (new Date()).valueOf());
					}
				}
			});
			
			return false;
		}
	});
	
	$msgCaptchaImage.attr("src", baseURL + "/common/captcha.jhtml?captchaId=" + msgCaptchaId + "&timestamp=" + (new Date()).valueOf());
	// 更换验证码
	$msgCaptchaImage.click(function() {
		$msgCaptchaImage.attr("src",  baseURL + '/common/captcha.jhtml?captchaId=' + msgCaptchaId + '&timestamp=' + (new Date()).valueOf());
	});
});