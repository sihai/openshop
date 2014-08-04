[#assign productCategory = product.productCategory /]
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:wb="http://open.weibo.com/wb">
<!--<![endif]-->
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />

    [@seo type = "productContent"]
		<title>[#if product.seoTitle??]${product.seoTitle}[#elseif seo.title??][@seo.title?interpret /][/#if][#if systemShowPowered] - Powered By aigechibaole[/#if]</title>
		[#if product.seoKeywords??]
			<meta name="keywords" content="${product.seoKeywords}" />
		[#elseif seo.keywords??]
			<meta name="keywords" content="[@seo.keywords?interpret /]" />
		[/#if]
		[#if product.seoDescription??]
			<meta name="description" content="${product.seoDescription}" />
		[#elseif seo.description??]
			<meta name="description" content="[@seo.description?interpret /]" />
		[/#if]
	[/@seo]
	
	<meta name="author" content="openteach inc." />
	<meta name="copyright" content="aigechibaole" />
	<link rel="icon" href="${base}/assets/front/images/favicon.ico" type="image/x-icon" />
	<link href="${base}/assets/front/css/detail.main.min.css" rel="stylesheet" type="text/css" />
	<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
	<link href="${base}/resources/shop/css/product.css" rel="stylesheet" type="text/css" />
	
	<link href="${base}/assets/front/css/jquery.bxslider.css" rel="stylesheet" type="text/css" />
	<link href="${base}/resources/shop/css/qq_customer_service.css" rel="stylesheet" type="text/css" />
	
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
	<body class="women " >
		<div id="fb-root"></div>
		<script src="${base}/assets/front/js/browser_detect.js"></script>
		
		<style>
			.bx-wrapper .bx-prev {
				left: 0px;
				background: url(/assets/front/images/controls.png) no-repeat 0 -32px;
				opacity: 1;
			}
	
			.bx-wrapper .bx-next {
				right: 0px;
				background: url(/assets/front/images/controls.png) no-repeat -43px -32px;
				opacity: 1;
			}
		</style>
		
	    [#include "/shop/include/newHeader.ftl" /]
	    [#include "/shop/include/announcement.ftl" /]
	    	
    	<div class="page-container">
    	
    		<!--detail header-->
      		<section class="details-header">
  				<input id="product-id" type="hidden" value="148555467">
  				<section class="product-detail-head">
  				
  					<section class="page-head-top">
						<div id="breadcrumbs" class="breadcrumbs">
      						<ul class="breadcrumb-list" data-gilt-test="text-breadcrumbs">
      							<li class="breadcrumb with-link">
									<a class="breadcrumb-link" href="${base}/">${message("shop.path.home")}</a>/
								</li>
								[@product_category_parent_list productCategoryId = productCategory.id]
									[#list productCategories as productCategory]
										<li class="breadcrumb with-link">
											<a class="breadcrumb-link" href="${base}${productCategory.path}">${productCategory.name}</a>/
										</li>
									[/#list]
								[/@product_category_parent_list]
								
								<li class="breadcrumb with-link">
									<a class="breadcrumb-link" href="${base}${productCategory.path}">${productCategory.name}</a>
								</li>
					
      						</ul>
    					</div>

						<div class="sale-countdown">
      						<div class="sale-countdown-icon"></div>
						    <span class="sale-countdown-label strong"></span>
						    <span class="sale-countdown-interval" data-gilt-test="text-sale-ends"></span>
    					</div><!-- / .sale-countdown -->
  					</section>

				</section>
			</section>
			<!--detail header end-->
			<section id="details" class="details">
				<div class="productContent">
					<div class="productImage">
						[#if product.productImages?has_content]
							<a id="zoom" href="${product.productImages[0].large}" rel="gallery">	
							
								[@review_list productId = product.id count = 5]
								[#if reviews?has_content]
								<div class="reviewFloater nha_large_photo_reviewFloater  fixed_review_container" id="reviewFloater" style="width: 14em; display: block;" data-trans-more="更多内容">
									<div class="carousel-wrapper" style="opacity: .8;">
										<ul class="bxslider">
											
												[#list reviews as review]
													<li>
														<div class="althotelsDiv2 use_sprites_no_back featured_reviewer" style="opacity: 1;">
														<p class="althotelsReview2 fixed_review_height" lang="zh" style="height: 130px;">
															${review.content}
														</p>
														<p class="altHotelsReviewer2" style="">
															<span class="fixed_review_user">
																<strong>评论人</strong>,
																<span class="locality" style="text-transform: capitalize">
																	[#if review.member??]
																		${review.member.username}
																	[#else]
																		${message("shop.product.anonymous")}
																	[/#if]
																</span>
															<br>
															</span>
														</p>
														<div class="icon_user_back_container ">
															<div class="icon_user_back_inverted_border"></div>
															<div class="icon_user_back_ico "></div>
														</div>
													</div>
													</li>
												[/#list]
										</ul>
									
									</div>
								</div>	
								[/#if]
								[/@review_list]			
								
								<img class="medium" src="${product.productImages[0].large}" />
							</a>
						[#else]
							<a id="zoom" href="${setting.defaultLargeProductImage}" rel="gallery">
								<img class="medium" src="${setting.defaultMediumProductImage}"/>
							</a>
						[/#if]
						<a href="javascript:;" class="prev"></a>
						<div id="scrollable" class="scrollable">
							<div class="items">
								[#if product.productImages?has_content]
									[#list product.productImages as productImage]
										<a[#if productImage_index == 0] class="current"[/#if] href="javascript:;" rel="{gallery: 'gallery', smallimage: '${productImage.large}', largeimage: '${productImage.large}'}"><img src="${productImage.thumbnail}" title="${productImage.title}" style="width:80px;height:80px"/></a>
									[/#list]
								[#else]
									<a class="current" href="javascript:;"><img src="${setting.defaultThumbnailProductImage}" style="width:60px;height:60px" /></a>
								[/#if]
							</div>
						</div>
						<a href="javascript:;" class="next"></a>	
					</div>
				</div>
			</section><!-- / .details -->
			
			<section class="details" style="margin-top: 50px;">
				<div class="productContent" style="width:45%;">
					<div class="name">${product.name}[#if product.isGift] [${message("shop.product.gifts")}][/#if]</div>
					<div class="sn">
						<div>${message("Product.sn")}: ${product.sn}</div>
						[#if product.scoreCount > 0]
							<div>${message("Product.score")}:</div>
							<div class="score${(product.score * 2)?string("0")}"></div>
							<div>${product.score?string("0.0")} (${message("Product.scoreCount")}: ${product.scoreCount})</div>
						[/#if]
					</div>
						
					<div class="info">
						[#if product.brand??]
							<dt>${message("Product.brand")}:</dt>
							<dd>
								<a target="_blank" href="${base}${product.brand.path}" title="{product.brand.name}" class="brand-name-text" data-gilt-test="text-favorite-brand"><strong>${abbreviate(product.brand.name, 60)}</strong></a>
							</dd>
						[/#if]
						<dl>
							<dt>${message("Product.price")}:</dt>
							<dd>
								<strong>${currency(product.price, true)}</strong>
								[#if product.marketPrice?has_content]
									${message("Product.marketPrice")}:<del>${currency(product.marketPrice, true)}</del>
								[/#if]
							</dd>
						</dl>
						[#if product.memberPrice?has_content]
							<dl>
								<dt>${message("Product.memberPrice")}:</dt>
								<dd>
									[#list product.memberPrice.keySet() as memberRank]
										${memberRank.name}: <span>${currency(product.memberPrice.get(memberRank), true)}</span>
									[/#list]
								</dd>
							</dl>
						[/#if]
						[#if product.validPromotions?has_content]
							<dl>
								<dt>${message("Product.promotions")}:</dt>
								<dd>
									[#list product.validPromotions as promotion]
										<a href="${base}${promotion.path}" target="_blank" title="${promotion.title}[#if promotion.beginDate?? || promotion.endDate??] (${promotion.beginDate} ~ ${promotion.endDate})[/#if]">${promotion.name}</a>
									[/#list]
								</dd>
							</dl>
						[/#if]
						
						<dl>
							<dt>${message("Product.sales")}:</dt>
							<dd>
								<span>${product.sales}</span>
							</dd>
						</dl>
						<dl>
							<dt>${message("Product.favoriteMembers")}:</dt>
							<dd>
							   <div id = "favCount" />
							</dd>
						</dl>
						
					</div>
				</div>
				<div class="productContent">
					[#if !product.isGift]
						<div class="action">
							[#if product.specifications?has_content]
								<div id="specification" class="specification clearfix">
									<div class="title">${message("shop.product.specificationTitle")}</div>
									[#assign specificationValues = product.goods.specificationValues /]
									[#list product.specifications as specification]
										<dl>
											<dt>
												<span title="${specification.name}">${abbreviate(specification.name, 8)}:</span>
											</dt>
											[#list specification.specificationValues as specificationValue]
												[#if specificationValues?seq_contains(specificationValue)]
													<dd>
														<a href="javascript:;" class="${specification.type}[#if product.specificationValues?seq_contains(specificationValue)] selected[/#if]" val="${specificationValue.id}">[#if specification.type == "text"]${specificationValue.name}[#else]<img src="${specificationValue.image}" alt="${specificationValue.name}" title="${specificationValue.name}" />[/#if]<span title="${message("shop.product.selected")}">&nbsp;</span></a>
													</dd>
												[/#if]
											[/#list]
										</dl>
									[/#list]
								</div>
							[/#if]
							[#if product.isOutOfStock]
								<form id="productNotifyForm" action="${base}/product_notify/save.jhtml" method="post">
									<dl id="productNotify" class="productNotify">
										<dt>${message("shop.product.productNotifyEmail")}:</dt>
										<dd>
											<input type="text" name="email" maxlength="200" />
										</dd>
									</dl>
								</form>
							[#else]
								<dl class="quantity">
									<dt>${message("shop.product.quantity")}:</dt>
									<dd>
										<input type="text" id="quantity" name="quantity" value="1" maxlength="4" onpaste="return false;" />
										<div>
											<span id="increase" class="increase">&nbsp;</span>
											<span id="decrease" class="decrease">&nbsp;</span>
										</div>
									</dd>
									<dd>
										${product.unit!message("shop.product.defaultUnit")}
									</dd>
								</dl>
							[/#if]
							<div class="buy">
								[#if product.isOutOfStock]
									<input type="button" id="addProductNotify" class="addProductNotify" value="${message("shop.product.addProductNotify")}" />
								[#else]
									<!--
									<div>
										<input type="button" id="addCart" class="addCart" value="${message("shop.product.addCart")}" />
									</div>
									<div style="marge-left:20px;">
										<input type="button" id="buyNow"  class="orderNow" value="${message("shop.product.orderNow")}" />
									</div>
									-->
									<div class="tb-action tm-clear ">
										<div class="tb-btn-buy tb-btn-sku">
											<a title="点击此按钮，到下一步确认购买信息。" data-addfastbuy="true" href="#" id="J_LinkBuy">${message("shop.product.orderNow")}<b></b></a>
										</div>
										<div class="tb-btn-basket tb-btn-sku">
											<a id="J_LinkBasket" href="#">${message("shop.product.addCart")}<b></b></a>
										</div>
										<a href="javascript:;" id="addFavorite">${message("shop.product.addFavorite")}</a>
									</div>
								[/#if]
							</div>
							<div class="share">
								<!-- JiaThis Button BEGIN -->
								<div class="jiathis_style_32x32">
									<a class="jiathis_button_qzone"></a>
									<a class="jiathis_button_tsina"></a>
									<a class="jiathis_button_tqq"></a>
									<a class="jiathis_button_weixin"></a>
									<a class="jiathis_button_renren"></a>
									<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
									<a class="jiathis_counter_style"></a>
								</div>
								<!-- JiaThis Button END -->
							</div>
						</div>
					[/#if]
				</div>
			</section><!-- / .summary -->
			
			<section id="description" class="details description">
				<div class="productContent">
					<div id="bar" class="bar">
						<ul style="position: absolute; top: 900px;">
								<li id="introductionTab" class="">
									<a href="#introduction">商品介绍</a>
								</li>
								[#if setting.isReviewEnabled]
								<li id="reviewTab">
									<a href="#review">商品评论</a>
								</li>
								[/#if]
								[#if setting.isConsultationEnabled]								
								<li id="consultationTab">
									<a href="#consultation">商品咨询</a>
								</li>
								[/#if]
						</ul>
					</div>
					
					<div id="introduction" name="introduction" class="introduction">
						<div class="title">
							<strong>${message("shop.product.introduction")}</strong>
						</div>
						<div>
							${product.introduction}
						</div>
					</div>
					
					[#if setting.isReviewEnabled]
						<div id="review" name="review" class="review">
							<div class="title">${message("shop.product.review")}</div>
							<div class="content clearfix">
								[#if product.scoreCount > 0]
									<div class="score">
										<strong>${product.score?string("0.0")}</strong>
										<div>
											<div class="score${(product.score * 2)?string("0")}"></div>
											<div>${message("Product.scoreCount")}: ${product.scoreCount}</div>
										</div>
									</div>
									<div class="graph">
										<span style="width: ${(product.score * 20)?string("0.0")}%">
											<em>${product.score?string("0.0")}</em>
										</span>
										<div>&nbsp;</div>
										<ul>
											<li>${message("shop.product.graph1")}</li>
											<li>${message("shop.product.graph2")}</li>
											<li>${message("shop.product.graph3")}</li>
											<li>${message("shop.product.graph4")}</li>
											<li>${message("shop.product.graph5")}</li>
										</ul>
									</div>
									<div class="handle">
										<a href="${base}/review/add/${product.id}.jhtml" id="addReview">${message("shop.product.addReview")}</a>
									</div>
									[@review_list productId = product.id count = 5]
										[#if reviews?has_content]
											<table>
												[#list reviews as review]this
													<tr>
														<th>
															${review.content}
															<div class="score${(review.score * 2)?string("0")}"></div>
														</th>
														<td>
															[#if review.member??]
																${review.member.username}
															[#else]
																${message("shop.product.anonymous")}
															[/#if]
															<span title="${review.createDate?string("yyyy-MM-dd HH:mm:ss")}">${review.createDate?string("yyyy-MM-dd")}</span>
														</td>
													</tr>
												[/#list]
											</table>
											<p>
												<a href="${base}/review/content/${product.id}.jhtml">[${message("shop.product.viewReview")}]</a>
											</p>
										[/#if]
									[/@review_list]
								[#else]
									<p>
										${message("shop.product.noReview")} <a href="${base}/review/add/${product.id}.jhtml" id="addReview">[${message("shop.product.addReview")}]</a>
									</p>
								[/#if]
							</div>
						</div>
					[/#if]
					
					
					[#if setting.isConsultationEnabled]
						<div id="consultation" name="consultation" class="consultation">
							<div class="title">${message("shop.product.consultation")}</div>
							<div class="content">
								[@consultation_list productId = product.id count = 5]
									[#if consultations?has_content]
										<ul>
											[#list consultations as consultation]
												<li[#if !consultation_has_next] class="last"[/#if]>
													${consultation.content}
													<span>
														[#if consultation.member??]
															${consultation.member.username}
														[#else]
															${message("shop.consultation.anonymous")}
														[/#if]
														<span title="${consultation.createDate?string("yyyy-MM-dd HH:mm:ss")}">${consultation.createDate?string("yyyy-MM-dd")}</span>
													</span>
													[#if consultation.replyConsultations?has_content]
														<div class="arrow"></div>
														<ul>
															[#list consultation.replyConsultations as replyConsultation]
																<li>
																	${replyConsultation.content}
																	<span title="${replyConsultation.createDate?string("yyyy-MM-dd HH:mm:ss")}">${replyConsultation.createDate?string("yyyy-MM-dd")}</span>
																</li>
															[/#list]
														</ul>
													[/#if]
												</li>
											[/#list]
										</ul>
										<p>
											<a href="${base}/consultation/add/${product.id}.jhtml" id="addConsultation">[${message("shop.product.addConsultation")}]</a>
											<a href="${base}/consultation/content/${product.id}.jhtml">[${message("shop.product.viewConsultation")}]</a>
										</p>
									[#else]
										<p>
											${message("shop.product.noConsultation")} <a href="${base}/consultation/add/${product.id}.jhtml" id="addConsultation">[${message("shop.product.addConsultation")}]</a>
										</p>
									[/#if]
								[/@consultation_list]
							</div>
						</div>
					[/#if]
					
				</div>
			</section><!-- / .description -->
    	</div>
    	
    	[#include "/shop/include/newFooter.ftl" /]
    	
    	<script src="${base}/assets/front/js/jquery.bxslider.js"></script>
    	<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"></script>
    	<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1377179211283770" charset="utf-8"></script>

	    <script>
	    	function showTab(id) {
	    		$('.content-container .tab-content').each(function(){
	    			if(this.id == id) {
	    				this.style.display="block";
	    				$('#' + this.id + "-div").addClass("active");
	    			} else {
	    				this.style.display="none";
	    				$('#' + this.id + "-div").removeClass("active");
	    			}
	    		});
	    	}
	    	
	    	$().ready(function() {
	    	
	    		showTab('content-detail');
	    		
	    		var $historyProduct = $("#historyProduct ul");
				var $clearHistoryProduct = $("#clearHistoryProduct");
				var $zoom = $("#zoom");
				var $scrollable = $("#scrollable");
				var $thumbnail = $("#scrollable a");
				var $specification = $("#specification dl");
				var $specificationTitle = $("#specification div");
				var $specificationValue = $("#specification a");
				var $productNotifyForm = $("#productNotifyForm");
				var $productNotify = $("#productNotify");
				var $productNotifyEmail = $("#productNotify input");
				var $addProductNotify = $("#addProductNotify");
				var $quantity = $("#quantity");
				var $increase = $("#increase");
				var $decrease = $("#decrease");
				var $addCart = $("#J_LinkBasket");
				var $buyNow = $("#J_LinkBuy");
				var $addFavorite = $("#addFavorite");
				var $showFavorite = $("#showFavorite");
				var $window = $(window);
				var $introductionTab = $("#introductionTab");
				var $parameterTab = $("#parameterTab");
				var $reviewTab = $("#reviewTab");
				var $consultationTab = $("#consultationTab");
				var $introduction = $("#introduction");
				var $parameter = $("#parameter");
				var $review = $("#review");
				var $addReview = $("#addReview");
				var $consultation = $("#consultation");
				var $addConsultation = $("#addConsultation");
				var productMap = {};
				[@compress single_line = true]
					productMap[${product.id}] = {
						path: null,
						specificationValues: [
							[#list product.specificationValues as specificationValue]
								"${specificationValue.id}"[#if specificationValue_has_next],[/#if]
							[/#list]
						]
					};
					[#list product.siblings as product]
						productMap[${product.id}] = {
							path: "${product.path}",
							specificationValues: [
								[#list product.specificationValues as specificationValue]
									"${specificationValue.id}"[#if specificationValue_has_next],[/#if]
								[/#list]
							]
						};
					[/#list]
				[/@compress]
				
				// 锁定规格值
				lockSpecificationValue();
				
				// 商品图片放大镜
				/*
				$zoom.jqzoom({
					zoomWidth: 368,
					zoomHeight: 368,
					title: false,
					showPreload: false,
					preloadImages: false
				});
				*/
			//	// 商品缩略图滚动
				$scrollable.scrollable();
				
				$thumbnail.hover(function() {
					var $this = $(this);
					if ($this.hasClass("current")) {
						return false;
					} else {
						$thumbnail.removeClass("current");
						$this.addClass("current");
						var thumb_options = $.extend({}, eval("(" + $.trim($this.attr('rel')) + ")"));
						$(".medium").attr('src', thumb_options.largeimage);
					}
				});
				
				$('.bxslider').bxSlider({
				  	mode: 'fade',
				  	captions: true,
				  	auto: true
				});
				
				// 规格值选择
				$specificationValue.click(function() {
					var $this = $(this);
					if ($this.hasClass("locked")) {
						return false;
					}
					$this.toggleClass("selected").parent().siblings().children("a").removeClass("selected");
					var selectedIds = new Array();
					$specificationValue.filter(".selected").each(function(i) {
						selectedIds[i] = $(this).attr("val");
					});
					var locked = true;
					$.each(productMap, function(i, product) {
						if (product.specificationValues.length == selectedIds.length && contains(product.specificationValues, selectedIds)) {
							if (product.path != null) {
								location.href = "${base}" + product.path;
								locked = false;
							}
							return false;
						}
					});
					if (locked) {
						lockSpecificationValue();
					}
					$specificationTitle.hide();
					return false;
				});
				
				// 锁定规格值
				function lockSpecificationValue() {
					var selectedIds = new Array();
					$specificationValue.filter(".selected").each(function(i) {
						selectedIds[i] = $(this).attr("val");
					});
					$specification.each(function() {
						var $this = $(this);
						var selectedId = $this.find("a.selected").attr("val");
						var otherIds = $.grep(selectedIds, function(n, i) {
							return n != selectedId;
						});
						$this.find("a").each(function() {
							var $this = $(this);
							otherIds.push($this.attr("val"));
							var locked = true;
							$.each(productMap, function(i, product) {
								if (contains(product.specificationValues, otherIds)) {
									locked = false;
									return false;
								}
							});
							if (locked) {
								$this.addClass("locked");
							} else {
								$this.removeClass("locked");
							}
							otherIds.pop();
						});
					});
				}
				
				// 判断是否包含
				function contains(array, values) {
					var contains = true;
					for(i in values) {
						if ($.inArray(values[i], array) < 0) {
							contains = false;
							break;
						}
					}
					return contains;
				}
				
				// 到货通知
				$addProductNotify.click(function() {
					[#if product.specifications?has_content]
						var specificationValueIds = new Array();
						$specificationValue.filter(".selected").each(function(i) {
							specificationValueIds[i] = $(this).attr("val");
						});
						if (specificationValueIds.length != ${product.specificationValues?size}) {
							$specificationTitle.show();
							return false;
						}
					[/#if]
					if ($addProductNotify.val() == "${message("shop.product.addProductNotify")}") {
						$addProductNotify.val("${message("shop.product.productNotifySubmit")}");
						$productNotify.show();
						$productNotifyEmail.focus();
						if ($.trim($productNotifyEmail.val()) == "") {
							$.ajax({
								url: "${base}/product_notify/email.jhtml",
								type: "GET",
								dataType: "json",
								cache: false,
								success: function(data) {
									$productNotifyEmail.val(data.email);
								}
							});
						}
					} else {
						$productNotifyForm.submit();
					}
					return false;
				});
				
				// 到货通知表单验证
				$productNotifyForm.validate({
					rules: {
						email: {
							required: true,
							email: true
						}
					},
					submitHandler: function(form) {
						$.ajax({
							url: "${base}/product_notify/save.jhtml",
							type: "POST",
							data: {productId: ${product.id}, email: $productNotifyEmail.val()},
							dataType: "json",
							cache: false,
							beforeSend: function() {
								$addProductNotify.prop("disabled", true);
							},
							success: function(data) {
								if (data.message.type == "success") {
									$addProductNotify.val("${message("shop.product.addProductNotify")}");
									$productNotify.hide();
								}
								$.message(data.message);
							},
							complete: function() {
								$addProductNotify.prop("disabled", false);
							}
						});
					}
				});
				
				// 购买数量
				$quantity.keypress(function(event) {
					var key = event.keyCode ? event.keyCode : event.which;
					if ((key >= 48 && key <= 57) || key==8) {
						return true;
					} else {
						return false;
					}
				});
				
				// 增加购买数量
				$increase.click(function() {
					var quantity = $quantity.val();
					if (/^\d*[1-9]\d*$/.test(quantity)) {
						$quantity.val(parseInt(quantity) + 1);
					} else {
						$quantity.val(1);
					}
				});
				
				// 减少购买数量
				$decrease.click(function() {
					var quantity = $quantity.val();
					if (/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 1) {
						$quantity.val(parseInt(quantity) - 1);
					} else {
						$quantity.val(1);
					}
				});
				
				// 加入购物车
				$addCart.click(function() {
					[#if product.specifications?has_content]
						var specificationValueIds = new Array();
						$specificationValue.filter(".selected").each(function(i) {
							specificationValueIds[i] = $(this).attr("val");
						});
						if (specificationValueIds.length != ${product.specificationValues?size}) {
							$specificationTitle.show();
							return false;
						}
					[/#if]
					var quantity = $quantity.val();
					if (/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 0) {
						$.ajax({
							url: "${base}/cart/add.jhtml",
							type: "POST",
							data: {id: ${product.id}, quantity: quantity},
							dataType: "json",
							cache: false,
							success: function(message) {
								var o = $("#J_MiniCartNum").text();
								var n = parseInt(o) + parseInt(quantity);
								$("#J_MiniCartNum").text(" " + n);
								$.message(message);
							}
						});
					} else {
						$.message("warn", "${message("shop.product.quantityPositive")}");
					}
				});
				
				
				$buyNow.click(function() {
					[#if product.specifications?has_content]
						var specificationValueIds = new Array();
						$specificationValue.filter(".selected").each(function(i) {
							specificationValueIds[i] = $(this).attr("val");
						});
						if (specificationValueIds.length != ${product.specificationValues?size}) {
							$specificationTitle.show();
							return false;
						}
					[/#if]
					var quantity = $quantity.val();
					if (/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 0) {
						$.ajax({
							url: "${base}/cart/add.jhtml",
							type: "POST",
							data: {id: ${product.id}, quantity: quantity},
							dataType: "json",
							cache: false,
							success: function(message) {
								window.location.href ="${base}/cart/list.jhtml";
							}
						});
					} else {
						$.message("warn", "${message("shop.product.quantityPositive")}");
					}
				});
				
				// 添加商品收藏
				$addFavorite.click(function() {
					$.ajax({
						url: "${base}/member/favorite/add.jhtml?id=${product.id}",
						type: "POST",
						dataType: "json",
						cache: false,
						success: function(message) {
							$.message(message);
						}
					});
					return false;
				});
				
				
				[#if setting.isReviewEnabled && setting.reviewAuthority != "anyone"]
					// 发表商品评论
					$addReview.click(function() {
						if ($.checkLogin()) {
							return true;
						} else {
							$.redirectLogin("${base}/review/add/${product.id}.jhtml", "${message("shop.product.addReviewNotAllowed")}");
							return false;
						}
					});
				[/#if]
				
				[#if setting.isConsultationEnabled && setting.consultationAuthority != "anyone"]
					// 发表商品咨询
					$addConsultation.click(function() {
						if ($.checkLogin()) {
							return true;
						} else {
							$.redirectLogin("${base}/consultation/add/${product.id}.jhtml", "${message("shop.product.addConsultationNotAllowed")}");
							return false;
						}
					});
				[/#if]
				
				// 浏览记录
				var historyProduct = getCookie("historyProduct");
				var historyProductIds = historyProduct != null ? historyProduct.split(",") : new Array();
				for (var i = 0; i < historyProductIds.length; i ++) {
					if (historyProductIds[i] == "${product.id}") {
						historyProductIds.splice(i, 1);
						break;
					}
				}
				historyProductIds.unshift("${product.id}");
				if (historyProductIds.length > 6) {
					historyProductIds.pop();
				}
				addCookie("historyProduct", historyProductIds.join(","), {path: "${base}/"});
				$.ajax({
					url: "${base}/product/history.jhtml",
					type: "GET",
					data: {ids: historyProductIds},
					dataType: "json",
					traditional: true,
					cache: false,
					success: function(data) {
						$.each(data, function (index, product) {
							var thumbnail = product.thumbnail != null ? product.thumbnail : "${setting.defaultThumbnailProductImage}";
							$historyProduct.append('<li><img src="' + thumbnail + '" \/><a href="${base}' + product.path + '">' + product.name + '<\/a><span>' + currency(product.price, true) + '<\/span><\/li>');
						});
					}
				});
				
				// 清空浏览记录
				$clearHistoryProduct.click(function() {
					$historyProduct.empty();
					$(this).text("${message("shop.product.noHistoryProduct")}");
					removeCookie("historyProduct", {path: "${base}/"});
				});
				
				// 点击数
				$.ajax({
					url: "${base}/product/hits/${product.id}.jhtml",
					type: "GET"
				});
				
				//fav count
				
				$.ajax({
					url: "${base}/product/favours/${product.id}.jhtml",
					type: "POST",
					dataType: "json",
					cache: false,
					success: function(message) {
						$("#favCount").text(message);
					}
				});
				
			});
	    </script>
	</body>
</html>