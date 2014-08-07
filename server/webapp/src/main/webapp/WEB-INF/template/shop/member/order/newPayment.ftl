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
		
		<link href="${base}/assets/v2/shop/css/payment.css" rel="stylesheet" type="text/css" />
		
	</head>
	
	<body>
	
		<div class="page">
			[#include "/shop/include/simpleHeader.ftl" /]
			
			<div class="content">
					<div class="block">
						<div class="title">
							<div class="title_head"></div>
							<a style="margin-left:20px;" href="#">
								<strong>
									[#if order.paymentStatus == "paid"]
										${message("shop.order.waitingShipment")}
									[#else]
										[#if order.paymentMethod.method == "online"]
											${message("shop.order.waitingPayment")}
										[#else]
											${message("shop.order.waitingProcess")}
										[/#if]
									[/#if]
								</strong>
							</a>
						</div>
						<div class="body">
							
							<div class="result">
								
								<table>
									<tr>
										<th colspan="4">${message("shop.order.info")}:</th>
									</tr>
						
									<tr>
										<td width="100">${message("shop.order.sn")}:</td>
										<td width="340">
											<strong>${order.sn}</strong>
											<a href="view.jhtml?sn=${order.sn}">[${message("shop.order.view")}]</a>
										</td>
										[#if order.paymentStatus == "unpaid" || order.paymentStatus == "partialPayment"]
											<td width="100">${message("shop.order.amountPayable")}:</td>
											<td>
												[#if amount??]
													<strong id="amountPayable">${currency(amount, true, true)}</strong>
												[#else]
													<strong id="amountPayable">${currency(order.amountPayable, true, true)}</strong>
												[/#if]
												[#if fee??]
													<span[#if fee == 0] class="hidden"[/#if]>(${message("shop.order.fee")}: <span id="fee">${currency(fee, true)}</span>)</span>
												[#else]
													<span[#if order.fee == 0] class="hidden"[/#if]>(${message("shop.order.fee")}: <span id="fee">${currency(order.fee, true)}</span>)</span>
												[/#if]
											</td>
										[#else]
											<td width="100">${message("shop.order.amount")}:</td>
											<td>
												<strong>${currency(order.amount, true, true)}</strong>
												[#if order.fee > 0]
													(${message("shop.order.fee")}: ${currency(order.fee, true)})
												[/#if]
											</td>
										[/#if]
									</tr>
									<tr>
										<td>${message("shop.order.shippingMethod")}:</td>
										<td>${order.shippingMethodName}</td>
										<td>${message("shop.order.paymentMethod")}:</td>
										<td>${order.paymentMethodName}</td>
									</tr>
									[#if order.expire??]
										<tr>
											<td colspan="4">${message("shop.order.expireTips", order.expire?string("yyyy-MM-dd HH:mm"))}</td>
										</tr>
									[/#if]
								</table>
								[#if order.paymentStatus != "paid"]
									[#if order.paymentMethod.method == "online"]
										[#if paymentPlugins??]
											<form id="paymentForm" action="${base}/payment/submit.jhtml" method="post" target="_blank">
												<input type="hidden" name="type" value="payment" />
												<input type="hidden" name="sn" value="${order.sn}" />
												<table id="paymentPlugin" class="paymentPlugin">
													<tr>
														<th colspan="4">${message("shop.order.paymentMethod")}:</th>
													</tr>
													[#list paymentPlugins?chunk(4, "") as row]
														<tr>
															[#list row as paymentPlugin]
																[#if paymentPlugin?has_content]
																	<td>
																		<input type="radio" id="${paymentPlugin.id}" name="paymentPluginId" value="${paymentPlugin.id}"[#if paymentPlugin == defaultPaymentPlugin] checked="checked"[/#if] />
																		<label for="${paymentPlugin.id}">
																			[#if paymentPlugin.logo??]
																				<em title="${paymentPlugin.paymentName}" style="background-image: url(${paymentPlugin.logo});">&nbsp;</em>
																			[#else]
																				<em>${paymentPlugin.paymentName}</em>
																			[/#if]
																		</label>
																	</td>
																[#else]
																	<td>
																		&nbsp;
																	</td>
																[/#if]
															[/#list]
														</tr>
													[/#list]
												</table>
												<input type="submit" id="paymentButton" class="paymentButton" value="${message("shop.order.payNow")}" />
											</form>
										[/#if]
									[#else]
										${order.paymentMethod.content}
									[/#if]
								[/#if]
							</div>
							
							
							
						</div>
					</div>
			</div>
			
			[#include "/shop/include/newFooterV2.ftl" /]
		</div>
	</body>
	
	[#include "/shop/include/js.ftl" /]
	
	<script type="text/javascript">
	</script>
	
	<script type="text/javascript" src="${base}/assets/v2/shop/js/payment.js"></script>
	
</html>