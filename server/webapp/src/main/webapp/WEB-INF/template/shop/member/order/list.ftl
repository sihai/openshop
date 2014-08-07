[#assign current = "orderList" /]
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->

	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>${message("shop.member.order.list")}[#if systemShowPowered] - Powered By openteach inc.[/#if]</title>
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
				<div class="list">
					<div class="title">${message("shop.member.order.list")}</div>
					<table class="list">
						<tr>
							<th>
								${message("Order.sn")}
							</th>
							<th>
								${message("shop.member.order.product")}
							</th>
							<th>
								${message("Order.consignee")}
							</th>
							<th>
								${message("Order.amount")}
							</th>
							<th>
								${message("shop.common.createDate")}
							</th>
							<th>
								${message("shop.member.order.status")}
							</th>
							<th>
								${message("shop.member.handle")}
							</th>
						</tr>
						[#list page.content as order]
							<tr[#if !order_has_next] class="last"[/#if]>
								<td>
									${order.sn}
								</td>
								<td>
									[#list order.orderItems as orderItem]
										<img src="[#if orderItem.thumbnail??]${orderItem.thumbnail}[#else]${setting.defaultThumbnailProductImage}[/#if]" class="thumbnail" alt="${orderItem.fullName}" />
										[#if orderItem_index == 2]
											[#break /]
										[/#if]
									[/#list]
								</td>
								<td>
									${order.consignee}
								</td>
								<td>
									${currency(order.amount, true)}
								</td>
								<td>
									<span title="${order.createDate?string("yyyy-MM-dd HH:mm:ss")}">${order.createDate}</span>
								</td>
								<td>
									[#if order.expired]
										${message("shop.member.order.hasExpired")}
									[#elseif order.orderStatus == "completed" || order.orderStatus == "cancelled"]
										${message("Order.OrderStatus." + order.orderStatus)}
									[#elseif order.paymentStatus == "unpaid" || order.paymentStatus == "partialPayment"]
										${message("shop.member.order.waitingPayment")}
										[#if order.shippingStatus != "unshipped"]
											${message("Order.ShippingStatus." + order.shippingStatus)}
										[/#if]
									[#else]
										${message("Order.PaymentStatus." + order.paymentStatus)}
										[#if order.paymentStatus == "paid" && order.shippingStatus == "unshipped"]
											${message("shop.member.order.waitingShipping")}
										[#else]
											${message("Order.ShippingStatus." + order.shippingStatus)}
										[/#if]
									[/#if]
								</td>
								<td>
									<a href="view.jhtml?sn=${order.sn}">[${message("shop.member.handle.view")}]</a>
								</td>
							</tr>
						[/#list]
					</table>
					[#if !page.content?has_content]
						<p>${message("shop.member.noResult")}</p>
					[/#if]
				</div>
				[@pagination pageNumber = page.pageNumber totalPages = page.totalPages pattern = "?pageNumber={pageNumber}"]
					[#include "/shop/include/pagination.ftl"]
				[/@pagination]
			</div>
		</div>
		[#include "/shop/include/newFooter.ftl" /]
	</body>

	<script type="text/javascript">
		$().ready(function() {
			
			[@flash_message /]
		
		});
	</script>
</html>