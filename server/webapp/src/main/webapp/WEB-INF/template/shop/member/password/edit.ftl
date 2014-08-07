[#assign current = "passwordEdit" /]
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>${message("shop.member.password.edit")}[#if systemShowPowered] - Powered By openteach inc.[/#if]</title>
		[#include "/shop/include/metaAndcss.ftl" /]
		<link href="${base}/resources/shop/css/member.css" rel="stylesheet" type="text/css" />
		
	</head>
	<body class="women ">
		
		<div id="fb-root"></div>
		<script src="${base}/assets/front/js/browser_detect.js"></script>
		
	    [#include "/shop/include/newHeader.ftl" /]
	    [#include "/shop/include/announcement.ftl" /]
	    
		<div class="container member">
			[#include "/shop/member/include/navigation.ftl" /]
			<div class="span18 last">
				<div class="input">
					<div class="title">${message("shop.member.password.edit")}</div>
					<form id="inputForm" action="update.jhtml" method="post">
						<table class="input">
							<tr>
								<th>
									${message("shop.member.password.currentPassword")}: 
								</th>
								<td>
									<input type="password" name="currentPassword" class="text" maxlength="20" />
								</td>
							</tr>
							<tr>
								<th>
									${message("shop.member.password.newPassword")}: 
								</th>
								<td>
									<input type="password" id="password" name="password" class="text" maxlength="20" />
								</td>
							</tr>
							<tr>
								<th>
									${message("shop.member.password.rePassword")}: 
								</th>
								<td>
									<input type="password" name="rePassword" class="text" maxlength="20" />
								</td>
							</tr>
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									<input type="submit" class="button" value="${message("shop.member.submit")}" />
									<input type="button" class="button" value="${message("shop.member.back")}" onclick="location.href='../index.jhtml'" />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		[#include "/shop/include/newFooter.ftl" /]
	</body>
	<script type="text/javascript">
		$().ready(function() {
		
			var $inputForm = $("#inputForm");
			
			[@flash_message /]
			
			// 表单验证
			$inputForm.validate({
				rules: {
					currentPassword: {
						required: true,
						remote: {
							url: "check_current_password.jhtml",
							cache: false
						}
					},
					password: {
						required: true,
						pattern: /^[^\s&\"<>]+$/,
						minlength: ${setting.passwordMinLength},
						maxlength: ${setting.passwordMaxLength}
					},
					rePassword: {
						required: true,
						equalTo: "#password"
					}
				},
				messages: {
					password: {
						pattern: "${message("shop.validate.illegal")}"
					}
				}
			});
		
		});
	</script>
</html>