<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		[@seo type = "articleList"]
			<title>[#if articleCategory.seoTitle??]${articleCategory.seoTitle}[#elseif seo.title??][@seo.title?interpret /][/#if][#if systemShowPowered] - Powered By aigechibaole[/#if]</title>
			[#if articleCategory.seoKeywords??]
				<meta name="keywords" content="${articleCategory.seoKeywords}" />
			[#elseif seo.keywords??]
				<meta name="keywords" content="[@seo.keywords?interpret /]" />
			[/#if]
			[#if articleCategory.seoDescription??]
				<meta name="description" content="${articleCategory.seoDescription}" />
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
						[@article_list articleCategoryId = articleCategory.id count = 10 orderBy="hits desc"]
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
							<input type="text" name="keyword" value="${message("shop.article.keyword")}" maxlength="30" />
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
						[@article_category_parent_list articleCategoryId = articleCategory.id]
							[#list articleCategories as articleCategory]
								<li>
									<a href="${base}${articleCategory.path}">${articleCategory.name}</a>
								</li>
							[/#list]
						[/@article_category_parent_list]
						<li class="last">${articleCategory.name}</li>
					</ul>
				</div>
				<form id="articleForm" action="${base}${articleCategory.path}" method="get">
					<input type="hidden" id="pageNumber" name="pageNumber" value="${page.pageNumber}" />
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
							${message("shop.article.noResult")}
						[/#if]
					</div>
					[@pagination pageNumber = page.pageNumber totalPages = page.totalPages pattern = "javascript: $.pageSkip({pageNumber});"]
						[#include "/shop/include/pagination.ftl"]
					[/@pagination]
				</form>
			</div>
		</div>
		[#include "/shop/include/newFooter.ftl" /]
	</body>
	<script type="text/javascript">
		$().ready(function() {
		
			var $articleSearchForm = $("#articleSearchForm");
			var $keyword = $("#articleSearchForm input");
			var $articleForm = $("#articleForm");
			var $pageNumber = $("#pageNumber");
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
			
			$articleForm.submit(function() {
				if ($pageNumber.val() == "" || $pageNumber.val() == "1") {
					$pageNumber.prop("disabled", true)
				}
			});
			
			$.pageSkip = function(pageNumber) {
				$pageNumber.val(pageNumber);
				$articleForm.submit();
				return false;
			}
		
		});
	</script>
</html>