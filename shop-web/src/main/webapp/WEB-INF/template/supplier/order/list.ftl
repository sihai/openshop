[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("supplier.order.list")} - Powered By openteach inc.</title>
<meta name="author" content="openteach inc." />
<meta name="copyright" content="openteach inc." />
<link href="${base}/resources/supplier/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/supplier/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/supplier/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/supplier/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $listForm = $("#listForm");
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

});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/supplier/common/index.jhtml">${message("supplier.path.index")}</a> &raquo; ${message("supplier.order.list")} <span>(${message("supplier.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<input type="hidden" id="platformPaymentStatus" name="platformPaymentStatus" value="${platformPaymentStatus}" />
		<input type="hidden" id="itemShippingStatus" name="itemShippingStatus" value="${itemShippingStatus}" />
		<div class="bar">
			<div class="buttonWrap">
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("supplier.common.refresh")}
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="filterSelect" class="button">
						${message("supplier.order.filter")}<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="filterOption" class="check">
							
							<li>
								<a href="javascript:;" name="platformPaymentStatus" val="unpaid"[#if platformPaymentStatus == "unpaid"] class="checked"[/#if]>${message("Order.PaymentStatus.unpaid")}</a>
							</li>
							<li>
								<a href="javascript:;" name="platformPaymentStatus" val="paid"[#if platformPaymentStatus == "paid"] class="checked"[/#if]>${message("Order.PaymentStatus.paid")}</a>
							</li>
							<li class="separator">
								<a href="javascript:;" name="itemShippingStatus" val="unshipped"[#if itemShippingStatus == "unshipped"] class="checked"[/#if]>${message("Order.ShippingStatus.unshipped")}</a>
							</li>
							<li>
								<a href="javascript:;" name="itemShippingStatus" val="partialShipment"[#if itemShippingStatus == "partialShipment"] class="checked"[/#if]>${message("Order.ShippingStatus.partialShipment")}</a>
							</li>
							<li>
								<a href="javascript:;" name="itemShippingStatus" val="shipped"[#if itemShippingStatus == "shipped"] class="checked"[/#if]>${message("Order.ShippingStatus.shipped")}</a>
							</li>
							<li>
								<a href="javascript:;" name="itemShippingStatus" val="partialReturns"[#if itemShippingStatus == "partialReturns"] class="checked"[/#if]>${message("Order.ShippingStatus.partialReturns")}</a>
							</li>
							<li>
								<a href="javascript:;" name="itemShippingStatus" val="returned"[#if itemShippingStatus == "returned"] class="checked"[/#if]>${message("Order.ShippingStatus.returned")}</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="menuWrap">
					<a href="javascript:;" id="pageSizeSelect" class="button">
						${message("supplier.page.pageSize")}<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="pageSizeOption">
							<li>
								<a href="javascript:;"[#if page.pageSize == 10] class="current"[/#if] val="10">10</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 20] class="current"[/#if] val="20">20</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 50] class="current"[/#if] val="50">50</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 100] class="current"[/#if] val="100">100</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="searchValue" name="searchValue" value="${page.searchValue}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;"[#if page.searchProperty == "sn"] class="current"[/#if] val="sn">${message("Order.sn")}</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
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
				<th>
					<span>${message("supplier.order.print")}</span>
				</th>
				<th>
					<span>${message("supplier.common.handle")}</span>
				</th>
			</tr>
			[#list page.content as orderItem]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${orderItem.id}" />
					</td>
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
					<td>
						<select name="print">
							<option value="">${message("supplier.common.choose")}</option>
							<option value="../print/order.jhtml?id=${orderItem.id}">${message("supplier.order.orderPrint")}</option>
							<option value="../print/product.jhtml?id=${orderItem.id}">${message("supplier.order.productPrint")}</option>
							<option value="../print/shipping.jhtml?id=${orderItem.id}">${message("supplier.order.shippingPrint")}</option>
							<option value="../print/delivery.jhtml?orderId=${orderItem.id}">${message("supplier.order.deliveryPrint")}</option>
						</select>
					</td>
					<td>
						<a href="view.jhtml?id=${orderItem.id}">[${message("supplier.common.view")}]</a>
					</td>
				</tr>
			[/#list]
		</table>
		[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
			[#include "/supplier/include/pagination.ftl"]
		[/@pagination]
	</form>
</body>
</html>