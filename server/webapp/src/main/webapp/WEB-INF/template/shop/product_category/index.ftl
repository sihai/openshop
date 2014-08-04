<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>${message("shop.productCategory.title")}[#if systemShowPowered] - Powered By aigechibaole[/#if]</title>
		[#include "/shop/include/metaAndcss.ftl" /]
		<link href="${base}/resources/shop/css/product.css" rel="stylesheet" type="text/css" />
		<link href="${base}/resources/shop/css/product_category.css" rel="stylesheet" type="text/css" />
	</head>
	<body class="women ">
		<div id="fb-root"></div>
		<script src="${base}/assets/front/js/browser_detect.js"></script>
		
	    [#include "/shop/include/newHeader.ftl" /]
	    [#include "/shop/include/announcement.ftl" /]
	    
		<div class="container productCategory">
			<div class="span6">
				<div class="hotProduct">
					<div class="title">${message("shop.product.hotProduct")}</div>
					<ul>
						[@product_list count = 10 orderBy="monthSales desc"]
							[#list products as product]
								<li[#if !product_has_next] class="last"[/#if]>
									<a href="${base}${product.path}" title="${product.name}">${abbreviate(product.name, 30)}</a>
									[#if product.scoreCount > 0]
										<div>
											<div>${message("Product.score")}: </div>
											<div class="score${(product.score * 2)?string("0")}"></div>
											<div>${product.score?string("0.0")}</div>
										</div>
									[/#if]
									<div>${message("Product.price")}: <strong>${currency(product.price, true, true)}</strong></div>
									<div>${message("Product.monthSales")}: <em>${product.monthSales}</em></div>
								</li>
							[/#list]
						[/@product_list]
					</ul>
				</div>
			</div>
			<div class="span18 last">
				<div class="path">
					<ul>
						<li>
							<a href="${base}/">${message("shop.path.home")}</a>
						</li>
						<li class="last">${message("shop.productCategory.title")}</li>
					</ul>
				</div>
				<div class="list">
					<table>
						[#list rootProductCategories as rootProductCategory]
							<tr[#if !rootProductCategory_has_next] class="last"[/#if]>
								<th>
									<a href="${base}${rootProductCategory.path}">${rootProductCategory.name}</a>
								</th>
								<td>
									[#list rootProductCategory.children as productCategory]
										<a href="${base}${productCategory.path}">${productCategory.name}</a>
									[/#list]
								</td>
							</tr>
						[/#list]
					</table>
				</div>
			</div>
		</div>
		[#include "/shop/include/newFooter.ftl" /]
	</body>
</html>