<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("supplier.order.view")} - Powered By openteach inc.</title>
<meta name="author" content="openteach inc." />
<meta name="copyright" content="openteach inc." />
<link href="${base}/resources/supplier/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/supplier/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/supplier/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/supplier/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/supplier/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/supplier/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/supplier/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $confirmForm = $("#confirmForm");
	var $completeForm = $("#completeForm");
	var $cancelForm = $("#cancelForm");
	var $confirmButton = $("#confirmButton");
	var $paymentButton = $("#paymentButton");
	var $shippingButton = $("#shippingButton");
	var $completeButton = $("#completeButton");
	var $refundsButton = $("#refundsButton");
	var $returnsButton = $("#returnsButton");
	var $cancelButton = $("#cancelButton");
	var isLocked = false;
	
	[@flash_message /]
	
	// 检查锁定
	function checkLock() {
		if (!isLocked) {
			$.ajax({
				url: "check_lock.jhtml",
				type: "POST",
				data: {id: ${orderItem.id}},
				dataType: "json",
				cache: false,
				success: function(message) {
					if (message.type != "success") {
						$.message(message);
						$confirmButton.prop("disabled", true);
						$paymentButton.prop("disabled", true);
						$shippingButton.prop("disabled", true);
						$completeButton.prop("disabled", true);
						$refundsButton.prop("disabled", true);
						$returnsButton.prop("disabled", true);
						$cancelButton.prop("disabled", true);
						isLocked = true;
					}
				}
			});
		}
	}
	
	// 检查锁定
	checkLock();
	setInterval(function() {
		checkLock();
	}, 10000);
	
	[#if (orderItem.shippingStatus == "unshipped" || orderItem.shippingStatus == "partialShipment")]
		// 发货
		$shippingButton.click(function() {
			$.dialog({
				title: "${message("supplier.order.shipping")}",
				[@compress single_line = true]
					content: '
					<form id="shippingForm" action="shipping.jhtml" method="post">
						<input type="hidden" name="token" value="${token}" \/>
						<input type="hidden" name="orderItemId" value="${orderItem.id}" \/>
						<div style="height: 380px; overflow-x: hidden; overflow-y: auto;">
							<table class="input" style="margin-bottom: 30px;">
								<tr>
									<th>
										${message("orderItem.sn")}:
									<\/th>
									<td width="300">
										${orderItem.sn}
									<\/td>
									<th>
										${message("supplier.common.createDate")}:
									<\/th>
									<td>
										${orderItem.createDate?string("yyyy-MM-dd HH:mm:ss")}
									<\/td>
								<\/tr>
								<tr>
									<th>
										${message("Shipping.shippingMethod")}:
									<\/th>
									<td>
										<select name="shippingMethodId">
											<option value="">${message("supplier.common.choose")}<\/option>
											[#list shippingMethods as shippingMethod]
												<option value="${shippingMethod.id}"[#if shippingMethod == orderItem.order.shippingMethod] selected="selected"[/#if]>${shippingMethod.name}<\/option>
											[/#list]
										<\/select>
									<\/td>
									<th>
										${message("Shipping.deliveryCorp")}:
									<\/th>
									<td>
										<select name="deliveryCorpId">
											[#list deliveryCorps as deliveryCorp]
												<option value="${deliveryCorp.id}"[#if orderItem.order.shippingMethod?? && deliveryCorp == orderItem.order.shippingMethod.defaultDeliveryCorp] selected="selected"[/#if]>${deliveryCorp.name}<\/option>
											[/#list]
										<\/select>
									<\/td>
								<\/tr>
								<tr>
									<th>
										${message("Shipping.trackingNo")}:
									<\/th>
									<td>
										<input type="text" name="trackingNo" class="text" maxlength="200" \/>
									<\/td>
									<th>
										${message("Shipping.freight")}:
									<\/th>
									<td>
										<input type="text" name="freight" class="text" maxlength="16" \/>
									<\/td>
								<\/tr>
								<tr>
									<th>
										${message("Shipping.consignee")}:
									<\/th>
									<td>
										<input type="text" name="consignee" class="text" value="${orderItem.order.consignee}" maxlength="200" \/>
									<\/td>
									<th>
										${message("Shipping.zipCode")}:
									<\/th>
									<td>
										<input type="text" name="zipCode" class="text" value="${orderItem.order.zipCode}" maxlength="200" \/>
									<\/td>
								<\/tr>
								<tr>
									<th>
										${message("Shipping.area")}:
									<\/th>
									<td>
										<span class="fieldSet">
											<input type="hidden" id="areaId" name="areaId" value="${(orderItem.order.area.id)!}" treePath="${(orderItem.order.area.treePath)!}" \/>
										<\/span>
									<\/td>
									<th>
										${message("Shipping.address")}:
									<\/th>
									<td>
										<input type="text" name="address" class="text" value="${orderItem.order.address}" maxlength="200" \/>
									<\/td>
								<\/tr>
								<tr>
									<th>
										${message("Shipping.phone")}:
									<\/th>
									<td>
										<input type="text" name="phone" class="text" value="${orderItem.order.phone}" maxlength="200" \/>
									<\/td>
									<th>
										${message("Shipping.memo")}:
									<\/th>
									<td>
										<input type="text" name="memo" class="text" maxlength="200" \/>
									<\/td>
								<\/tr>
							<\/table>
							<table class="input">
								<tr class="title">
									<th>
										${message("ShippingItem.sn")}
									<\/th>
									<th>
										${message("ShippingItem.name")}
									<\/th>
									<th>
										${message("supplier.order.productStock")}
									<\/th>
									<th>
										${message("supplier.order.productQuantity")}
									<\/th>
									<th>
										${message("OrderItem.shippedQuantity")}
									<\/th>
									<th>
										${message("supplier.order.shippingQuantity")}
									<\/th>
								<\/tr>
								<tr>
									<td>
										<input type="hidden" name="shippingItems[0].sn" value="${orderItem.sn}" \/>
										${orderItem.sn}
									<\/td>
									<td width="300">
										<span title="${orderItem.fullName}">${abbreviate(orderItem.fullName, 50, "...")}<\/span>
										[#if orderItem.isGift]
											<span class="red">[${message("supplier.order.gift")}]<\/span>
										[/#if]
									<\/td>
									<td>
										${(orderItem.product.stock)!"-"}
									<\/td>
									<td>
										${orderItem.quantity}
									<\/td>
									<td>
										${orderItem.shippedQuantity}
									<\/td>
									<td>
										[#if orderItem.product?? && orderItem.product.stock??]
											[#if orderItem.product.stock <= 0 || orderItem.quantity - orderItem.shippedQuantity <= 0]
												<input type="text" name="shippingItems[0].quantity" class="text" value="0" style="width: 30px;" disabled="disabled" \/>
											[#elseif orderItem.product.stock < orderItem.quantity - orderItem.shippedQuantity]
												<input type="text" name="shippingItems[0].quantity" class="text shippingItemsQuantity" value="${orderItem.product.stock}" maxlength="9" style="width: 30px;" max="${orderItem.product.stock}" \/>
											[#else]
												<input type="text" name="shippingItems[0].quantity" class="text shippingItemsQuantity" value="${orderItem.quantity - orderItem.shippedQuantity}" maxlength="9" style="width: 30px;" max="${orderItem.quantity - orderItem.shippedQuantity}" \/>
											[/#if]
										[#else]
											<input type="text" name="shippingItems[0].quantity" class="text shippingItemsQuantity" value="${orderItem.quantity - orderItem.shippedQuantity}" maxlength="9" style="width: 30px;" max="${orderItem.quantity - orderItem.shippedQuantity}" \/>
										[/#if]
									<\/td>
								<\/tr>
								<tr>
									<td colspan="6" style="border-bottom: none;">
										&nbsp;
									<\/td>
								<\/tr>
							<\/table>
						<\/div>
					<\/form>',
				[/@compress]
				width: 900,
				modal: true,
				ok: "${message("supplier.dialog.ok")}",
				cancel: "${message("supplier.dialog.cancel")}",
				onShow: function() {
					$("#areaId").lSelect({
						url: "${base}/common/area.jhtml"
					});
					$.validator.addClassRules({
						shippingItemsQuantity: {
							required: true,
							digits: true
						}
					});
					$("#shippingForm").validate({
						rules: {
							shippingMethodId: "required",
							deliveryCorpId: "required",
							freight: {
								min: 0,
								decimal: {
									integer: 12,
									fraction: ${setting.priceScale}
								}
							},
							consignee: "required",
							zipCode: "required",
							areaId: "required",
							address: "required",
							phone: "required"
						}
					});
				},
				onOk: function() {
					var total = 0;
					$("#shippingForm input.shippingItemsQuantity").each(function() {
						var quantity = $(this).val();
						if ($.isNumeric(quantity)) {
							total += parseInt(quantity);
						}
					});
					if (total <= 0) {
						$.message("warn", "${message("supplier.order.shippingQuantityPositive")}");
					} else {
						$("#shippingForm").submit();
					}
					return false;
				}
			});
		});
	[/#if]
	
});
</script>
</head>
<body>
	<form id="confirmForm" action="confirm.jhtml" method="post">
		<input type="hidden" name="id" value="${orderItem.id}" />
	</form>
	<form id="completeForm" action="complete.jhtml" method="post">
		<input type="hidden" name="id" value="${orderItem.id}" />
	</form>
	<form id="cancelForm" action="cancel.jhtml" method="post">
		<input type="hidden" name="id" value="${orderItem.id}" />
	</form>
	<div class="path">
		<a href="${base}/supplier/common/index.jhtml">${message("supplier.path.index")}</a> &raquo; ${message("supplier.order.view")}
	</div>
	<ul id="tab" class="tab">
		<li>
			<input type="button" value="${message("supplier.order.orderInfo")}" />
		</li>
		<li>
			<input type="button" value="${message("supplier.order.productInfo")}" />
		</li>
		<li>
			<input type="button" value="${message("supplier.order.platformPaymentInfo")}" />
		</li>
		<li>
			<input type="button" value="${message("supplier.order.shippingInfo")}" />
		</li>
		<li>
			<input type="button" value="${message("supplier.order.refundsInfo")}" />
		</li>
		<li>
			<input type="button" value="${message("supplier.order.returnsInfo")}" />
		</li>
		<li>
			<input type="button" value="${message("supplier.order.orderLog")}" />
		</li>
	</ul>
	<table class="input tabContent">
		<tr>
			<td>
				&nbsp;
			</td>
			<td>
				<input type="button" id="shippingButton" class="button" value="${message("supplier.order.shipping")}"[#if (orderItem.shippingStatus != "unshipped" && orderItem.shippingStatus != "partialShipment")] disabled="disabled"[/#if] />
			</td>
		</tr>
		<tr>
			<th>
				${message("OrderItem.sn")}:
			</th>
			<td width="360">
				${orderItem.sn}
			</td>
			<th>
				${message("supplier.common.createDate")}:
			</th>
			<td>
				${orderItem.createDate?string("yyyy-MM-dd HH:mm:ss")}
			</td>
		</tr>
		<tr>
			<th>
				${message("Order.shippingStatus")}:
			</th>
			<td>
				${message("Order.ShippingStatus." + orderItem.shippingStatus)}
			</td>
			<th>
			</th>
			<td>
			</td>
		</tr>
		<tr>
			<th>
				${message("OrderItem.subtotal")}:
			</th>
			<td>
				${currency(orderItem.subtotal, true)}
			</td>
			<th>
			</th>
			<td>
			</td>
		</tr>
		<tr>
			<th>
				${message("Order.weight")}:
			</th>
			<td>
				${orderItem.weight}
			</td>
			<th>
				${message("Order.quantity")}:
			</th>
			<td>
				${orderItem.quantity}
			</td>
		</tr>
		
		<tr>
			<th>
				${message("Order.consignee")}:
			</th>
			<td>
				${orderItem.order.consignee}
			</td>
			<th>
				${message("Order.area")}:
			</th>
			<td>
				${orderItem.order.areaName}
			</td>
		</tr>
		<tr>
			<th>
				${message("Order.address")}:
			</th>
			<td>
				${orderItem.order.address}
			</td>
			<th>
				${message("Order.zipCode")}:
			</th>
			<td>
				${orderItem.order.zipCode}
			</td>
		</tr>
		<tr>
			<th>
				${message("Order.phone")}:
			</th>
			<td>
				${orderItem.order.phone}
			</td>
			<th>
				${message("Order.memo")}:
			</th>
			<td>
				${orderItem.order.memo}
			</td>
		</tr>
	</table>
	<table class="input tabContent">
		<tr class="title">
			<th>
				${message("OrderItem.sn")}
			</th>
			<th>
				${message("OrderItem.name")}
			</th>
			<th>
				${message("OrderItem.price")}
			</th>
			<th>
				${message("OrderItem.quantity")}
			</th>
			<th>
				${message("OrderItem.shippedQuantity")}
			</th>
			<th>
				${message("OrderItem.returnQuantity")}
			</th>
			<th>
				${message("OrderItem.subtotal")}
			</th>
		</tr>
		<tr>
			<td>
				${orderItem.sn}
			</td>
			<td width="400">
				<span title="${orderItem.fullName}">${abbreviate(orderItem.fullName, 50, "...")}</span>
				[#if orderItem.isGift]
					<span class="red">[${message("admin.order.gift")}]</span>
				[/#if]
			</td>
			<td>
				[#if !orderItem.isGift]
					${currency(orderItem.price, true)}
				[#else]
					-
				[/#if]
			</td>
			<td>
				${orderItem.quantity}
			</td>
			<td>
				${orderItem.shippedQuantity}
			</td>
			<td>
				${orderItem.returnQuantity}
			</td>
			<td>
				[#if !orderItem.isGift]
					${currency(orderItem.subtotal, true)}
				[#else]
					-
				[/#if]
			</td>
		</tr>
	</table>
	<table class="input tabContent">
	</table>
	<table class="input tabContent">
		<tr class="title">
			<th>
				${message("Shipping.sn")}
			</th>
			<th>
				${message("Shipping.shippingMethod")}
			</th>
			<th>
				${message("Shipping.deliveryCorp")}
			</th>
			<th>
				${message("Shipping.trackingNo")}
			</th>
			<th>
				${message("Shipping.consignee")}
			</th>
			<th>
				${message("supplier.common.createDate")}
			</th>
		</tr>
		[#list orderItem.order.shippings as shipping]
			[#if supplier.id == shipping.supplier.id]
			<tr>
				<td>
					${shipping.sn}
				</td>
				<td>
					${shipping.shippingMethod}
				</td>
				<td>
					${shipping.deliveryCorp}
				</td>
				<td>
					${(shipping.trackingNo)!"-"}
				</td>
				<td>
					${shipping.consignee}
				</td>
				<td>
					<span title="${shipping.createDate?string("yyyy-MM-dd HH:mm:ss")}">${shipping.createDate}</span>
				</td>
			</tr>
			[/#if]
		[/#list]
	</table>
	<table class="input">
		<tr>
			<th>
				&nbsp;
			</th>
			<td>
				<input type="button" class="button" value="${message("supplier.common.back")}" onclick="location.href='list.jhtml'" />
			</td>
		</tr>
	</table>
</body>
</html>