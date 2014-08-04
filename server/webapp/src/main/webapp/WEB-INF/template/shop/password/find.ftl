<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>${message("shop.password.find")}[#if systemShowPowered] - Powered By aigechibaole[/#if]</title>
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
							<strong>${message("shop.password.find")}</strong>FORGOT PASSWORD
						</div>
						<form id="passwordForm" action="find.jhtml" method="post">
							<input type="hidden" name="captchaId" value="${captchaId}" />
							<table>
								<tr>
									<th>
										<span class="requiredField"></span>${message("shop.password.username")}:
									</th>
									<td>
										<input type="text" id="username" name="username" class="text" maxlength="${setting.usernameMaxLength}" />
									</td>
								</tr>
								<tr>
									<th>
										<span class="requiredField"></span>${message("shop.password.email")}:
									</th>
									<td>
										<input type="text" id="email" name="email" class="text" maxlength="200" />
									</td>
								</tr>
								[#if setting.captchaTypes?? && setting.captchaTypes?seq_contains("findPassword")]
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
			var $username = $("#username");
			var $email = $("#email");
			var $captcha = $("#captcha");
			var $captchaImage = $("#captchaImage");
			var $submit = $(":submit");
			
			var isInserted = false;
			
			// 更换验证码
			$captchaImage.click(function() {
				$captchaImage.attr("src", "${base}/common/captcha.jhtml?captchaId=${captchaId}&timestamp=" + (new Date()).valueOf());
			});
			
			// 表单验证
			$passwordForm.validate({
      			errorPlacement: function(error, element) {  //错误提示在什么地方  
         			if (element.attr("name") == "username" || element.attr("name") == "email" ) {
         				if(!isInserted) {
         					isInserted = true;
         					error.insertAfter("#email");
         				}  
         			} else {  
           				error.insertAfter(element);  
         			}  
       			}, 
				rules: {
					username: {
						required: { 
                    		depends:function() { //二选一  
                        		return ($('#email').val().length <= 0);  
                    		} 
                		}
					},
					email: {
						required: { 
                    		depends:function() { //二选一
                        		return ($('#username').val().length <= 0);  
                    		} 
                		},
						email: true
					},
					captcha: "required"
				},
				messages: { //提示报错
            		username: '${message("shop.password.username_or_email_needed")}',  
            		email: '${message("shop.password.username_or_email_needed")}'  
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
								[#if setting.captchaTypes?? && setting.captchaTypes?seq_contains("findPassword")]
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