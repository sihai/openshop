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
									<div class="register">
										<div class="main">
											<div class="title">
												<strong style="margin-left:10px;">会员注册</strong>&nbsp;|&nbsp;USER REGISTER
											</div>
											
											<form id="registerForm" action="${base}/register/submit.jhtml" method="post">
												<table>
													<tr>
														<th>
															<span class="requiredField">*</span>${message("shop.register.username")}:
														</th>
														<td>
															<input type="text" id="username" name="username" class="text" maxlength="${setting.usernameMaxLength}" />
														</td>
													</tr>
													<tr>
														<th>
															<span class="requiredField">*</span>${message("shop.register.password")}:
														</th>
														<td>
															<input type="password" id="password" name="password" class="text" maxlength="${setting.passwordMaxLength}" autocomplete="off" />
														</td>
													</tr>
													<tr>
														<th>
															<span class="requiredField">*</span>${message("shop.register.rePassword")}:
														</th>
														<td>
															<input type="password" name="rePassword" class="text" maxlength="${setting.passwordMaxLength}" autocomplete="off" />
														</td>
													</tr>
													<tr>
														<th>
															<span class="requiredField">*</span>${message("shop.register.email")}:
														</th>
														<td>
															<input type="text" id="email" name="email" class="text" maxlength="200" />
														</td>
													</tr>
													[@member_attribute_list]
														[#list memberAttributes as memberAttribute]
															<tr>
																<th>
																	[#if memberAttribute.isRequired]<span class="requiredField">*</span>[/#if]${memberAttribute.name}:
																</th>
																<td>
																	[#if memberAttribute.type == "name"]
																		<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" maxlength="200" />
																	[#elseif memberAttribute.type == "gender"]
																		<span class="fieldSet">
																			[#list genders as gender]
																				<label>
																					<input type="radio" name="memberAttribute_${memberAttribute.id}" value="${gender}" />${message("Member.Gender." + gender)}
																				</label>
																			[/#list]
																		</span>
																	[#elseif memberAttribute.type == "birth"]
																		<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" onfocus="WdatePicker();" />
																	[#elseif memberAttribute.type == "area"]
																		<span class="fieldSet">
																			<input type="hidden" id="areaId" name="memberAttribute_${memberAttribute.id}" />
																		</span>
																	[#elseif memberAttribute.type == "address"]
																		<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" maxlength="200" />
																	[#elseif memberAttribute.type == "zipCode"]
																		<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" maxlength="200" />
																	[#elseif memberAttribute.type == "phone"]
																		<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" maxlength="200" />
																	[#elseif memberAttribute.type == "mobile"]
																		<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" maxlength="200" />
																	[#elseif memberAttribute.type == "text"]
																		<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" maxlength="200" />
																	[#elseif memberAttribute.type == "select"]
																		<select name="memberAttribute_${memberAttribute.id}">
																			<option value="">${message("shop.common.choose")}</option>
																			[#list memberAttribute.options as option]
																				<option value="${option}">
																					${option}
																				</option>
																			[/#list]
																		</select>
																	[#elseif memberAttribute.type == "checkbox"]
																		<span class="fieldSet">
																			[#list memberAttribute.options as option]
																				<label>
																					<input type="checkbox" name="memberAttribute_${memberAttribute.id}" value="${option}" />${option}
																				</label>
																			[/#list]
																		</span>
																	[/#if]
																</td>
															</tr>
														[/#list]
													[/@member_attribute_list]
													[#if setting.captchaTypes?? && setting.captchaTypes?seq_contains("memberRegister")]
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
															<input type="submit" class="submit" value="${message("shop.register.submit")}" />
														</td>
													</tr>
													<tr>
														<th>
															&nbsp;
														</th>
														<td>
															${message("shop.register.agreement")}
														</td>
													</tr>
													<tr>
														<th>
															&nbsp;
														</th>
														<td>
															<div id="agreement" class="agreement">
																${setting.registerAgreement}
															</div>
														</td>
													</tr>
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
	
	<script type="text/javascript">
		$().ready(function () {
			var $registerForm = $("#registerForm");
			var $username = $("#username");
			var $password = $("#password");
			var $email = $("#email");
			var $areaId = $("#areaId");
			var $captcha = $("#captcha");
			var $captchaImage = $("#captchaImage");
			var $submit = $(":submit");
			var $agreement = $("#agreement");
			
			// 地区选择
			$areaId.lSelect({
				url: "${base}/common/area.jhtml"
			});
			
			// 更换验证码
			$captchaImage.click(function() {
				$captchaImage.attr("src", "${base}/common/captcha.jhtml?captchaId=${captchaId}&timestamp=" + (new Date()).valueOf());
			});
			
			// 注册协议
			$agreement.hover(function() {
				$(this).height(200);
			});
			
			// 表单验证
			$registerForm.validate({
				rules: {
					username: {
						required: true,
						pattern: /^[0-9a-z_A-Z\u4e00-\u9fa5]+$/,
						minlength: ${setting.usernameMinLength},
						remote: {
							url: "${base}/register/check_username.jhtml",
							cache: false
						}
					},
					password: {
						required: true,
						pattern: /^[^\s&\"<>]+$/,
						minlength: ${setting.passwordMinLength}
					},
					rePassword: {
						required: true,
						equalTo: "#password"
					},
					email: {
						required: true,
						email: true
						[#if !setting.isDuplicateEmail]
							,remote: {
								url: "${base}/register/check_email.jhtml",
								cache: false
							}
						[/#if]
					},
					captcha: "required"
					[@member_attribute_list]
						[#list memberAttributes as memberAttribute]
							[#if memberAttribute.isRequired]
								,memberAttribute_${memberAttribute.id}: {
									required: true
								}
							[/#if]
						[/#list]
					[/@member_attribute_list]
				},
				messages: {
					username: {
						pattern: "${message("shop.register.usernameIllegal")}",
						remote: "${message("shop.register.disabledExist")}"
					},
					password: {
						pattern: "${message("shop.register.passwordIllegal")}"
					}
					[#if !setting.isDuplicateEmail]
						,email: {
							remote: "${message("shop.register.emailExist")}"
						}
					[/#if]
				},
				submitHandler: function(form) {
					$.ajax({
						url: "${base}/common/public_key.jhtml",
						type: "GET",
						dataType: "json",
						cache: false,
						beforeSend: function() {
							$submit.prop("disabled", true);
						},
						success: function(data) {
							var rsaKey = new RSAKey();
							rsaKey.setPublic(b64tohex(data.modulus), b64tohex(data.exponent));
							var enPassword = hex2b64(rsaKey.encrypt($password.val()));
							$.ajax({
								url: $registerForm.attr("action"),
								type: "POST",
								data: {
									username: $username.val(),
									enPassword: enPassword,
									email: $email.val()
									[#if setting.captchaTypes?? && setting.captchaTypes?seq_contains("memberRegister")]
										,captchaId: "${captchaId}",
										captcha: $captcha.val()
									[/#if]
									[@member_attribute_list]
										[#list memberAttributes as memberAttribute]
											,memberAttribute_${memberAttribute.id}: $(":input[name='memberAttribute_${memberAttribute.id}']").val()
										[/#list]
									[/@member_attribute_list]
								},
								dataType: "json",
								cache: false,
								success: function(message) {
									$.message(message);
									if (message.type == "success") {
										setTimeout(function() {
											$submit.prop("disabled", false);
											location.href = "${base}/";
										}, 3000);
									} else {
										$submit.prop("disabled", false);
										[#if setting.captchaTypes?? && setting.captchaTypes?seq_contains("memberRegister")]
											$captcha.val("");
											$captchaImage.attr("src", "${base}/common/captcha.jhtml?captchaId=${captchaId}&timestamp=" + (new Date()).valueOf());
										[/#if]
									}
								}
							});
						}
					});
				}
			});
		});
	</script>
</html>