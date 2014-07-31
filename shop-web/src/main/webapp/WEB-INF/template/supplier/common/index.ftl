<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("supplier.index.title")} - Powered By openteach inc.</title>
<meta name="author" content="openteach inc." />
<meta name="copyright" content="openteach inc." />
<link href="${base}/resources/supplier/css/common.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.input .powered {
	font-size: 11px;
	text-align: right;
	color: #cccccc;
}
</style>
</head>
<body>
	<div class="path">
		${message("supplier.index.title")}
	</div>
	<table class="input">
		<tr>
			<th>
				${message("supplier.index.official")}:
			</th>
			<td>
				<a href="http://www.aigechibaole.com" target="_blank">http://www.aigechibaole.com</a>
			</td>
			<th>
				${message("supplier.index.bbs")}:
			</th>
			<td>
				<a href="http://bbs.aigechibaole.com" target="_blank">http://bbs.aigechibaole.com</a>
			</td>
		</tr>
		
		<tr>
			<td colspan="4">
				&nbsp;
			</td>
		</tr>
		
		<tr>
			<th>
				${message("supplier.index.marketableProductCount")}:
			</th>
			<td>
				${marketableProductCount}
			</td>
			<th>
				${message("supplier.index.notMarketableProductCount")}:
			</th>
			<td>
				${notMarketableProductCount}
			</td>
		</tr>
		<tr>
			<th>
				${message("supplier.index.stockAlertProductCount")}:
			</th>
			<td>
				${stockAlertProductCount}
			</td>
			<th>
				${message("supplier.index.outOfStockProductCount")}:
			</th>  
			<td>
				${outOfStockProductCount}
			</td>
		</tr>
		<tr>
			<th>
				${message("supplier.index.waitingShippingOrderCount")}:
			</th>
			<td>
				${waitingShippingOrderCount}
			</td>
			<th>
				${message("supplier.index.waitingPlatformPaymentOrderCount")}:
			</th>
			<td>
				${waitingPlatformPaymentOrderCount}
			</td>
		</tr>
		<tr>
			<th>
				${message("supplier.index.unreadMessageCount")}:
			</th>
			<td>
				${unreadMessageCount}
			</td>
			<th>
			</th>
			<td>
			</td>
		</tr>
		
		<tr>
			<th>
				${message("supplier.index.platformPaymentCount")}:
			</th>
			<td>
				${platformPaymentCount}
			</td>
			<th>
				${message("supplier.index.income")}:
			</th>
			<td>
				${currency(income, true)}
			</td>
		</tr>
		
		<tr>
			<td class="powered" colspan="4">
				COPYRIGHT © 2013-2014 AIGECHIBAOLE ALL RIGHTS RESERVED.
			</td>
		</tr>
	</table>
</body>
</html>