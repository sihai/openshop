[#assign current = "couponCodeList" /]
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>${message("shop.member.couponCode.list")}[#if systemShowPowered] - Powered By openteach inc.[/#if]</title>
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
					<div class="title">${message("shop.member.couponCode.list")}</div>
					<table class="list">
						<tr>
							<th>
								${message("shop.member.couponCode.name")}
							</th>
							<th>
								${message("CouponCode.code")}
							</th>
							<th>
								${message("CouponCode.isUsed")}
							</th>
							<th>
								${message("CouponCode.usedDate")}
							</th>
							<th>
								${message("shop.member.couponCode.expire")}
							</th>
						</tr>
						[#list page.content as couponCode]
							<tr[#if !couponCode_has_next] class="last"[/#if]>
								<td>
									${couponCode.coupon.name}
								</td>
								<td>
									${couponCode.code}
								</td>
								<td>
									${couponCode.isUsed?string(message("shop.member.true"), message("shop.member.false"))}
								</td>
								<td>
									[#if couponCode.usedDate??]
										<span title="${couponCode.usedDate?string("yyyy-MM-dd HH:mm:ss")}">${couponCode.usedDate}</span>
									[#else]
										-
									[/#if]
								</td>
								<td>
									[#if couponCode.coupon.endDate??]
										<span title="${couponCode.coupon.endDate?string("yyyy-MM-dd HH:mm:ss")}">${couponCode.coupon.endDate}</span>
									[#else]
										-
									[/#if]
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
		$().ready(function() {<div id="fb-root"></div>
		<script src="${base}/assets/front/js/browser_detect.js"></script>
		
	    [#include "/shop/include/newHeader.ftl" /]
	    [#include "/shop/include/announcement.ftl" /]
			
			[@flash_message /]
		
		});
	</script>
</html>