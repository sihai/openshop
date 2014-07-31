<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>${promotion.title}[#if systemShowPowered] - Powered By aigechibaole[/#if]</title>
		[#include "/shop/include/metaAndcss.ftl" /]
		<link href="${base}/resources/shop/css/product.css" rel="stylesheet" type="text/css" />
		<link href="${base}/resources/shop/css/promotion.css" rel="stylesheet" type="text/css" />
		
	</head>
	<body class="women ">
		<div id="fb-root"></div>
		<script src="${base}/assets/front/js/browser_detect.js"></script>
		
	    [#include "/shop/include/newHeader.ftl" /]
	    [#include "/shop/include/announcement.ftl" /]
	    
		<div class="container promotion">
			<div class="span6">
				<div class="hotProductCategory">
					[@product_category_root_list]
						[#list productCategories as category]
							<dl[#if !category_has_next] class="last"[/#if]>
								<dt>
									<a href="${base}${category.path}">${category.name}</a>
								</dt>
								[@product_category_children_list productCategoryId = category.id count = 4]
									[#list productCategories as productCategory]
										<dd>
											<a href="${base}${productCategory.path}">${productCategory.name}</a>
										</dd>
									[/#list]
								[/@product_category_children_list]
							</dl>
						[/#list]
					[/@product_category_root_list]
				</div>
				<div class="hotProduct">
					<div class="title">${message("shop.product.hotProduct")}</div>
					<ul>
						[@product_list count = 6 orderBy="monthSales desc"]
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
						<li>
							${message("shop.promotion.title")}
						</li>
					</ul>
				</div>
				<div class="content">
					<h1 class="title">${promotion.title}</h1>
					<div class="info">${message("shop.promotion.createDate")}: ${promotion.createDate?string("yyyy-MM-dd HH:mm:ss")}</div>
					<div>${promotion.introduction}</div>
				</div>
			</div>
		</div>
		[#include "/shop/include/newFooter.ftl" /]
	</body>
</html>