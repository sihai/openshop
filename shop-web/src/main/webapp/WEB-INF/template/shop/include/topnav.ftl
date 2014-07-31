<!--Top Nav-->
<nav class="account-navigation">
	<ul class="account-tabs menu">
		<li id = "login" style="display:none;">
			<a class="account-nav-label" href="${base}/login.jhtml">${message("shop.header.login")}</a>
		</li>
		<li id = "register" style="display:none;">
			<a class="account-nav-label" href="${base}/register.jhtml">${message("shop.header.register")}</a>
		</li>
		<li id="logined" class="account-tab tab-with-menu">
			<a id = "welcome_username" class="account-nav-label" data-tab-name="Account" data-gilt-tracking="account" href="#" data-gilt-test="link-util-nav-account"> 我的帐号 </a>
          	<ul class="account-menu">
          		[@navigation_list position = "top"]
					[#list navigations as navigation]
						<li>
							<a class="account-menu-item account-menu-orders" href="${navigation.url}"[#if navigation.isBlankTarget] target="_blank"[/#if]>${navigation.name}</a>
						</li>
					[/#list]
				[/@navigation_list]
          		
            	<li><a href="${base}/logout.jhtml" class="account-menu-item account-menu-orders" data-gilt-test="link-util-nav-orders" data-gilt-tracking="order"><span class="icon">+</span>登出</a></li>
          	</ul>
		</li>

		<li class="account-tab account-cart account-nav-cart-actions">
			<div class="cart">
				<a id="cart" class="account-nav-label" href="${base}/cart/list.jhtml">
					${message("shop.header.cart")}&nbsp;
				</a>
				<button id="J_MiniCartNum" class="account-nav-cart-count account-nav-button cart-count gilt-cart-open-link login-reg-wall-override" data-gilt-tracking="cart-count" data-gilt-test="link-util-nav-cart">
					0
				</button>
				<a class="account-nav-checkout account-nav-button checkout" href="${base}/cart/list.jhtml" data-gilt-test="link-util-nav-checkout" data-gilt-tracking="checkout">
					${message("shop.header.checkout")}
				</a>
			</div>
		</li>
	</ul>
</nav>
<!--Top Nav end-->