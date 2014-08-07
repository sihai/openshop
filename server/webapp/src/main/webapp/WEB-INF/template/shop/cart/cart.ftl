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
		
		<link href="${base}/assets/v2/shop/css/cart.css" rel="stylesheet" type="text/css" />
		
	</head>
	
	<body>
	
		<div class="page">
			[#include "/shop/include/simpleHeader.ftl" /]
			
			<div class="content">
				<form id="orderForm" action="create.jhtml" method="post">
					<input type="hidden" name="cartToken" value="${cartToken}" />
					<div class="block">
						<div class="title">
							<div class="title_head"></div>
							<a style="margin-left:20px;" href="#"><strong>购物车</strong></a>
						</div>
						<div class="body">
							[#if cart?? && cart.cartItems?has_content]
								<table style="width:100%;text-align:center;">
									[#list cart.cartItems as cartItem]
										<tr>
											<td style="width:150px;">
												<img src="/assets/v2/shop/images/yes.png" style="width:36px;height:36px;" name="item-checked" data="${cartItem.id}" value="checked" />
											</td>
											<td style="width:180px;">
												<a href="${base}${cartItem.product.path}" title="${cartItem.product.fullName}" target="_blank"><img src="/assets/v2/shop/images/item_logo.png" style="width:120px;height:120px;"/></a>
											</td>
											<td style="width:300px;">
												<a href="${base}${cartItem.product.path}" title="${cartItem.product.fullName}" target="_blank"><strong><font>${abbreviate(cartItem.product.fullName, 60, "...")}</font></strong></a>
												[#if cartItem.isLowStock]
													<span class="red lowStock">[${message("shop.cart.lowStock")}]</span>
													<br/>
												[/#if]
												<br/>
												<strong><font>${currency(cartItem.price, true)}</font></strong>
											</td>
											<td style="width:200px;" class="quantity">
												<input type="text" name="quantity" value="${cartItem.quantity}" maxlength="4" onpaste="return false;" />
												<div>
													<span class="increase">&nbsp;</span>
													<span class="decrease">&nbsp;</span>
												</div>
											</td>
											<td>
												<span class="subtotal">${currency(cartItem.subtotal, true)}</span>
											</td>
										</tr>
										
										<tr class="tr-clear">
											<td colspan="5"></td>
										</tr>
									[/#list]
								</table>
								
								<div class="cart-total">
									${message("shop.cart.effectivePoint")}: <em id="effectivePoint">${cart.effectivePoint}</em>
									${message("shop.cart.effectivePrice")}: <strong id="effectivePrice">${currency(cart.effectivePrice, true, true)}</strong>
								</div>
								
							[#else]
								<table style="width:100%;text-align:center;margin-top:50px;">
									<tr>
										<td>
											<p>
												<a href="${base}/">${message("shop.cart.empty")}</a>
											</p>
										</td>
									</tr>
								</table>
							[/#if]
					
						</div>
					</div>
					
					<div class="block">
						<div class="title">
							<div class="title_head"></div>
							<a style="margin-left:20px;" href="#"><strong>收获地址</strong></a>
						</div>
						<div class="body">
							<table style="width:100%;text-align:center;">
								<tr>
									<td class="receiver" style="width:100px;">
										<ul id="receiver">
											[#list member.receivers as receiver]
												<li[#if receiver_index == 0][#assign defaultReceiver = receiver /] class="selected"[#elseif receiver_index > 3] class="hidden"[/#if] receiverId="${receiver.id}">
													<div>
														<strong>${receiver.consignee}</strong> ${message("shop.order.receive")}
													</div>
													<div>
														<span>${receiver.areaName}${receiver.address}</span>
													</div>
													<div>
														${receiver.phone}
													</div>
												</li>
											[/#list]
										</ul>
									</td>
								</tr>
								<tr>
									<td style="width:100%;text-align:right;">
										<a class="fancybox fancybox.iframe" href="/member/receiver/list.jhtml">使用其他收货地址</a>
									</td>
								</tr>				
							</table>
						</div>
					</div>
					
					<input type="hidden" id="receiverId" name="receiverId"[#if defaultReceiver??] value="${defaultReceiver.id}"[/#if] />
					
					
					[#list paymentMethods as paymentMethod]
						<input type="hidden" id="paymentMethod_${paymentMethod.id}" name="paymentMethodId" value="${paymentMethod.id}" />
					[/#list]
					[#list shippingMethods as shippingMethod]
						<input type="hidden" id="shippingMethod_${shippingMethod.id}" name="shippingMethodId" value="${shippingMethod.id}" />
					[/#list]
					
					<!--		
					<div class="block">
						<div class="title">
							<div class="title_head"></div>
							<a style="margin-left:20px;" href="#"><strong>支付方式</strong></a>
						</div>
						<div class="body">
							<table id="paymentPlugin" class="paymentPlugin" style="width:100%;text-align:center;">
								[#list paymentPlugins?chunk(3, "") as row]
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
						</div>
					</div>
					-->
					[#if setting.isInvoiceEnabled]
					
					<div class="block">
						<div class="title">
							<div class="title_head"></div>
							<a style="margin-left:20px;" href="#"><strong>${message("shop.order.invoiceInfo")}</strong></a>
						</div>
						<div id="invoice" class="body">
							<table style="width:100%;">
								<tr>
									<td width="200">
										${message("shop.order.isInvoice")}:
									</td>
									<td>
										<label for="isInvoice">
											<input type="checkbox" id="isInvoice" name="isInvoice" value="true" />
											[#if setting.isTaxPriceEnabled](${message("shop.order.invoiceTax")}: ${setting.taxRate * 100}%)[/#if]
										</label>
									</td>
								</tr>
								<tr id="invoiceTitleTr" class="hidden">
									<td width="200">
										${message("shop.order.invoiceTitle")}:
									</td>
									<td>
										<input type="text" id="invoiceTitle" name="invoiceTitle" class="text"[#if defaultReceiver??] value="${defaultReceiver.consignee}"[/#if] maxlength="400" />
									</td>
								</tr>					
							</table>
						</div>
					</div>
					
					[/#if]
					
					<div class="block">
						<a href="javascript:;" id="submit" class="submit">
							<div class="title" style="background-color: #FDA617;text-align:center;">
								${message("shop.order.submit")}
							</div>
						</a>
						<div class="body">
						</div>
					</div>
				</form>
			</div>
			
			[#include "/shop/include/newFooterV2.ftl" /]
		</div>
	</body>
	
	[#include "/shop/include/js.ftl" /]
	
	<script type="text/javascript">
		var deleteConfirmMessage = '${message("shop.dialog.deleteConfirm")}';
		var cartAccessDeniedMessage = '${message("shop.cart.accessDenied")}';
		var invoiceTileRequiredMessage = '${message("shop.order.invoiceTileRequired")}';
	</script>
	
	<script type="text/javascript" src="${base}/assets/v2/shop/js/cart.js"></script>
	
</html>