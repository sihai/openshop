<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.supplier.view")} - Powered By openteach inc.</title>
<meta name="author" content="openteach inc." />
<meta name="copyright" content="openteach inc." />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.supplier.view")}
	</div>
	<table class="input">
		<tr>
			<th>
				${message("Supplier.name")}:
			</th>
			<td>
				${supplier.name}
			</td>
		</tr>
		<tr>
			<th>
				${message("Supplier.email")}:
			</th>
			<td>
				${supplier.email}
			</td>
		</tr>
		<tr>
			<th>
				${message("Supplier.alipay")}:
			</th>
			<td>
				${supplier.alipay}
			</td>
		</tr>
		<tr>
			<th>
				${message("Supplier.bank")}:
			</th>
			<td>
				${supplier.bank}
			</td>
		</tr>
		<tr>
			<th>
				${message("Supplier.account")}:
			</th>
			<td>
				${supplier.account}
			</td>
		</tr>
		<tr>
			<th>
				${message("Supplier.level")}:
			</th>
			<td>
				[#if supplier.level??]
					${message("Supplier.level." + supplier.level)}
				[/#if]
			</td>
		</tr>
		
		<tr>
			<th>
				${message("Supplier.isEnabled")}:
			</th>
			<td>
				[#if supplier.isEnabled] 
					${message("admin.common.yes")}
				[#else]
					${message("admin.common.no")}
				[/#if]
				
			</td>
		</tr>
		
		<tr>
			<th>
				${message("Supplier.isLocked")}:
			</th>
			<td>
				[#if supplier.isLocked] 
					${message("common.yes")}
				[#else]
					${message("common.no")}
				[/#if]
				
			</td>
		</tr>
		
		
		<tr>
			<th>
				&nbsp;
			</th>
			<td>
				&nbsp;
			</td>
		</tr>
		
	</table>
	
	<table class="input">
		
		<tr>
			<th>
				${message("admin.supplier.marketableProductCount")}:
			</th>
			<td>
				${marketableProductCount}
			</td>
			<th>
				${message("admin.supplier.notMarketableProductCount")}:
			</th>
			<td>
				${notMarketableProductCount}
			</td>
		</tr>
		
		<tr>
			<th>
				${message("admin.supplier.stockAlertProductCount")}:
			</th>
			<td>
				${stockAlertProductCount}
			</td>
			<th>
				${message("admin.supplier.outOfStockProductCount")}:
			</th>  
			<td>
				${outOfStockProductCount}
			</td>
		</tr>
		
		<tr>
			<th>
				${message("admin.supplier.waitingShippingOrderCount")}:
			</th>
			<td>
				${waitingShippingOrderCount}
			</td>
			<th>
				${message("admin.supplier.waitingPlatformPaymentOrderCount")}:
			</th>
			<td>
				${waitingPlatformPaymentOrderCount}
			</td>
		</tr>
		
		<tr>
			<th>
				${message("admin.supplier.unreadMessageCount")}:
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
				${message("admin.supplier.platformPaymentCount")}:
			</th>
			<td>
				${platformPaymentCount}
			</td>
			<th>
				${message("admin.supplier.income")}:
			</th>
			<td>
				${currency(income, true)}
			</td>
		</tr>
		
		<tr>
			<th>
				${message("admin.supplier.rebate")}:
			</th>
			<td>
				${currency(rebate, true)}
			</td>
			<th>
				
			</th>
			<td>
			</td>
		</tr>
	</table>
</body>
</html>