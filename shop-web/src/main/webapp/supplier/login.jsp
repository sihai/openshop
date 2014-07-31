<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="java.util.UUID"%>
<%@page import="java.security.interfaces.RSAPublicKey"%>
<%@page import="org.apache.commons.lang.ArrayUtils"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="net.shopxx.Setting"%>
<%@page import="net.shopxx.util.SettingUtils"%>
<%@page import="net.shopxx.util.SpringUtils"%>
<%@page import="net.shopxx.Setting.CaptchaType"%>
<%@page import="net.shopxx.Setting.AccountLockType"%>
<%@page import="net.shopxx.service.RSAService"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String base = request.getContextPath();
String captchaId = UUID.randomUUID().toString();
ApplicationContext applicationContext = SpringUtils.getApplicationContext();
Setting setting = SettingUtils.get();
if (applicationContext != null) {
%>
<shiro:authenticated>
<%
response.sendRedirect(base + "/supplier/common/main.jhtml");
%>
</shiro:authenticated>
<%
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<%
if (applicationContext != null) {
    
	RSAService rsaService = SpringUtils.getBean("rsaServiceImpl", RSAService.class);
	RSAPublicKey publicKey = rsaService.generateKey(request);
	String modulus = Base64.encodeBase64String(publicKey.getModulus().toByteArray());
	String exponent = Base64.encodeBase64String(publicKey.getPublicExponent().toByteArray());
	
	String message = null;
	String loginFailure = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
	if (loginFailure != null) {
		if (loginFailure.equals("org.apache.shiro.authc.pam.UnsupportedTokenException")) {
			message = "supplier.captcha.invalid";
		} else if (loginFailure.equals("org.apache.shiro.authc.UnknownAccountException")) {
			message = "supplier.login.unknownAccount";
		} else if (loginFailure.equals("org.apache.shiro.authc.DisabledAccountException")) {
			message = "supplier.login.disabledAccount";
		} else if (loginFailure.equals("org.apache.shiro.authc.LockedAccountException")) {
			message = "supplier.login.lockedAccount";
		} else if (loginFailure.equals("org.apache.shiro.authc.IncorrectCredentialsException")) {
			if (ArrayUtils.contains(setting.getAccountLockTypes(), AccountLockType.admin)) {
				message = "supplier.login.accountLockCount";
			} else {
				message = "supplier.login.incorrectCredentials";
			}
		} else if (loginFailure.equals("org.apache.shiro.authc.AuthenticationException")) {
			message = "supplier.login.authentication";
		}
	}
%>
<title><%=SpringUtils.getMessage("supplier.login.title")%> - Powered By SHOP++</title>
<meta http-equiv="expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="<%=base%>/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=base%>/resources/admin/css/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=base%>/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/jsbn.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/prng4.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/rng.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/rsa.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/base64.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/common.js"></script>
<script type="text/javascript">
	$().ready( function() {
		
		var $loginForm = $("#loginForm");
		var $enPassword = $("#enPassword");
		var $name = $("#name");
		var $password = $("#password");
		var $captcha = $("#captcha");
		var $captchaImage = $("#captchaImage");
		var $isRememberName = $("#isRememberName");
		
		// 记住用户名
		if(getCookie("supplierName") != null) {
			$isRememberName.prop("checked", true);
			$name.val(getCookie("supplierName"));
			$password.focus();
		} else {
			$isRememberName.prop("checked", false);
			$name.focus();
		}
		
		// 更换验证码
		$captchaImage.click( function() {
			$captchaImage.attr("src", "<%=base%>/admin/common/captcha.jhtml?captchaId=<%=captchaId%>&timestamp=" + (new Date()).valueOf());
		});
		
		// 表单验证、记住用户名
		$loginForm.submit( function() {
			if ($name.val() == "") {
				$.message("warn", "<%=SpringUtils.getMessage("supplier.login.nameRequired")%>");
				return false;
			}
			if ($password.val() == "") {
				$.message("warn", "<%=SpringUtils.getMessage("supplier.login.passwordRequired")%>");
				return false;
			}
			if ($captcha.val() == "") {
				$.message("warn", "<%=SpringUtils.getMessage("supplier.login.captchaRequired")%>");
				return false;
			}
			
			if ($isRememberName.prop("checked")) {
				addCookie("supplierName", $name.val(), {expires: 7 * 24 * 60 * 60});
			} else {
				removeCookie("supplierName");
			}

			var rsaKey = new RSAKey();
			rsaKey.setPublic(b64tohex("<%=modulus%>"), b64tohex("<%=exponent%>"));
			var enPassword = hex2b64(rsaKey.encrypt($password.val()));
			$enPassword.val(enPassword);
		});
		
		<%if (message != null) {%>
			$.message("error", "<%=SpringUtils.getMessage(message, setting.getAccountLockCount())%>");
		<%}%>
	});
</script>
<%} else {%>
<title>提示信息 - Powered By aigechibaole</title>
<meta http-equiv="expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="<%=base%>/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=base%>/resources/admin/css/login.css" rel="stylesheet" type="text/css" />
<%}%>
</head>
<body>
	<%if (applicationContext != null) {%>
		<div class="login">
			<form id="loginForm" action="login.jsp" method="post">
				<input type="hidden" id="enPassword" name="enPassword" />
				<%
					if (ArrayUtils.contains(setting.getCaptchaTypes(), CaptchaType.supplierLogin)) {
				%>
					<input type="hidden" name="captchaId" value="<%=captchaId%>" />
				<%
					}
				%>
				<table>
					<tr>
						<td width="190" rowspan="2" align="center" valign="bottom">
							<img src="<%=base%>/resources/admin/images/login_logo.gif" alt="SHOP++" />
						</td>
						<th>
							<%=SpringUtils.getMessage("supplier.login.name")%>:
						</th>
						<td>
							<input type="text" id="name" name="supplier_name" class="text" maxlength="20" />
						</td>
					</tr>
					<tr>
						<th>
							<%=SpringUtils.getMessage("supplier.login.password")%>:
						</th>
						<td>
							<input type="password" id="password" class="text" maxlength="20" autocomplete="off" />
						</td>
					</tr>
					<%
						if (ArrayUtils.contains(setting.getCaptchaTypes(), CaptchaType.supplierLogin)) {
					%>
						<tr>
							<td>
								&nbsp;
							</td>
							<th>
								<%=SpringUtils.getMessage("supplier.captcha.name")%>:
							</th>
							<td>
								<input type="text" id="captcha" name="captcha" class="text captcha" maxlength="4" autocomplete="off" /><img id="captchaImage" class="captchaImage" src="<%=base%>/supplier/common/captcha.jhtml?captchaId=<%=captchaId%>" title="<%=SpringUtils.getMessage("supplier.captcha.imageTitle")%>" />
							</td>
						</tr>
					<%}%>
					<tr>
						<td>
							&nbsp;
						</td>
						<th>
							&nbsp;
						</th>
						<td>
							<label>
								<input type="checkbox" id="isRememberName" value="true" />
								<%=SpringUtils.getMessage("supplier.login.rememberName")%>
							</label>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<th>
							&nbsp;
						</th>
						<td>
							<input type="button" class="homeButton" value="" onclick="location.href='<%=base%>/'" /><input type="submit" class="loginButton" value="<%=SpringUtils.getMessage("supplier.login.login")%>" />
						</td>
					</tr>
				</table>
				<div class="powered">COPYRIGHT © 2013-2014 AIGECHIBAOLE ALL RIGHTS RESERVED.</div>
				<div class="link">
					<a href="<%=base%>/"><%=SpringUtils.getMessage("supplier.login.home")%></a> |
					<a href="http://www.shopxx.net"><%=SpringUtils.getMessage("supplier.login.official")%></a> |
					<a href="http://bbs.shopxx.net"><%=SpringUtils.getMessage("supplier.login.bbs")%></a> |
					<a href="http://www.shopxx.net/about.html"><%=SpringUtils.getMessage("supplier.login.about")%></a> |
					<a href="http://www.shopxx.net/contact.html"><%=SpringUtils.getMessage("supplier.login.contact")%></a> |
					<a href="http://www.shopxx.net/license.html"><%=SpringUtils.getMessage("supplier.login.license")%></a>
				</div>
			</form>
		</div>
	<%} else {%>
		<fieldset>
			<legend>系统出现异常</legend>
		</fieldset>
	<%}%>
</body>
</html>