<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.jqzoom.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.rating.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.lazyload.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/shop/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/qq_customer_service.js"></script>

<script type="text/javascript">
	$().ready(function() {
		var $login = $("#login");
		var $register = $("#register");
		var $welcomeUsername = $("#welcome_username");
		var $logined = $("#logined");
		var name = getCookie("name");
		
		var $productSearchForm = $("#productSearchForm");
		var $keyword = $("#productSearchForm input");
		var defaultKeyword = "商品搜索";
		
		if (name != null) {
			$welcomeUsername.text("${message("shop.header.welcome")}, " + name).show();
			$logined.show();
		} else {
			$login.show();
			$register.show();
			$logined.hide();
		}
		
		$.ajax({
			type: "GET",
			url: "/cart/get_quantity.jhtml",
			beforeSend: function(xmlhttprequest){
				//ShowLoading();
			},
			success: function(data, textStatus){
				//alert(data);
				$("#J_MiniCartNum").text(" " + data.quantity);
			},
			complete: function(xmlhttprequest, textStatus){
				//HideLoading();
			},
			error: function(){
				//请求出错处理
			}
		});
		
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
		
		$productSearchForm.submit(function() {
			if ($.trim($keyword.val()) == "" || $keyword.val() == defaultKeyword) {
				return false;
			}
		});
	});
</script>

<div class="footer">
  	<ul class="nav footer-nav clearfix">
  	
    	<li class="nav-item">
      		<ul class="first-footer-links footer-links">
        		<li><a class="gilt-logo logo hide-text" href="/">艾格吃饱了</a></li>
		        <li>
		          	<div class="secondary copyright">&copy; 2007 - 2013 AIGECHIBAOLE GROUPE, INC.</div>
		          	<div class="secondary copyright">ALL RIGHTS RESERVED.</div>
		        </li>
      		</ul>
    	</li>
    	
    	<li class="nav-item">
	      	<ul class="footer-links">
	        	<li class="primary">友情连接</li>
	        	<li><a class="secondary highlight" href="http://www.kuaidi100.com/" target="_blank">快递查询</a></li>
	      	</ul>
		</li>
		
		<li class="nav-item">
	      	<ul class="footer-links">
		      <li class="primary">关于我们</li>
		      <li><a class="secondary highlight" href="/article/list/7.jhtml">关于我们</a></li>
		    </ul>
    	</li>
		
		<li class="nav-item">
	      	<ul class="footer-links">
	        	<li class="primary">联系我们</li>
		        <li class="social social-top">
		        	<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=363573906&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:363573906:52" alt="点击这里给我发消息" title="点击这里给我发消息"/></a>
		        </li>
		        <li class="social">
		        </li>
		        <li class="social">
		        </li>
		        <li class="social">
		        </li>
		        <li class="social">
		        </li>
	      	</ul>
    	</li>
	</ul>
</div>