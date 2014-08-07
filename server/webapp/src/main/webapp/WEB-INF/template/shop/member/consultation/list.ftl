[#assign current = "consultationList" /]
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>${message("shop.member.consultation.list")}[#if systemShowPowered] - Powered By openteach inc.[/#if]</title>
		[#include "/shop/include/metaAndcss.ftl" /]
		<link href="${base}/resources/shop/css/member.css" rel="stylesheet" type="text/css" />

	</head>
	<body class="women ">
	
		<div id="fb-root"></div>
		<script src="${base}/assets/front/js/browser_detect.js"></script>
		
	    [#include "/shop/include/newHeader.ftl" /]
	    [#include "/shop/include/announcement.ftl" /]
	    
		<div class="container member">
			[#include "/shop/member/include/navigation.ftl" /]
			<div class="span18 last">
				<div class="list">
					<div class="title">${message("shop.member.consultation.list")}</div>
					<table class="list">
						<tr>
							<th>
								${message("shop.member.consultation.productImage")}
							</th>
							<th>
								${message("Consultation.product")}
							</th>
							<th>
								${message("shop.common.createDate")}
							</th>
						</tr>
						[#list page.content as consultation]
							<tr[#if !consultation_has_next] class="last"[/#if]>
								<td>
									<img src="[#if consultation.product.thumbnail??]${consultation.product.thumbnail}[#else]${setting.defaultThumbnailProductImage}[/#if]" class="thumbnail" alt="${consultation.product.name}" />
								</td>
								<td>
									<a href="${base}${consultation.product.path}#consultation" title="${consultation.product.name}" target="_blank">${abbreviate(consultation.product.name, 30)}</a>
								</td>
								<td>
									<span title="${consultation.createDate?string("yyyy-MM-dd HH:mm:ss")}">${consultation.createDate}</span>
								</td>
							</tr>
						[/#list]
					</table>
					[#if !page.content?has_content]
						<p>${message("shop.member.noResult")}</p>
					[/#if]
				</div>
				[@pagination pageNumber = page.pageNumber totalPages = page.totalPages pattern = "?pageNumber={pageNumber}"]
					[#include "/shop/include/pagination.ftl"]
				[/@pagination]
			</div>
		</div>
		[#include "/shop/include/newFooter.ftl" /]
	</body>
	<script type="text/javascript">
		$().ready(function() {
			
			[@flash_message /]
		
		});
	</script>
</html>