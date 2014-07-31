[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.supplier.paymentList")} - Powered By openteach inc.</title>
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
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.supplier.paymentList")} <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="payment_list.jhtml" method="get">
		<input type="hidden" name="supplierId", value="${supplierId}">
		<div class="bar">
			<div class="buttonWrap">
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("supplier.common.refresh")}
				</a>
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
				<th>
					<a href="javascript:;" class="sort" name="sn">${message("PlatformPayment.sn")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="supplier">${message("PlatformPayment.supplier")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="money">${message("PlatformPayment.money")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="payee">${message("PlatformPayment.payee")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="account">${message("PlatformPayment.account")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="operator">${message("PlatformPayment.operator")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="createDate">${message("PlatformPayment.createDate")}</a>
				</th>
			</tr>
			[#list page.content as payment]
				<tr>
					<td>
						${payment.sn}
					</td>
					<td>
						${payment.supplier.name}
					</td>
					<td>
						${payment.money}
					</td>
					<td>
						${payment.payee}
					</td>
					<td>
						${payment.account}
					</td>
					<td>
						${payment.operator.username}
					</td>
					<td>
						<span title="${payment.createDate?string("yyyy-MM-dd HH:mm:ss")}">${payment.createDate}</span>
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