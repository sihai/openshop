<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>${message("shop.productNotify.mailTitle")} - Powered By aigechibaole</title>
		[#include "/shop/include/metaAndcss.ftl" /]
		<link href="${base}/resources/shop/css/product.css" rel="stylesheet" type="text/css" />
		
	</head>
	<body class="women ">
		<div id="fb-root"></div>
		<script src="${base}/assets/front/js/browser_detect.js"></script>
		
	    [#include "/shop/include/newHeader.ftl" /]
	    [#include "/shop/include/announcement.ftl" /]
	    
		<p>
			${message("shop.productNotify.welcome")}:
		</p>
		<p>
			${message("shop.productNotify.content", productNotify.product.name)}
		</p>
		<p>
			<a href="${setting.siteUrl}${productNotify.product.path}">${setting.siteUrl}${productNotify.product.path}</a>
		</p>
		
		[#include "/shop/include/newFooter.ftl" /]
	</body>
</html>