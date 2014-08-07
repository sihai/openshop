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
		
		<link href="${base}/assets/v2/shop/css/index.css" rel="stylesheet" type="text/css" />
		
	</head>
	
	<body>
	
		<div class="page">
			[#include "/shop/include/newHeaderV2.ftl" /]
			
			<div class="content">
			
				
				
				<!- 推荐 -->
				<div class="block">
					<div class="title">
						<div class="title_head"></div>
						<a style="margin-left:20px;" href="#"><strong>本期推荐</strong></a>
						<div style="float:right;margin-right:20px;">
							<a href="#"><img src="${base}/assets/v2/shop/images/sushi.png"></img></a>
							<a href="#"><img src="${base}/assets/v2/shop/images/cocktail.png"></img></a>
							<a href="#"><img src="${base}/assets/v2/shop/images/yatch.png"></img></a>
						</div>
					</div>
					<div class="body">
					
						<ul class="product-list" id="product-list">
							[@product_list productCategoryId = currentRootCategory.id count = 128]
								[#list products as product]
									<li id="${product.id}">
							        	<div class="img_b">
							            	<a href="${base}${product.path}" target="_blank">
							            		<img class="big-img lazy_img" src="${base}/assets/front/images/spacer.gif" data-img-src="[#if product.image??]${product.image}[#else]${setting.defaultThumbnailProductImage}[/#if]">
							            	</a>
							                <div class="simg_lst" [#if product.productImages?has_content] count="${product.productImages.size()}" [#else] count="1" [/#if]>
						                		<ul style="width: 291px;">
						                			[#if product.productImages?has_content]
														[#list product.productImages as productImage]
															<li>
																<img class="lazy_img" src="${base}/assets/front/images/spacer.gif" data-img-src="${productImage.thumbnail}" big-img-src="${productImage.large}" title="${productImage.title}"></img>
															</li>
														[/#list]
													[#else]
														<li>
															<img class="lazy_img" src="${base}/assets/front/images/spacer.gif" data-img-src="${setting.defaultThumbnailProductImage}" title="${productImage.title}"></img>
														</li>
													[/#if]
						                    	</ul>
							                </div>
							                <div class="s_img_lst_l"></div>
							                <div class="s_img_lst_r"></div>
							                <div class="t_bg"></div>
							                <div class="icon new"></div>
							            </div>
							            <div class="img_tit">
							                <span class="img_p">${message("Product.price")}：<span class="n">${currency(product.price, true)}</span></span>            
							                <span class="img_t"><a href="${base}${product.path}" target="_blank" title="${product.name}">${abbreviate(product.name, 24)}</a></span>
							                <span class="img_c"><i class="icon"></i></span>
							                
							            </div>
							            <div class="img_info">
							            	<p>
							            		<span id="apply_num_1" style="color:#000; font-family:Microsoft YaHei; font-weight:bold; font-size:14px; float:right; padding-right:25px;">${message("Product.sales")}：${product.sales}</span>
							            		<span style="color:#000; font-family:Microsoft YaHei; font-weight:bold; font-size:14px;">${message("Product.stock")}：${product.stock}</span>
							            	</p>
							                <p>
							                	<span class="label2">推荐理由： </span>
							                	<span class="w2">${abbreviate(product.recommendReason, 64)}</span>
							                </p>
							                <p><a class="btnbuy" href="#" target="_blank">加入购物车</a></p>
							            </div>
							                
							        </li>
								[/#list]
							[/@product_list]
					        
					    </ul>
					</div>	
				</div>
				
				
				<!- about -->
				<div class="block">
					<div class="title">
						<div class="title_head"></div>
						<a style="margin-left:20px;" href="#"><strong>关于俱乐部</strong></a>
					</div>
					<div class="body features">
						<table>
							<tr>
								<td class="feature">
									<div class="pic">
										<img src="${base}/assets/v2/shop/images/feature_1.png">
									</div>
									<div class="name">
										<strong>新鲜</strong>
									</div>
									<div class="desc">
										<strong><font color="#FDAC1F">艾格俱乐部，艾格俱乐部，艾格俱乐部，艾格俱乐部，艾格俱乐部</font></</strong>
									</div>
								</td>
								<td  class="internal">
								<td class="feature">
									<div class="pic">
										<img src="${base}/assets/v2/shop/images/feature_2.png">
									</div>
									<div class="name">
										<strong>尊贵服务</strong>
									</div>
									<div class="desc">
										<strong><font color="#FDAC1F">艾格俱乐部，艾格俱乐部，艾格俱乐部，艾格俱乐部，艾格俱乐部</font></</strong>
									</div>
								</td>
								<td  class="internal">
								<td class="feature">
									<div class="pic">
										<img src="${base}/assets/v2/shop/images/feature_3.png">
									</div>
									<div class="name">
										<strong>急速配送</strong>
									</div>
									<div class="desc">
										<strong><font color="#FDAC1F">艾格俱乐部，艾格俱乐部，艾格俱乐部，艾格俱乐部，艾格俱乐部</font></</strong>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
				
				
				<!- contact -->
				<div class="block">
					<div class="title">
						<div class="title_head"></div>
						<a style="margin-left:20px;" href="#"><strong>联系合作</strong></a>
					</div>
					<div class="body">
						<div class="msg_form">
							<form id="msg_form" name="msg_form" style="margin-top:20px;" method="post" action="/cooperation/submit.jhtml">
								<table style="width:100%;">
									<tr>
										<td colspan="4"><strong>如果您想为艾格吃饱了俱乐部会员提供优质的独家产品，请填写如下表格与我们联系。</strong></td>
									</tr>
									<tr>
										<td style="height:20px;" colspan="4"></td>
									</tr>
									<tr>
										<td style="width:200px;height:100%;">
											<table style="width:200px;height:100%;">
												<tr>
													<td>
														<input type="text" class="text" id="msg_name" name="msg_name" style="width:200px;height:32px;" data-empty="请输入姓名"></input>
													</td>
												</tr>
												<tr><td style="height:10px"></td></tr>
												<tr>
													<td>
														<input type="text" class="text" id="msg_phone" name="msg_phone" style="width:200px;height:32px;" data-empty="请输入电话"></input>
													</td>
												</tr>
												<tr><td style="height:10px"></td></tr>
												<tr>
													<td>
														<input type="text" class="text" id="msg_email" name="msg_email" style="width:200px;height:32px;" data-empty="请输入邮箱"></input>
													</td>
												</tr>
											</table>
										</td>
										<td style="width:20px">
										</td>
										<td style="width:480px">
											<table style="width:100%;">
												<tr>
													<td>
														<textarea id="msg_msg" class="text" name="msg_msg" style="width:100%;height:100px;" data-empty="留言"></textarea>
													</td>
												</tr>
												
												<tr>
													<td>
														<input type="text" id="msg_captcha" name="captcha" class="text" data-empty="请输入验证码" style="width:80px;"></input>
														<img id="msgCaptchaImage" class="captchaImage" src="${base}/assets/front/images/spacer.gif" title="${message("shop.captcha.imageTitle")}" />
													</td>
												</tr>
											</table>
										</td>
										<td style="width:20px"></td>
										<td style="vertical-align:bottom;">
											<button id="msg_submit" name="msg_submit" class="myButton">提交</button>
										</td>
									</tr>
								</table>
							</form>
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
		var msgCaptchaId = jQuery.uuid();
		var baseURL = '${base}';
	</script>
	
	<script type="text/javascript" src="${base}/assets/v2/shop/js/base.js"></script>
	<script type="text/javascript" type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
	<script type="text/javascript" src="${base}/assets/v2/shop/js/index.js"></script>
</html>