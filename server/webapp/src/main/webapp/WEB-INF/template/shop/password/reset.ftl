<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>${message("shop.password.reset")}[#if systemShowPowered] - Powered By openteach inc.[/#if]</title>
		[#include "/shop/include/metaAndcss.ftl" /]
		<link href="${base}/resources/shop/css/password.css" rel="stylesheet" type="text/css" />
	</head>
	<body class="women ">
		<div id="fb-root"></div>
		<script src="${base}/assets/front/js/browser_detect.js"></script>
		
	    [#include "/shop/include/newHeader.ftl" /]
	    [#include "/shop/include/announcement.ftl" /]
	    
		<div class="container password">
			<div class="span24">
				<div class="wrap">
					<div class="main">
						<div class="title">
							<strong>${message("shop.password.reset")}</strong>RESET PASSWORD
						</div>
						<form id="passwordForm" action="reset.jhtml" method="post">
							<input type="hidden" name="captchaId" value="${captchaId}" />
							<input type="hidden" name="username" value="${member.username}" />
							<input type="hidden" name="key" value="${key}" />
							<table>
								<tr>
									<th>
										${message("shop.password.username")}:
									</th>
									<td>
										${member.username}
									</td>
								</tr>
								<tr>
									<th>
										<span class="requiredField">*</span>${message("shop.password.newPassword")}:
									</th>
									<td>
										<input type="password" id="newPassword" name="newPassword" class="text" maxlength="${setting.passwordMaxLength}" autocomplete="off" />
									</td>
								</tr>
								<tr>
									<th>
										<span class="requiredField">*</span>${message("shop.password.rePassword")}:
									</th>
									<td>
										<input type="password" name="rePassword" class="text" maxlength="${setting.passwordMaxLength}" autocomplete="off" />
									</td>
								</tr>
								[#if setting.captchaTypes?? && setting.captchaTypes?seq_contains("resetPassword")]
									<tr>
										<th>
											<span class="requiredField">*</span>${message("shop.captcha.name")}:
										</th>
										<td>
											<span class="fieldSet">
												<input type="text" id="captcha" name="captcha" class="text captcha" maxlength="4" autocomplete="off" /><img id="captchaImage" class="captchaImage" src="${base}/common/captcha.jhtml?captchaId=${captchaId}" title="${message("shop.captcha.imageTitle")}" />
											</span>
										</td>
									</tr>
								[/#if]
								<tr>
									<th>
										&nbsp;
									</th>
									<td>
										<input type="submit" class="submit" value="${message("shop.password.submit")}" />
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		[#include "/shop/include/newFooter.ftl" /]
	</body>
	<script type="text/javascript">
		$().ready(function() {
		
			var $passwordForm = $("#passwordForm");
			var $password = $("#password");
			var $captcha = $("#captcha");
			var $captchaImage = $("#captchaImage");
			var $submit = $(":submit");
			
			// 更换验证码
			$captchaImage.click(function() {
				$captchaImage.attr("src", "${base}/common/captcha.jhtml?captchaId=${captchaId}&timestamp=" + (new Date()).valueOf());
			});
			
			// 表单验证
			$passwordForm.validate({
				rules: {
					newPassword: {
						required: true,
						pattern: /^[^\s&\"<>]+$/,
						minlength: ${setting.passwordMinLength}
					},
					rePassword: {
						required: true,
						equalTo: "#newPassword"
					},
					captcha: "required"
				},
				submitHandler: function(form) {
					$.ajax({
						url: $passwordForm.attr("action"),
						type: "POST",
						data: $passwordForm.serialize(),
						dataType: "json",
						cache: false,
						beforeSend: function() {
							$submit.prop("disabled", true);
						},
						success: function(message) {
							$.message(message);
							if (message.type == "success") {
								setTimeout(function() {
									$submit.prop("disabled", false);
									location.href = "${base}/";
								}, 3000);
							} else {
								$submit.prop("disabled", false);
								[#if setting.captchaTypes?? && setting.captchaTypes?seq_contains("resetPassword")]
									$captcha.val("");
									$captchaImage.attr("src", "${base}/common/captcha.jhtml?captchaId=${captchaId}&timestamp=" + (new Date()).valueOf());
								[/#if]
							}
						}
					});
				}
			});
		
		});
	</script>
</html>