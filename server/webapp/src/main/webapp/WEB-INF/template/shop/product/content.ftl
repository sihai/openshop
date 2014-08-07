<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html>
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta property="qc:admins" content="3275546717611753012174563757" />
		<meta property="wb:webmaster" content="955a134bdab20b26" />
		[@seo type = "index"]
			<title>[#if seo.title??][@seo.title?interpret /][#else]${message("shop.index.title")}[/#if][#if systemShowPowered] - Powered By openteach inc.[/#if]</title>
			[#if seo.keywords??]
				<meta name="keywords" content="[@seo.keywords?interpret /]" />
			[/#if]
			[#if seo.description??]
				<meta name="description" content="[@seo.description?interpret /]" />
			[/#if]
		[/@seo]

		[#include "/shop/include/metaAndcss.ftl" /]
		
		<link href="${base}/assets/v2/shop/css/detail.css" rel="stylesheet" type="text/css" />
		
	</head>
	
	<body>
	
		<div class="page">
			[#include "/shop/include/simpleHeader.ftl" /]
			
			<div class="content">
			
				<div class="block">
					<div class="title">
						<div class="title_head"></div>
						<a style="margin-left:20px;" href="#"><strong>${product.name}</strong></a>
					</div>
					
					<div class="body">
						
						<div class="product-info">
							<div class="product-head">
								<table>
									<tr>
										<td style="">
											<div style="width:600px;">
												<div class="pic_viewer">
													[#if product.productImages?has_content]
														<img class="big_img lazy_img" src="${base}/assets/front/images/spacer.gif" data-img-src="${product.productImages[0].large}"/>
													[#else]
														<img class="big_img lazy_img" src="${base}/assets/front/images/spacer.gif" data-img-src="${setting.defaultMediumProductImage}"/>
													[/#if]
													<div class="thumbnails">
														[#if product.productImages?has_content]
															[#list product.productImages as productImage]
																<img class="lazy_img" src="${base}/assets/front/images/spacer.gif" data-img-src="${productImage.thumbnail}" title="${productImage.title}"></img>
															[/#list]
														[#else]
															<img class="lazy_img" src="${base}/assets/front/images/spacer.gif" data-img-src="${setting.defaultThumbnailProductImage}" title="${productImage.title}"></img>
														[/#if]
													</div>
												</div>
											</div>
										</td>
										<td style="width:20px;">
										</td>
										<td style="vertical-align:top;width:400px;">
											<div class="product-price">
												
												<dl class="tm-promo-panel tm-promo-cur" id="J_PromoPrice" data-label="${message("Product.price")}">
													<dt class="tb-metatit">${message("Product.price")}:</dt>
													<dd>
														<div class="tm-promo-price">
															<em class="tm-yen"></em>
															<span class="tm-price">${currency(product.price, true)}</span>&nbsp;&nbsp;
														</div>
														<p></p>
													</dd>
												</dl>
												[#if product.marketPrice?has_content]
													<dl class="tm-price-panel" id="J_StrPriceModBox">
	        											<dt class="tb-metatit" style="margin-top: 6px;">${message("Product.marketPrice")}:</dt>
	        											<dd><em class="tm-yen"></em> <span class="tm-price invalid-price">${currency(product.marketPrice, true)}</span></dd>
	    											</dl>
	    										[/#if]
    
												<!--
												<span style="margin-top:180px; margin-left:60px;"><font color="#FFFFFF">${currency(product.price, true)}</font></span>
												<br/>
												[#if product.marketPrice?has_content]
													<span style="margin-top:180px; margin-left:60px;"><font color="#000000">${currency(product.marketPrice, true)}</font></span>
												[/#if]
												-->
											</div>
											<div class="product-appraise">
												<table style="height:100%;width:100%;">
													<tr>
														<td style="vertical-align:middle;">
															<span style="margin-left:10px;"><font color="#FDA617">用户评价：</font> [#if product.scoreCount > 0] <div class="score${(product.score * 2)?string("0")}"></div>[/#if]</span>
														</td>
														<td style="vertical-align:middle;">
															<span style="float:right;margin-right:10px;"><a href="#"><font color="#FDA617">我要评价</font></a></span>
														</td>
													</tr>
												</table>
												
											</div>
											<div class="product-info">
												<table style="height:100%;width:100%;text-align:left;">
													<tr>
														<td style="width:100px;"><span><strong><font color="#FDA617">名称：</font></strong></span></td>
														<td>${product.name}[#if product.isGift] [${message("shop.product.gifts")}][/#if]</td>
													</tr>
													<tr style="height:20px;">
														<td></td>
														<td></td>
													</tr>
													<tr>
														<td style="width:100px;"><span><strong><font color="#FDA617">已抢购：</font></strong></span></td>
														<td>${product.sales}</td>
													</tr>
													<tr style="height:20px;">
														<td></td>
														<td></td>
													</tr>
													<tr>
														<td style="width:100px;"><span><strong><font color="#FDA617">简介：</font></strong></span></td>
														<td>
															<span>
																${product.memo}
															</span>
														</td>
													</tr>
												</table>
											</div>
											
											<div class="product-operation">
												<table>
													<tr>
														<td colspan="4">
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
														</td>
													<tr>
													<tr>
														<td colspan="4" style="height:20px;">
														</td>
													<tr>
													<tr>
														<td>
															<input type="text" id="number" name="number" style="height:52px;width:180px;line-height:52px;font-size:52px; border:1px solid #FDA617;" value="1" />
														</td>
														<td>
															<button id="add" name="add" class="add-0" />
															<button id="sub" name="sub" class="sub-0" />
														</td>
														<td>
														</td>
														<td>
															<button id="add-2-cart" name="add-2-cart" class="add-2-cart"/>
														</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
								</table>
							</div>
							
							<div class="product-body">
								<div class="body-tab">
									<div>
										<div class="title_head"></div>
										<span class="tab-span">
											<a href="#" class="tab_item current-tab" detail-id="desc"><strong>商品介绍</strong></a>
										</span>
										<span class="tab-span">
											<a href="#" class="tab_item" detail-id="appraise"><strong>商品评论</strong></a>
										</span>
										<span class="tab-span">
											<a href="#" class="tab_item" detail-id="advisory"><strong>商品咨询</strong></a>
										</span>
										<div style="float:right;margin-right:20px;">
											<a href="#"><img src="${base}/assets/v2/shop/images/sushi.png"></img></a>
											<a href="#"><img src="${base}/assets/v2/shop/images/cocktail.png"></img></a>
											<a href="#"><img src="${base}/assets/v2/shop/images/yatch.png"></img></a>
										</div>
									</div>
								</div>
								<div class="body-detail">
									<div id="desc" class="detail current-detail">
										<span>
											${product.introduction}
										</span>
									</div>
									<div id="appraise" class="detail" style="display:none;">
										<span>
											
										</span>
									</div>
									<div id="advisory" class="detail" style="display:none;">
										<span>
											
										</span>
										
									</div>
								</div>
							</div>
							
							<div class="product-related">
								<div class="body-tab">
									<div>
										<div class="title_head"></div>
										<a style="margin-left:20px;" href="#"><strong>相关商品</strong></a>
										<!--
										<div style="float:right;margin-right:20px;">
											<a href="#"><img src="assets/shop/images/sushi.png"></img></a>
											<a href="#"><img src="assets/shop/images/cocktail.png"></img></a>
											<a href="#"><img src="assets/shop/images/yatch.png"></img></a>
										</div>
										-->
									</div>
								</div>
								<div class="body-detail">
									
									<div class="view grid-nosku view-noCom" id="J_ItemList" data-spm="a220m.1000858.1000725" data-area="杭州" data-atp-a="{p},{id},,,spu,1,spu,{user_id}" data-atp-b="{p},{id},,,spu,2,spu,{user_id}" data-spm-max-idx="312">
										[@related_product_list productId = product.id count = 6]
											[#list products as product]
												<div class="product">
													<div class="product-iWrap">
			 											<div class="productImg-wrap">
			 												<a target="_blank" href="${base}${product.path}" >
																<img class="product_img lazy_img" src="${base}/assets/front/images/spacer.gif" data-img-src="[#if product.image??]${product.image}[#else]${setting.defaultThumbnailProductImage}[/#if]" />
															</a>
															<a class="j_ProductPin productPin"><span>钉一下已钉住</span></a>
			 											</div>
			 											
			 											<p class="productPrice">
															<a href="${base}${product.path}" class="tag" target="_blank"><img src="http://gtms04.alicdn.com/tps/i4/T13XGKFD8cXXbSBwfc-30-30.png" title="天猫电器城认证"></a>
															<em title="${currency(product.price, true)}"><b></b>${currency(product.price, true)}</em>
															<del>${currency(product.marketPrice, true)}</del>
														</p>
														
														<p class="productTitle">
															<a href="${base}${product.path}" target="_blank" title="${product.name}" ><span class="H">${abbreviate(product.name, 24)}</span></a>
														</p>
														
														<div class="productShop" data-atp="b!1-3,{user_id},,,,,,">
															<span>正宗四川美味，值得推荐，买了不后悔，后悔没买</span>
														</div>
														
														<p class="productStatus">
															<span>该款月成交 <em>4025笔</em></span>
															<span class="no-right-border">好评数/总评数 <em>4025/5000</em></span>
														</p>
				 									</div>
												</div>
											[/#list]
										[/@related_product_list]
									</div>
									
									
								</div>
							</div>
							
						</div>
						
						
					</div>
				</div>	
			</div>
			
			[#include "/shop/include/newFooterV2.ftl" /]
		</div>
	</body>
	
	<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
	<script type="text/javascript" src="${base}/resources/shop/js/jquery.tools.js"></script>
	<script type="text/javascript" src="${base}/resources/shop/js/jquery.validate.js"></script>
	<script type="text/javascript" src="${base}/resources/shop/js/jquery.lSelect.js"></script>
	<script type="text/javascript" src="${base}/resources/shop/js/jquery.rating.js"></script>
	<script type="text/javascript" src="${base}/resources/shop/js/jquery.lazyload.js"></script>
	<script type="text/javascript" src="${base}/resources/shop/js/jquery.uuid.js"></script>
	<script type="text/javascript" src="${base}/resources/shop/js/jquery.emptyValue.js"></script>
	<script type="text/javascript" src="${base}/resources/shop/js/jsbn.js"></script>
	<script type="text/javascript" src="${base}/resources/shop/js/prng4.js"></script>
	<script type="text/javascript" src="${base}/resources/shop/js/rng.js"></script>
	<script type="text/javascript" src="${base}/resources/shop/js/rsa.js"></script>
	<script type="text/javascript" src="${base}/resources/shop/js/base64.js"></script>
	
	<script type="text/javascript">
		var captchaId = jQuery.uuid();
		var baseURL = '${base}';
		var productId = ${product.id};
		var quantityPositive = '${message("shop.product.quantityPositive")}';
	</script>
	
	<script type="text/javascript" src="${base}/assets/v2/shop/js/base.js"></script>
	<script type="text/javascript" type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
	<script type="text/javascript" src="${base}/assets/v2/shop/js/detail.js"></script>
	
	<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1377179211283770" charset="utf-8"></script>
</html>