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
			<title>[#if seo.title??][@seo.title?interpret /][#else]${message("shop.index.title")}[/#if][#if systemShowPowered] - Powered By aigechibaole[/#if]</title>
			[#if seo.keywords??]
				<meta name="keywords" content="[@seo.keywords?interpret /]" />
			[/#if]
			[#if seo.description??]
				<meta name="description" content="[@seo.description?interpret /]" />
			[/#if]
		[/@seo]

		[#include "/shop/include/metaAndcss.ftl" /]
		
		<link href="${base}/assets/v2/shop/css/index.css" rel="stylesheet" type="text/css" />
		
		<style>

			.myButton {
				-moz-box-shadow: 0px 10px 14px -7px #3e7327;
				-webkit-box-shadow: 0px 10px 14px -7px #3e7327;
				box-shadow: 0px 10px 14px -7px #3e7327;
				background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #77b55a), color-stop(1, #72b352));
				background:-moz-linear-gradient(top, #77b55a 5%, #72b352 100%);
				background:-webkit-linear-gradient(top, #77b55a 5%, #72b352 100%);
				background:-o-linear-gradient(top, #77b55a 5%, #72b352 100%);
				background:-ms-linear-gradient(top, #77b55a 5%, #72b352 100%);
				background:linear-gradient(to bottom, #77b55a 5%, #72b352 100%);
				filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#77b55a', endColorstr='#72b352',GradientType=0);
				background-color:#77b55a;
				-moz-border-radius:4px;
				-webkit-border-radius:4px;
				border-radius:4px;
				border:1px solid #4b8f29;
				display:inline-block;
				cursor:pointer;
				color:#ffffff;
				font-family:arial;
				font-size:13px;
				font-weight:bold;
				padding:6px 12px;
				text-decoration:none;
				text-shadow:0px 1px 0px #5b8a3c;
				width: 64px;
				height: 32px;
			}
			.myButton:hover {
				background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #72b352), color-stop(1, #77b55a));
				background:-moz-linear-gradient(top, #72b352 5%, #77b55a 100%);
				background:-webkit-linear-gradient(top, #72b352 5%, #77b55a 100%);
				background:-o-linear-gradient(top, #72b352 5%, #77b55a 100%);
				background:-ms-linear-gradient(top, #72b352 5%, #77b55a 100%);
				background:linear-gradient(to bottom, #72b352 5%, #77b55a 100%);
				filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#72b352', endColorstr='#77b55a',GradientType=0);
				background-color:#72b352;
			}
			.myButton:active {
				position:relative;
				top:1px;
			}
			
		</style>
		
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
							<div class="view grid-nosku view-noCom" id="J_ItemList" data-spm="a220m.1000858.1000725" data-area="杭州" data-atp-a="{p},{id},,,spu,1,spu,{user_id}" data-atp-b="{p},{id},,,spu,2,spu,{user_id}" data-spm-max-idx="312">
							[@product_list productCategoryId = currentRootCategory.id count = 128]
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
							[/@product_list]
						</div>
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