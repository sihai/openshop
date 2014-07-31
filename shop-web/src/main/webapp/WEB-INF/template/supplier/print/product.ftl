<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("supplier.print.product")} - Powered By openteach inc.</title>
<meta name="author" content="openteach inc." />
<meta name="copyright" content="openteach inc." />
<link href="${base}/resources/supplier/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/supplier/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/supplier/js/common.js"></script>
<style type="text/css">
.bar {
	height: 30px;
	line-height: 30px;
	border-bottom: 1px solid #d7e8f8;
	background-color: #eff7ff;
}

table {
	width: 100%;
}

table th {
	font-weight: bold;
	text-align: left;
}

table td, table th {
	line-height: 30px;
	padding: 0px 4px;
	font-size: 10pt;
	color: #000000;
}

.separated th, .separated td {
	border-top: 1px solid #000000;
	border-bottom: 1px solid #000000;
}
</style>
<style type="text/css" media="print">
.bar {
	display: none;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $print = $("#print");

	$print.click(function() {
		window.print();
		return false;
	});

});
</script>
</head>
<body>
	<div class="bar">
		<a href="javascript:;" id="print" class="button">${message("supplier.print.print")}</a>
	</div>
	<div class="content">
		<table>
			<tr>
				<td colspan="2" rowspan="2">
					<img src="${setting.logo}" alt="${setting.siteName}" />
				</td>
				<td>
					${setting.siteName}
				</td>
				<td>
					&nbsp;
				</td>
				<td colspan="2">
					${message("Order.consignee")}: ${order.consignee}
				</td>
			</tr>
			<tr>
				<td>
					${setting.siteUrl}
				</td>
				<td>
					&nbsp;
				</td>
				<td colspan="2">
					${message("Order.member")}: ${orderItem.order.member.username}
				</td>
			</tr>
			<tr class="separated">
				<th colspan="2">
					${message("Order.sn")}: ${orderItem.order.sn}
				</th>
				<th colspan="2">
					${message("supplier.common.createDate")}: ${orderItem.order.createDate?string("yyyy-MM-dd")}
				</th>
				<th colspan="2">
					${message("supplier.print.printDate")}: ${.now?string("yyyy-MM-dd")}
				</th>
			</tr>
			<tr>
				<td colspan="6">
					&nbsp;
				</td>
			</tr>
			<tr class="separated">
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
					${message("OrderItem.subtotal")}
				</th>
			</tr>
			<tr>
				<td>
					${orderItem.sn}
				</td>
				<td>
					${abbreviate(orderItem.fullName, 50, "...")}
				</td>
				<td>
					${currency(orderItem.price, true)}
				</td>
				<td>
					${orderItem.quantity}
				</td>
				<td>
					${currency(orderItem.subtotal, true)}
				</td>
			</tr>
			<tr>
				<td colspan="6">
					&nbsp;
				</td>
			</tr>
			<tr class="separated">
				<td colspan="3">
					&nbsp;
				</td>
				<td colspan="3">
					${message("Order.memo")}: ${orderItem.order.memo}<br />
					${message("Order.phone")}: ${orderItem.order.phone}<br />
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
				<td colspan="2">
					Powered By AIGECHIBAOLE
				</td>
			</tr>
		</table>
	</div>
</body>
</html>