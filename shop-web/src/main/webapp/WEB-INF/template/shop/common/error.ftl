<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>${message("shop.error.title")}[#if systemShowPowered] - Powered By aigechibaole[/#if]</title>
		[#include "/shop/include/metaAndcss.ftl" /]
		<link href="${base}/resources/shop/css/error.css" rel="stylesheet" type="text/css" />
		
	</head>
	<body class="women ">
		<div id="fb-root"></div>
		<script src="${base}/assets/front/js/browser_detect.js"></script>
		
	    [#include "/shop/include/newHeader.ftl" /]
	    [#include "/shop/include/announcement.ftl" /]
	    
		<div class="container error">
			<div class="span24">
				<div class="main">
					<dl>
						<dt>${message("shop.error.message")}</dt>
						[#if message??]
							<dd>${content}</dd>
						[/#if]
						[#if constraintViolations?has_content]
							[#list constraintViolations as constraintViolation]
								<dd>[${constraintViolation.propertyPath}] ${constraintViolation.message}</dd>
							[/#list]
						[/#if]
						<dd>
							<a href="javascript:;" onclick="window.history.back(); return false;">${message("shop.error.back")}</a>
						</dd>
						<dd>
							<a href="${base}/">&gt;&gt; ${message("shop.error.home")}</a>
						</dd>
					</dl>
				</div>
			</div>
		</div>
		[#include "/shop/include/newFooter.ftl" /]
	</body>
</html>