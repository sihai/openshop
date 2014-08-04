[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.supplier.bill")} - Powered By openteach inc.</title>
<meta name="author" content="openteach inc." />
<meta name="copyright" content="openteach inc." />
<link href="${base}/resources/supplier/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/supplier/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/supplier/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/supplier/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $listForm = $("#listForm");
	var $checkoutForm = $("#checkoutForm");
	var $checkoutButton = $("#checkoutButton");
	var $filterSelect = $("#filterSelect");
	var $filterOption = $("#filterOption a");
	var $print = $("select[name='print']");

	[@flash_message /]
	
	// 订单筛选
	$filterSelect.mouseover(function() {
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.menuWrap");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
		$menuWrap.mouseleave(function() {
			$popupMenu.hide();
		});
	});
	
	// 筛选选项
	$filterOption.click(function() {
		var $this = $(this);
		var $dest = $("#" + $this.attr("name"));
		if ($this.hasClass("checked")) {
			$dest.val("");
		} else {
			$dest.val($this.attr("val"));
		}
		$listForm.submit();
		return false;
	});
	
	// 打印选择
	$print.change(function() {
		var $this = $(this);
		if ($this.val() != "") {
			window.open($this.val());
		}
	});
	
	//
	$checkoutButton.click(function() {
		$("#memo").val($("#textarea_memo").val());
		$checkoutForm.submit();
	});

});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.supplier.bill")}
	</div>
	<form id="listForm" action="bill.jhtml" method="get">
		[#list orderItemIds as orderItemId]
			<input type="hidden" name="orderItemIds" value="${orderItemId}" />
		[/#list]
		<input type="hidden" id="supplierId" name="supplierId" value="${supplier.id}" />
		<div class="bar">
			<div class="buttonWrap">
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("supplier.common.refresh")}
				</a>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th>
					<a href="javascript:;" class="sort" name="sn">${message("OrderItem.sn")}</a>
				</th>
				<th>
					<span>${message("OrderItem.name")}</span>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="price">${message("OrderItem.price")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="quantity">${message("OrderItem.quantity")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="shippedQuantity">${message("OrderItem.shippedQuantity")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="returnQuantity">${message("OrderItem.returnQuantity")}</a>
				</th>
				<th>
					<a href="javascript:;">${message("OrderItem.subtotal")}</a>
				</th>
				<th>
					<a href="javascript:;">${message("OrderItem.rebatePoint")}</a>
				</th>
				<th>
					<a href="javascript:;">${message("OrderItem.rebate")}</a>
				</th>
				<th>
					<a href="javascript:;">${message("OrderItem.platformShouldPay")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="platformPaymentStatus">${message("OrderItem.platformPaymentStatus")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="shippingStatus">${message("Order.shippingStatus")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="createDate">${message("supplier.common.createDate")}</a>
				</th>
			</tr>
			[#list itemList as orderItem]
				<tr>
					<td>
						${orderItem.sn}
					</td>
					<td>
						${orderItem.name}
					</td>
					<td>
						${currency(orderItem.price, true)}
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
						${orderItem.subtotal}
					</td>
					<td>
						${orderItem.rebatePoint}
					</td>
					<td>
						${orderItem.rebate}
					</td>
					<td>
						${orderItem.platformShouldPay}
					</td>
					<td>
						${message("OrderItem.platformPaymentStatus." + orderItem.platformPaymentStatus)}
					</td>
					<td>
						${message("Order.ShippingStatus." + orderItem.shippingStatus)}
					</td>
					<td>
						<span title="${orderItem.createDate?string("yyyy-MM-dd HH:mm:ss")}">${orderItem.createDate}</span>
					</td>
					
				</tr>
			[/#list]
			
			[#if itemList?has_content]
			<tr>
				<td colspan="13">
				`
				</td>
			</tr>
			<tr>
				<td colspan="13">
					<strong>账单统计:</strong>
				</td>
			</tr>
			<tr>
				<td colspan="13">
					<table class="list">
						<tr>
							<td>
								${message("admin.supplier.bill.income")}:
							</td>
							<td>
								${currency(income, true)}
							</td>
							<td>
								${message("admin.supplier.bill.postage")}:
							</td>
							<td>
								${currency(postage, true)}
							</td>
						</tr>
						<tr>
							<td>
								${message("admin.supplier.bill.rebate")}:
							</td>
							<td>
								${currency(rebate, true)}
							</td>
							<td>
								${message("admin.supplier.bill.pay")}:
							</td>
							<td>
								${currency(pay, true)}
							</td>
						</tr>
						<tr>
							<td>
								${message("admin.supplier.bill.finalIncome")}:
							</td>
							<td>
								${currency(finalIncome, true)}
							</td>
							<td>
								${message("admin.supplier.bill.finalPay")}:
							</td>
							<td>
								${currency(finalPay, true)}
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="13">
				</td>
			</tr>
			<tr>
				<td colspan="13">
					<strong>供应商支付帐户信息:</strong>
				</td>
			</tr>
			<tr>
				<td colspan="13">
					<table class="list">
						<tr>
							<td>
								${message("Supplier.name")}:
							</td>
							<td>
								${supplier.name}
							</td>
							<td>
								${message("Supplier.email")}:
							</td>
							<td>
								${supplier.email}
							</td>
						</tr>
						<tr>
							<td>
								${message("Supplier.alipay")}:
							</td>
							<td>
								[#if supplier.alipay??]
								${supplier.alipay}
								[/#if]
							</td>
							<td>
								${message("Supplier.bankAccount")}:
							</td>
							<td>
								[#if supplier.bank?? && supplier.account??]
								${supplier.bank}:${supplier.account}
								[/#if]
							</td>
						</tr>
						<tr>
							<td>
								${message("Supplier.level")}:
							</td>
							<td>
								[#if supplier.level??]
									${message("Supplier.level." + supplier.level)}
								[/#if]
							</td>
							<td>
							</td>
							<td>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="13">
					<table class="list">
						<tr>
							<td>
								${message("PlatformPayment.memo")}:
							</td>
							<td>
								<textarea id="textarea_memo"></textarea>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			[/#if]
			<tr>
				<td colspan="13">
					[#if itemList?has_content]
						<input id="checkoutButton" type="button" class="button" value="${message("admin.common.submit")}"/>
					[/#if]
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
			</tr>
		</table>		
	</form>
</body>
	<form id="checkoutForm" name="checkoutForm" action="checkout.jhtml" method="post">
		[#list itemList as item]
			<input type="hidden" name="orderItemIds" value="${item.id}">
		[/#list]
		<input type="hidden" name="supplierId" value="${supplier.id}">
		<input type="hidden" name="payee" value="${supplier.name}">
		<input type="hidden" name="account" value="${supplier.account}">
		<input type="hidden" id="memo" name="memo">
	</form>
</html>