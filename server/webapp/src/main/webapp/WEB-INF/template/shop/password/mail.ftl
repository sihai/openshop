<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>${message("shop.password.mailTitle")}[#if systemShowPowered] - Powered By aigechibaole[/#if]</title>
		
		[#include "/shop/include/metaAndcss.ftl" /]
		<link href="${base}/resources/shop/css/password.css" rel="stylesheet" type="text/css" />
		
	</head>
	<body class="women ">
	
		<div id="fb-root"></div>
		<script src="${base}/assets/front/js/browser_detect.js"></script>
		
	    [#include "/shop/include/newHeader.ftl" /]
	    [#include "/shop/include/announcement.ftl" /]
	    
		<p>${username}:</p>
		<p>${message("shop.password.welcome")}</p>
		<p>${message("shop.password.content", setting.siteName)}[#if safeKey.expire??](${message("shop.password.expire")}: ${safeKey.expire?string("yyyy-MM-dd HH:mm")})[/#if]</p>
		<p>
			<a href="${setting.siteUrl}/password/reset.jhtml?username=${username}&key=${safeKey.value}" target="_blank">${setting.siteUrl}/password/reset.jhtml?username=${username}&key=${safeKey.value}</a>
		</p>
		<p>${setting.siteName}</p>
		<p>${.now?string("yyyy-MM-dd")}</p>
		
		[#include "/shop/include/newFooter.ftl" /]
	</body>
</html>