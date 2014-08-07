[#assign current = "depositRecharge" /]
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>${message("shop.member.deposit.recharge")}[#if systemShowPowered] - Powered By openteach inc.[/#if]</title>
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
				<div class="input deposit">
					<div class="title">${message("shop.member.deposit.recharge")}</div>
					<form id="inputForm" action="${base}/payment/submit.jhtml" method="post" target="_blank">
						<input type="hidden" name="type" value="recharge" />
						<table class="input">
							<tr>
								<th>
									${message("shop.member.deposit.balance")}: 
								</th>
								<td>
									${currency(member.balance, true, true)}
								</td>
							</tr>
							<tr>
								<th>
									${message("shop.member.deposit.amount")}: 
								</th>
								<td>
									<input type="text" id="amount" name="amount" class="text" maxlength="16" onpaste="return false;" />
								</td>
							</tr>
							<tr>
								<th>
									${message("shop.member.deposit.paymentPlugin")}:
								</th>
								<td>
									<div id="paymentPlugin" class="paymentPlugin clearfix">
										[#if paymentPlugins??]
											[#list paymentPlugins as paymentPlugin]
												<div>
													<input type="radio" id="${paymentPlugin.id}" name="paymentPluginId" value="${paymentPlugin.id}"[#if paymentPlugin == defaultPaymentPlugin] checked="checked"[/#if] />
													<label for="${paymentPlugin.id}">
														[#if paymentPlugin.logo??]
															<em title="${paymentPlugin.paymentName}" style="background-image: url(${paymentPlugin.logo});">&nbsp;</em>
														[#else]
															<em>${paymentPlugin.paymentName}</em>
														[/#if]
													</label>
												</div>
											[/#list]
										[/#if]
									</div>
								</td>
							</tr>
							<tr class="hidden">
								<th>
									${message("shop.member.deposit.fee")}: 
								</th>
								<td>
									<span id="fee"></span>
								</td>
							</tr>
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									<input type="submit" class="button" value="${message("shop.member.submit")}" />
									<input type="button" class="button" value="${message("shop.member.back")}" onclick="location.href='list.jhtml'" />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		[#include "/shop/include/newFooter.ftl" /]
	</body>
	<script type="text/javascript">
		$().ready(function() {
		
			var $inputForm = $("#inputForm");
			var $amount = $("#amount");
			var $paymentPluginId = $("#paymentPlugin :radio");
			var $fee = $("#fee");
			var timeout;
			
			[@flash_message /]
			
			// 充值金额
			$amount.bind("input propertychange change", function(event) {
				if (event.type != "propertychange" || event.originalEvent.propertyName == "value") {
					calculateFee();
				}
			});
			
			// 支付插件
			$paymentPluginId.click(function() {
				calculateFee();
			});
			
			// 计算支付手续费
			function calculateFee() {
				clearTimeout(timeout);
				timeout = setTimeout(function() {
					if ($inputForm.valid()) {
						var paymentPluginId = $paymentPluginId.filter(":checked").val();
						$.ajax({
							url: "calculate_fee.jhtml",
							type: "POST",
							data: {paymentPluginId: paymentPluginId, amount: $amount.val()},
							dataType: "json",
							cache: false,
							success: function(data) {
								if (data.message.type == "success") {
									if (data.fee > 0) {
										$fee.text(currency(data.fee, true)).closest("tr").show();
									} else {
										$fee.closest("tr").hide();
									}
								} else {
									$.message(data.message);
								}
							}
						});
					} else {
						$fee.closest("tr").hide();
					}
				}, 500);
			}
			
			// 检查余额
			setInterval(function() {
				$.ajax({
					url: "check_balance.jhtml",
					type: "POST",
					dataType: "json",
					cache: false,
					success: function(data) {
						if (data.balance > ${member.balance}) {
							location.href = "list.jhtml";
						}
					}
				});
			}, 10000);
			
			// 表单验证
			$inputForm.validate({
				rules: {
					amount: {
						required: true,
						positive: true,
						decimal: {
							integer: 12,
							fraction: ${setting.priceScale}
						}
					}
				},
				submitHandler: function(form) {
					form.submit();
				}
			});
		
		});
	</script>
</html>