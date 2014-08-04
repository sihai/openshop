<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html>
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta property="qc:admins" content="3275546717611753012174563757" />
		<meta property="wb:webmaster" content="955a134bdab20b26" />
		[@seo type = "index"]
			<title>[#if seo.title??][@seo.title?interpret /][#else]${message("shop.index.title")}[/#if][#if systemShowPowered] - Powered By aigechibaole[/#if]</title>
			[#if seo.keywords??]
				<meta name="keywords" content="[@seo.keywords?interpret /]" />
			[/#if]
			[#if seo.description??]
				<meta name="description" content="[@seo.description?interpret /]" />
			[/#if]
		[/@seo]

		[#include "/shop/include/metaAndcss.ftl" /]
		
		<link href="${base}/assets/v2/shop/css/index.css" rel="stylesheet" type="text/css" />
		
	</head>
	
	<body>
	
		<div class="page">
			[#include "/shop/include/simpleHeader.ftl" /]
			
			<div class="content">
			
				<div class="block">
					<!--
					<div class="title">
						<div class="title_head"></div>
						<a style="margin-left:20px;" href="#"><strong>请登陆</strong></a>
					</div>
					-->
					<div class="body">
						
						<table style="width:100%;vertical-align:top;">
							<tr>
								<td style="width:50%;vertical-align:top;">
									<img src="http://storage.shopxx.net/demo-image/3.0/ad/login.jpg" width="500" height="330" alt="会员登录" title="会员登录">
								</td>
								<td style="width:50%;vertical-align:top;">
									<div class="login">
										<div class="main">
											<div class="title">
												<strong style="margin-left:10px;">会员登录</strong>&nbsp;|&nbsp;USER LOGIN
											</div>
											<form id="login-form-2" action="/login/submit.jhtml" method="post" novalidate="novalidate">
												<table style="height:270px;">
													<tbody>
														<tr>
															<th>
																	用户名/E-mail:
															</th>
															<td>
																<input type="text" id="user_name" name="user_name" class="text valid" maxlength="20">
															</td>
														</tr>
														<tr>
															<th>
																密&nbsp;&nbsp;码:
															</th>
															<td>
																<input type="password" id="password2" name="password2" class="text" maxlength="20" autocomplete="off">
															</td>
														</tr>
														<tr>
															<th>
																验证码:
															</th>
															<td>
																<span class="fieldSet">
																	<input type="text" id="captcha2" name="captcha2" class="text captcha" maxlength="4" autocomplete="off">
																	<img id="captchaImage2" class="captchaImage" src="${base}/assets/front/images/spacer.gif" title="${message("shop.captcha.imageTitle")}">
																</span>
															</td>
														</tr>
														<tr>
															<th>
																&nbsp;
															</th>
															<td>
																<label>
																	<input type="checkbox" id="isRememberUsername" name="isRememberUsername" value="true">记住用户名
																</label>
																<label>
																	&nbsp;&nbsp;<a href="/password/find.jhtml">找回密码</a>
																</label>
															</td>
														</tr>
														<tr>
															<th>
																&nbsp;
															</th>
															<td>
																<input type="submit" class="submit" value="登 录">
															</td>
														</tr>
														<tr class="register">
															<td colspan="2">
																<table style="margin-left:10px;">
																	<tr>
																		<td style="width:80px;">
																			<a href="/register.jhtml">立即注册</a>
																		</td>
																		<td style="width:80px;">
																			<span id="qqLoginBtn"><a href="javascript:;" onclick="return window.open('https://graph.qq.com/oauth2.0/authorize?client_id=100510294&amp;response_type=token&amp;scope=all&amp;redirect_uri=http%3A%2F%2Fqzonestyle.gtimg.cn%2Fqzone%2Fopenapi%2Fredirect-1.0.1.html', 'oauth2Login_10200' ,'height=525,width=585, toolbar=no, menubar=no, scrollbars=no, status=no, location=yes, resizable=yes');"><img src="http://qzonestyle.gtimg.cn/qzone/vas/opensns/res/img/Connect_logo_7.png" alt="QQ登录" border="0"></a></span>
																		</td>
																		<td style="width:80px;">
																			<span id="wb_connect_btn"><div class="WB_loginButton WB_widgets"><a href="javascript:void(0);"><img src="http://timg.sjs.sinajs.cn/t4/appstyle/widget/images/loginButton/loginButton_24.png"></a></div></span>
																		</td>
																		<td>
																		</td>
																	</tr>
																</table>
															</td>
														</tr>
													</tbody>
												</table>
											</form>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
						</table>
						
					</div>
				</div>	
			</div>
			
			[#include "/shop/include/newFooterV2.ftl" /]
		</div>
	</body>
	
	[#include "/shop/include/js.ftl" /]
	
	<script type="text/javascript" src="${base}/assets/v2/shop/js/i.js"></script>
	
	<script type="text/javascript">
		$().ready(function () {
			var $username2 = $('#user_name');
			var $password2 = $('#password2');
			var $captcha2 = $('#captcha2');
			var $submit2 = $("#login-form-2 :submit");
			var $captchaImage2 = $("#captchaImage2");
			
			// 表单验证、记住用户名
			var $loginForm2 = $("#login-form-2");
			$loginForm2.validate({
				rules: {
					user_name: "required",
					password2: "required",
					captcha2: "required"
				},
				submitHandler: function(form) {
					$.ajax({
						url: baseURL + "/common/public_key.jhtml",
						type: "GET",
						dataType: "json",
						cache: false,
						beforeSend: function() {
							$submit2.prop("disabled", true);
						},
						success: function(data) {
							var rsaKey = new RSAKey();
							rsaKey.setPublic(b64tohex(data.modulus), b64tohex(data.exponent));
							var enPassword = hex2b64(rsaKey.encrypt($password2.val()));
							$.ajax({
								url: $loginForm2.attr("action"),
								type: "POST",
								data: {
									username: $username2.val(),
									enPassword: enPassword,
									captchaId: captchaId,
									captcha: $captcha2.val()
								},
								dataType: "json",
								cache: false,
								success: function(message) {
									addCookie("username", $username2.val(), {expires: 7 * 24 * 60 * 60});
									$submit2.prop("disabled", false);
									if (message.type == "success") {
										location.href = '${redirectUrl}';
									} else {
										$.message(message);
										$captcha2.val("");
										$captchaImage2.attr("src", baseURL + '/common/captcha.jhtml?captchaId=' + captchaId + '&timestamp=' + (new Date()).valueOf());
									}
								}
							});
						}
					});
				}
			});
			
			// 
			$captchaImage2.attr("src",  '/common/captcha.jhtml?captchaId=' + captchaId + '&timestamp=' + (new Date()).valueOf());
			
			// 更换验证码
			$captchaImage2.click(function() {
				$captchaImage2.attr("src",  '/common/captcha.jhtml?captchaId=' + captchaId + '&timestamp=' + (new Date()).valueOf());
			});
		});
	</script>
</html>