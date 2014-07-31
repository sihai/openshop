<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		[@seo type = "articleSearch"]
			<title>[#if seo.title??][@seo.title?interpret /][/#if][#if systemShowPowered] - Powered By aigechibaole[/#if]</title>
			[#if seo.keywords??]
				<meta name="keywords" content="[@seo.keywords?interpret /]" />
			[/#if]
			[#if seo.description??]
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
	    
		<div class="container articleList">
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
						[@article_list count = 10 orderBy="hits desc"]
							[#list articles as article]
								<li>
									<a href="${base}${article.path}" title="${article.title}">${abbreviate(article.title, 30)}</a>
								</li>
							[/#list]
						[/@article_list]
					</ul>
				</div>
				<div class="articleSearch">
					<div class="title">${message("shop.article.search")}</div>
					<div class="content">
						<form id="articleSearchForm" action="${base}/article/search.jhtml" method="get">
							<input type="text" name="keyword" value="${articleKeyword}" maxlength="30" />
							<button type="submit">${message("shop.article.searchSubmit")}</button>
						</form>
					</div>
				</div>
			</div>
			<div class="span18 last">
				<div class="path">
					<ul>
						<li>
							<a href="${base}/">${message("shop.path.home")}</a>
						</li>
						<li class="last">${message("shop.article.path", articleKeyword)}</li>
					</ul>
				</div>
				<div class="result">
					[#if page.content?has_content]
						<ul>
							[#list page.content as article]
								<li[#if !article_has_next] class="last"[/#if]>
									<a href="${base}${article.path}" title="${article.title}">${abbreviate(article.title, 80, "...")}</a>
									${article.author}
									<span title="${article.createDate?string("yyyy-MM-dd HH:mm:ss")}">${article.createDate}</span>
									<p>${abbreviate(article.text, 220, "...")}</p>
								</li>
							[/#list]
						</ul>
					[#else]
						${message("shop.article.noSearchResult", articleKeyword)}
					[/#if]
				</div>
				[@pagination pageNumber = page.pageNumber totalPages = page.totalPages pattern = "search.jhtml?keyword=${articleKeyword}&pageNumber={pageNumber}"]
					[#include "/shop/include/pagination.ftl"]
				[/@pagination]
			</div>
		</div>
		[#include "/shop/include/newFooter.ftl" /]
	</body>
	<script type="text/javascript">
		$().ready(function() {
		
			var $articleSearchForm = $("#articleSearchForm");
			var $keyword = $("#articleSearchForm input");
			var defaultKeyword = "${message("shop.article.keyword")}";
			
			$keyword.focus(function() {
				if ($keyword.val() == defaultKeyword) {
					$keyword.val("");
				}
			});
			
			$keyword.blur(function() {
				if ($keyword.val() == "") {
					$keyword.val(defaultKeyword);
				}
			});
		
			$articleSearchForm.submit(function() {
				if ($.trim($keyword.val()) == "" || $keyword.val() == defaultKeyword) {
					return false;
				}
			});
		
		});
	</script>
</html>