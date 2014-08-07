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
			<title>[#if seo.title??][@seo.title?interpret /][#else]${message("shop.index.title")}[/#if][#if systemShowPowered] - Powered By openteach inc.[/#if]</title>
			[#if seo.keywords??]
				<meta name="keywords" content="[@seo.keywords?interpret /]" />
			[/#if]
			[#if seo.description??]
				<meta name="description" content="[@seo.description?interpret /]" />
			[/#if]
		[/@seo]

		[#include "/shop/include/metaAndcss.ftl" /]
		
		<link href="${base}/assets/v2/shop/css/i.css" rel="stylesheet" type="text/css" />
		
	</head>
	
	<body>
	
		<div class="page">
			[#include "/shop/member/include/userHeader.ftl" /]
			
			<div class="content">
				
				[#list page.content as order]
				
					<div class="block">
						<div class="title">
							<div class="title_head"></div>
							<a href="#" style="margin-left:20px;"><strong>订单编号 ${order.sn}</strong></a>
							
							<div style="float:right;margin-right:20px;">
								[#if order.expired]
									<a href="#">${message("shop.member.order.hasExpired")}</a>
								[#elseif order.orderStatus == "completed" || order.orderStatus == "cancelled"]
									<a href="#">${message("Order.OrderStatus." + order.orderStatus)}</a>
								[#elseif order.paymentStatus == "unpaid" || order.paymentStatus == "partialPayment"]
									<a target="_blank" href="/member/order/payment.jhtml?sn=${order.sn}">${message("shop.member.order.waitingPayment")}</a>
									[#if order.shippingStatus != "unshipped"]
										<span style="color:#FFFFFF;">|</span>
										<a href="#">${message("Order.ShippingStatus." + order.shippingStatus)}</a>
									[/#if]
								[#else]
									<a href="#">${message("Order.PaymentStatus." + order.paymentStatus)}</a>
									[#if order.paymentStatus == "paid" && order.shippingStatus == "unshipped"]
										<span style="color:#FFFFFF;">|</span>
										<a href="#">${message("shop.member.order.waitingShipping")}</a>
									[#else]
										<span style="color:#FFFFFF;">|</span>
										<a href="#">${message("Order.ShippingStatus." + order.shippingStatus)}</a>
									[/#if]
								[/#if]
							</div>
						</div>
						<div class="body">
							
							<table style="width:100%;text-align:center;background-color: #F7F7F7;">
								<tr class="order_item">
									<td style="width:600px;">
										<table>
										
											[#list order.orderItems as orderItem]
												<tr>
													<td style="width:160px;">
														<img class="lazy_img" src="${base}/assets/front/images/spacer.gif" data-img-src="[#if orderItem.thumbnail??]${orderItem.thumbnail}[#else]${setting.defaultThumbnailProductImage}[/#if]" />
													</td>
													<td style="width:300px;">
														<strong><font>${orderItem.fullName}</font></strong>
														<br/>
														<strong><font>${currency(orderItem.price, true)}</font></strong>
													</td>
													<td style="width:40px;">
														${orderItem.quantity}
													</td>
													
													<td style="width:100px;">
														<strong><font>${currency(orderItem.subtotal, true)}</font></strong>
													</td>
												</tr>
												<tr>
													<td colspan="4" style="height:16px;"></td>
												</tr>
											[/#list]
											
										</table>
									</td>
									<td style="width:120px;">
										<strong><font>${currency($order.amount, true)}</font></strong>
									</td>
									
									<td style="width:340px;">
										${order.consignee}<br/>
										${order.phone}<br/>
										${order.areaName}${order.address}<br/>
										${order.zipCode}
									</td>
								</tr>
							</table>
						</div>
					</div>
				[/#list]
				
				[@pagination pageNumber = page.pageNumber totalPages = page.totalPages pattern = "?pageNumber={pageNumber}"]
					[#include "/shop/include/pagination.ftl"]
				[/@pagination]
			</div>
			
			[#include "/shop/include/newFooterV2.ftl" /]
		</div>
	</body>
	[#include "/shop/include/js.ftl" /]
	<script type="text/javascript" src="${base}/assets/v2/shop/js/i.js"></script>
</html>