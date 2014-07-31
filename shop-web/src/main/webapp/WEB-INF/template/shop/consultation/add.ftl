<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>${product.name} ${message("shop.consultation.title")}[#if systemShowPowered] - Powered By aigechibaole[/#if]</title>
		[#include "/shop/include/metaAndcss.ftl" /]
		<link href="${base}/resources/shop/css/product.css" rel="stylesheet" type="text/css" />
		<link href="${base}/resources/shop/css/consultation.css" rel="stylesheet" type="text/css" />
		
	</head>
	<body class="women ">
		<div id="fb-root"></div>
		<script src="${base}/assets/front/js/browser_detect.js"></script>
		
	    [#include "/shop/include/newHeader.ftl" /]
	    [#include "/shop/include/announcement.ftl" /]
	    
		<div class="container consultation">
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
							<a href="${base}${product.path}">${abbreviate(product.name, 30)}</a>
						</li>
						<li>${message("shop.consultation.title")}</li>
					</ul>
				</div>
				<table class="info">
					<tr>
						<th rowspan="3">
							<img src="[#if product.thumbnail??]${product.thumbnail}[#else]${setting.defaultThumbnailProductImage}[/#if]" alt="${product.name}" />
						</th>
						<td>
							<a href="${base}${product.path}">${abbreviate(product.name, 60, "...")}</a>
						</td>
					</tr>
					<tr>
						<td>
							${message("Product.price")}: <strong>${currency(product.price, true, true)}</strong>
						</td>
					</tr>
					<tr>
						<td>
							[#if product.scoreCount > 0]
								<div>${message("Product.score")}: </div>
								<div class="score${(product.score * 2)?string("0")}"></div>
								<div>${product.score?string("0.0")}</div>
							[#else]
								[#if setting.isShowMarketPrice]
									${message("Product.marketPrice")}:
									<del>${currency(product.marketPrice, true, true)}</del>
								[/#if]
							[/#if]
						</td>
					</tr>
				</table>
				<form id="consultationForm" action="${base}/consultation/save.jhtml" method="post">
					<input type="hidden" name="id" value="${product.id}" />
					[#if setting.captchaTypes?? && setting.captchaTypes?seq_contains("consultation")]
						<input type="hidden" name="captchaId" value="${captchaId}" />
					[/#if]
					<div class="add">
						<table>
							<tr>
								<th>
									${message("Consultation.content")}:
								</th>
								<td>
									<textarea id="content" name="content" class="text"></textarea>
								</td>
							</tr>
							[#if setting.captchaTypes?? && setting.captchaTypes?seq_contains("consultation")]
								<tr>
									<th>
										${message("shop.captcha.name")}:
									</th>
									<td>
										<span class="fieldSet">
											<input type="text" id="captcha" name="captcha" class="text captcha" maxlength="4" autocomplete="off" /><img id="captchaImage" class="captchaImage" src="${base}/common/captcha.jhtml?captchaId=${captchaId}" title="${message("shop.captcha.imageTitle")}" />
										</span>
									</td>
								</tr>
							[/#if]
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									<input type="submit" class="button" value="${message("shop.consultation.submit")}" />
								</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
		[#include "/shop/include/newFooter.ftl" /]
	</body>
	<script type="text/javascript">
		$().ready(function() {
		
			var $consultationForm = $("#consultationForm");
			var $content = $("#content");
			var $captcha = $("#captcha");
			var $captchaImage = $("#captchaImage");
			var $submit = $(":submit");
			
			// 更换验证码
			$captchaImage.click(function() {
				$captchaImage.attr("src", "${base}/common/captcha.jhtml?captchaId=${captchaId}&timestamp=" + (new Date()).valueOf());
			});
			
			// 表单验证
			$consultationForm.validate({
				rules: {
					content: {
						required: true,
						maxlength: 200
					},
					captcha: "required"
				},
				submitHandler: function(form) {
					$.ajax({
						url: $consultationForm.attr("action"),
						type: "POST",
						data: $consultationForm.serialize(),
						dataType: "json",
						cache: false,
						beforeSend: function() {
							$submit.prop("disabled", true);
						},
						success: function(message) {
							$.message(message);
							if (message.type == "success") {
								setTimeout(function() {
									$submit.prop("disabled", false);
									location.href = "../content/${product.id}.jhtml";
								}, 3000);
							} else {
								$submit.prop("disabled", false);
								[#if setting.captchaTypes?? && setting.captchaTypes?seq_contains("consultation")]
									$captcha.val("");
									$captchaImage.attr("src", "${base}/common/captcha.jhtml?captchaId=${captchaId}&timestamp=" + (new Date()).valueOf());
								[/#if]
							}
						}
					});
				}
			});
		
		});
	</script>
</html>