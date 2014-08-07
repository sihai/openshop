[#assign articleCategory = article.articleCategory /]
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		[@seo type = "articleContent"]
			<title>[#if article.seoTitle??]${article.seoTitle}[#elseif seo.title??][@seo.title?interpret /][/#if][#if systemShowPowered] - Powered By openteach inc.[/#if]</title>
			
			[#if article.seoKeywords??]
				<meta name="keywords" content="${article.seoKeywords}" />
			[#elseif seo.keywords??]
				<meta name="keywords" content="[@seo.keywords?interpret /]" />
			[/#if]
			[#if article.seoDescription??]
				<meta name="description" content="${article.seoDescription}" />
			[#elseif seo.description??]
				<meta name="description" content="[@seo.description?interpret /]" />
			[/#if]
		[/@seo]
		
		[#include "/shop/include/metaAndcss.ftl" /]
		
		<link href="${base}/resources/shop/css/article.css" rel="stylesheet" type="text/css" />
		
	</head>
	<body class="women ">
		
		<div id="fb-root"></div>
		<script src="${base}/assets/front/js/browser_detect.js"></script>
		
	    [#include "/shop/include/newHeader.ftl" /]
	    [#include "/shop/include/announcement.ftl" /]
	    
		<div class="container articleContent">
			<div class="span6">
				<div class="hotArticleCategory">
					<div class="title">${message("shop.article.articleCategory")}</div>
					[@article_category_root_list count = 10]
						[#list articleCategories as category]
							<dl[#if !category_has_next] class="last"[/#if]>
								<dt>
									<a href="${base}${category.path}">${category.name}</a>
								</dt>
								[#list category.children as articleCategory]
									[#if articleCategory_index == 6]
										[#break /]
									[/#if]
									<dd>
										<a href="${base}${articleCategory.path}">${articleCategory.name}</a>
									</dd>
								[/#list]
							</dl>
						[/#list]
					[/@article_category_root_list]
				</div>
				<div class="hotArticle">
					<div class="title">${message("shop.article.hotArticle")}</div>
					<ul>
						[@article_list articleCategoryId = articleCategory.id count = 10 orderBy="hits desc"]
							[#list articles as article]
								<li>
									<a href="${base}${article.path}" title="${article.title}">${abbreviate(article.title, 30)}</a>
								</li>
							[/#list]
						[/@article_list]
					</ul>
				</div>
			</div>
			<div class="span18 last">
				<div class="path">
					<ul>
						<li>
							<a href="${base}/">${message("shop.path.home")}</a>
						</li>
						[@article_category_parent_list articleCategoryId = articleCategory.id]
							[#list articleCategories as articleCategory]
								<li>
									<a href="${base}${articleCategory.path}">${articleCategory.name}</a>
								</li>
							[/#list]
						[/@article_category_parent_list]
						<li>
							<a href="${base}${articleCategory.path}">${articleCategory.name}</a>
						</li>
					</ul>
				</div>
				<div class="main">
					<h1 class="title">${article.title}[#if article.pageNumber > 1] (${article.pageNumber})[/#if]</h1>
					<div class="info">
						${message("shop.article.createDate")}: ${article.createDate?string("yyyy-MM-dd HH:mm:ss")}
						${message("shop.article.author")}: ${article.author}
						${message("shop.article.hits")}: <span id="hits">&nbsp;</span>
					</div>
					<div class="content">${article.content}</div>
				</div>
				[@pagination pageNumber = article.pageNumber totalPages = article.totalPages pattern = "{pageNumber}.html"]
					[#include "/shop/include/pagination.ftl"]
				[/@pagination]
			</div>
		</div>
		[#include "/shop/include/newFooter.ftl" /]
	</body>
	<script type="text/javascript">
		$().ready(function() {
		
			var $hits = $("#hits");
		
			// 查看点击数
			$.ajax({
				url: "${base}/article/hits/${article.id}.jhtml",
				type: "GET",
				success: function(data) {
					$hits.text(data);
				}
			});
		
		});
	</script>
</html>