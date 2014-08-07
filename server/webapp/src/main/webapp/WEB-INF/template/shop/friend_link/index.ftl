<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>${message("shop.friendLink.title")}[#if systemShowPowered] - Powered By openteach inc.[/#if]</title>
		[#include "/shop/include/metaAndcss.ftl" /]
		<link href="${base}/resources/shop/css/article.css" rel="stylesheet" type="text/css" />
		<link href="${base}/resources/shop/css/friend_link.css" rel="stylesheet" type="text/css" />
	
	</head>
	<body class="women ">
	
		<div id="fb-root"></div>
		<script src="${base}/assets/front/js/browser_detect.js"></script>
		
	    [#include "/shop/include/newHeader.ftl" /]
	    [#include "/shop/include/announcement.ftl" /]
	    
		<div class="container friendLink">
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
						<li class="last">${message("shop.friendLink.title")}</li>
					</ul>
				</div>
				[#if imageFriendLinks?has_content]
					<div class="list clearfix">
						<ul>
							[#list imageFriendLinks as friendLink]
								<li>
									<a href="${friendLink.url}" target="_blank">
										<img src="${friendLink.logo}" alt="${friendLink.name}" title="${friendLink.name}" />
									</a>
								</li>
							[/#list]
						</ul>
					</div>
				[/#if]
				[#if textFriendLinks?has_content]
					<div class="list clearfix">
						<ul>
							[#list textFriendLinks as friendLink]
								<li>
									<a href="${friendLink.url}" target="_blank">${friendLink.name}</a>
								</li>
							[/#list]
						</ul>
					</div>
				[/#if]
			</div>
		</div>
		[#include "/shop/include/newFooter.ftl" /]
	</body>
	<script type="text/javascript">
		$().ready(function() {
		
			var $articleSearchForm = $("#articleSearchForm");
			var $keyword = $("#articleSearchForm input");
			var $logo = $("#result img");
			var defaultKeyword = $keyword.val();
			
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