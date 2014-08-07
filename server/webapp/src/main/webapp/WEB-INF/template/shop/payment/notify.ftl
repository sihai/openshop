[#if notifyMessage??]
${notifyMessage}
[#else]
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>${message("shop.payment.notify")}[#if systemShowPowered] - Powered By openteach inc.[/#if]</title>
		[#include "/shop/include/metaAndcss.ftl" /]
		<link href="${base}/resources/shop/css/payment.css" rel="stylesheet" type="text/css" />
		
	</head>
	<body class="women ">
		<div id="fb-root"></div>
		<script src="${base}/assets/front/js/browser_detect.js"></script>
		
	    [#include "/shop/include/newHeader.ftl" /]
	    [#include "/shop/include/announcement.ftl" /]
	    
		<div class="container payment">
			<div class="span24">
				<div class="title">
					[#if payment.status == "wait"]
						${message("shop.payment.waitTitle")}
					[#elseif payment.status == "success"]
						[#if payment.type == "payment"]
							${message("shop.payment.orderTitle")}
						[#elseif payment.type == "recharge"]
							${message("shop.payment.depositTitle")}
						[/#if]
					[#elseif payment.status == "failure"]
						${message("shop.payment.failureTitle")}
					[/#if]
				</div>
				<div class="bottom">
					[#if payment.type == "payment"]
						<a href="${base}/member/order/view.jhtml?sn=${payment.order.sn}">${message("shop.payment.viewOrder")}</a>
					[#elseif payment.type == "recharge"]
						<a href="${base}/member/deposit/list.jhtml">${message("shop.payment.deposit")}</a>
					[/#if]
					| <a href="${base}/">${message("shop.payment.index")}</a>
				</div>
			</div>
		</div>
		[#include "/shop/include/newFooter.ftl" /]
	</body>
</html>
[/#if]