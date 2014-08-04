<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	
	[#if productCategory??]
		[@seo type = "productList"]
			<title>[#if productCategory.seoTitle??]${productCategory.seoTitle}[#elseif seo.title??][@seo.title?interpret /][/#if][#if systemShowPowered] - Powered By aigechibaole[/#if]</title>
			[#if productCategory.seoKeywords??]
				<meta name="keywords" content="${productCategory.seoKeywords}" />
			[#elseif seo.keywords??]
				<meta name="keywords" content="[@seo.keywords?interpret /]" />
			[/#if]
			[#if productCategory.seoDescription??]
				<meta name="description" content="${productCategory.seoDescription}" />
			[#elseif seo.description??]
				<meta name="description" content="[@seo.description?interpret /]" />
			[/#if]
		[/@seo]
	[#else]
		<title>${message("shop.product.title")}[#if systemShowPowered] - Powered By aigechibaole[/#if]</title>
	[/#if]modernizr
	
	<meta name="author" content="openteach inc." />
	<meta name="copyright" content="aigechibaole" />
	<link rel="icon" href="${base}/assets/front/images/favicon.ico" type="image/x-icon" />
	<link href="${base}/assets/front/css/main.min.css" rel="stylesheet" type="text/css" />
	
	<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
	
	<script src="${base}/assets/front/js/modernizr.js"></script>
	
	<!--[if !(IE 7)]><!-->
	<script>
		(function () {
			var head = document.getElementsByTagName('head')[0],scriptTag = document.createElement('script');
		    scriptTag.src = '${base}/assets/front/js/tmp.js';
		    scriptTag.async = true,
		    scriptTag.defer = true;
			head.parentNode.insertBefore(scriptTag, head);
		}());

		(function () {
 			setTimeout(function() {
  				window.optimizely = window.optimizely || [];
		      	if (!window.optimizely.data) {
		        	window.optimizely.push("disable");
		     	}
			}, 3000);
		}());
	</script>
	<!--<![endif]-->
</head>
<body class="women ">
	<div id="fb-root"></div>
	<script src="${base}/assets/front/js/browser_detect.js"></script>
	
    [#include "/shop/include/newHeader.ftl" /]
    [#include "/shop/include/announcement.ftl" /]
    
    <!--Search query-->
	<div class="serp-header">
		<div class="serp-header-contents ">
		    <h1 class="page-title primary">
		       	<strong class="query primary">${productKeyword}</strong>
		    </h1>
	  	</div>
	</div>
	<!--Search query end-->
	
	<!--Search result-->
	<div class="search-results">
		<!--分页&筛选-->
		<div class="listing-meta group">
			<div class="flourish result-count">
			  Showing: <span class="result-range">97-144</span> of <span class="total-results">${page.totalPages}</span>
			</div>

			<div class="controls group">
				[@pagination pageNumber = page.pageNumber totalPages = page.totalPages pattern = "javascript: $.pageSkip({pageNumber});"]
					[#include "/shop/include/pagination.ftl"]
				[/@pagination]
			</div>
		</div>
		<!--分页&筛选 end-->
  				
			<!--左侧类目-->
			<form class="search-results-faceting faceting submittable" id="facets" action="/search.jhtml">
				<div class="categories-facet facet-set " data-gilt-facet-set="categories">
					<h2 class="facet-title">类目</h2>
					<ul class="facets">
						[@product_category_root_list]
							[#list productCategories as category]
								<li>
	      							<label class="facet-label facet-parent selected" data-facet-count="5442" data-facet-filter-value="Gilt::Men">
	          							<a href="${base}${category.path}"><span class="facet-text">${category.name}</span></a>
	      							</label>
									<ul class="facets">
										[@product_category_children_list productCategoryId = category.id count = 32]
											[#list productCategories as productCategory]
												<label class="facet-label facet-parent" data-facet-count="5442" data-facet-filter-value="Gilt::Men::Clothing">
		          									<a href="${base}${productCategory.path}"><span class="facet-text">${productCategory.name}</span></a>
		      									</label>
											[/#list]
										[/@product_category_children_list]
									</ul>
								</li>
							[/#list]
						[/@product_category_root_list]
					</ul>
				</div>
			</form>
			<!--左侧类目 end-->
    			
			<!--结果列表-->
			<section class="listing search-results-listing products  " id="search-result-products">
				[#if page.content?has_content]
					[#list page.content?chunk(4) as row]
						[#list row as product]
							<!--一个结果-->
							<article class="product-look look hproduct for_sale">
								<a class="url look-photo" href="${base}${product.path}" >
			    					<img class="product-image" src="${base}/assets/front/images/spacer.gif" data-img-src='[#if product.thumbnail??]${product.thumbnail}[#else]${setting.defaultThumbnailProductImage}[/#if]' width="220" height="300" />
								</a>
							    <header class="summary">
							      	<hgroup class="look-name">
							      		[#if product.brand??]
							        	<h2 class="brand brand-name"> 
											<a class="" href="${base}${product.brand.path}" >
								            	${abbreviate(product.brand.name, 60)}
								          	</a>
							        	</h2>
							        	[/#if]
							        	<h1 class="name fn product-name">
											<a class="" href="${base}${product.path}" >
							            		${abbreviate(product.name, 60)}
							          		</a>
							        	</h1>
							      	</hgroup>
									<a class="pricing" href="${base}${product.path}" >
							        	<div class="sale-price highlight flourish">
							          		<span class="price">${currency(product.price, true)}</span>
							        	</div>
							        	[#if setting.isShowMarketPrice]
							        		<div class="original-price diminished">
							            		<span class="msrp">${currency(product.marketPrice, true)}</span>
							          		</div>
										[/#if]
							     	</a>
							    </header>
							</article>
							<!--一个结果 end-->
						[/#list]
					[/#list]
				[#else]
					${message("shop.product.noSearchResult", productKeyword)}
				[/#if]
				
				<!--分页信息-->
  				<div class="listing-meta group">
  					[@pagination pageNumber = page.pageNumber totalPages = page.totalPages pattern = "javascript: $.pageSkip({pageNumber});"]
						[#include "/shop/include/pagination.ftl"]
					[/@pagination]
  				</div>
  				<!--分页信息 end-->
			</section>
			<!--结果列表 end-->
		</div>
		
		[#include "/shop/include/newFooter.ftl" /]
		<script>
			$('.product-image').each(function() {
    			this.src = this.getAttribute("data-img-src");
    		});
		</script>
	</body>
</html>