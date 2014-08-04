<script type="text/javascript">
  	require = {
      	baseUrl: 'http://assets3.giltcdn.com/a/js/web-search/0.4.20/',
    	callback: function () {
      		createConfig('config.service_base_uri', '');
        	createConfig('config.jsBasePath', 'http://assets3.giltcdn.com/a/js/web-search/0.4.20');
      		createConfig('config.cdnBaseUris', ['http://cdn5.giltcdn.com', 'http://cdn6.giltcdn.com', 'http://cdn7.giltcdn.com', 'http://cdn8.giltcdn.com']);
      		createConfig('config.server_clock_delta', server_clock_delta);
      		createConfig("config.facebookAppId", 271483649617436);
    	}
  	}
</script>

<script src="${base}/assets/front/js/package.js"></script>
		
<script type="text/javascript">
  	var _gaq = _gaq || [];

  	_gaq.push(['_setAccount', 'UA-3311903-2']);
  	_gaq.push(['_setDomainName', 'gilt.com']);
  	_gaq.push(['_setLocalRemoteServerMode']);
  	_gaq.push(['_setLocalGifPath', 'http://log4gilt.gilt.com/ga/__utm.gif']);

  	(function() {
    	var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    	ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  	})();

  	requireModules(['vendor/handlebars'], function (Handlebars) {
    	Handlebars.registerHelper("head", function (items, options) {
      	return options.fn(items[0]);
    	});
  	});

  	requireModules([
    	'user.login_reg.controller',
    	'user.login_reg.facebook',
    	'user.promotion'
  	], function (loginReg, facebook, promotion) {
    	var isLoggedIn = false;
    	promotion.init(isLoggedIn);
    	if (!isLoggedIn) {
      		loginReg.init();
      		loginReg.addTrigger('.login_reg_trigger, .login-link, .register-link, .gilt-navigation .store-menu a, .gilt-navigation search, .search-results a, .search-results label, .search-results button, .search-results input, .search-results select');
      		facebook.init();
    	}
  	});

  	requireModules([
     		'vendor/jquery',
     		'nav/unified/nav'
    	],

    	function ($, unifiedNav) {
          	var $nav = $('.gilt-navigation');
          	if ($nav.length) {
            	unifiedNav($nav);
          	} else {
                (function() {
                  	var head = document.getElementsByTagName("head")[0],
                    bootStrapUrl = "http://cdn1.giltcdn.com/globalnav/v1/nav/bootstrap",
                    newScript = document.createElement('script'),
                    store = "men";

                  	newScript.src = bootStrapUrl + '?store=' + store;

                  	head.appendChild(newScript);
                })();
          	}
    	});

  	requireModules(["common.cart"], function (commonCart) {
    	var storeId = 2
    	commonCart.init({
      	subsiteId: 1,
      	storeId: storeId,
      	channelId: 1
      	// TODO: add isLoyaltyUser
    	});
  	});

  	requireModules(['common.ab_test'], function (abTest) {
    	abTest.init({"mobile_image_swiper":"on","true_fit":"on","intl_free_shipping":"on","paypal":"off","brand_alerts_2_0":"eligible_group","personal_sale_employee":"on","cart_waitlist":"on","sale_to_sale_nav_v3":"on","navigation":"unified_no_hp","dsr_subject_line":"with_prefix","mosaic_view_kafka_event_rollout":"on","intl_decouple_currency":"off","dsr_personalization":"test_group_small","global_search":"on","intl_reg_modal_copy":"on","loyalty":"loyalty_on","hopper_rollout":"rogue"});
  	});

  	requireModules(['common.message'], function (message) {
    	message.init();
  	});

	requireModules(['common/page_controller', 'common/notify', 'src/controllers/search_results', 'src/controllers/tracking'], function (page, notify, serp, tracking) {
		page.setProperty('brand', []);
	    page.setProperty('category', []);
	    page.setProperty('color', []);
	    page.setProperty('age', []);
	    page.setProperty('gender', []);
	    page.setProperty('count', 178);
	    page.setProperty('query', "mens-shoes");
	    page.setProperty('rows', 48);
	    page.setProperty('size', []);
	    page.setProperty('sort', null);
	    page.setProperty('start', 0);
	    page.setProperty('store', "men");

	    page.setProperty('personalSaleData', {
	      	'isPersonalSale': false,
	      	'previewMode': false,
	    });

		page.setProperty('currentAction', "/category/men/mens-shoes");

		page.add(serp);
		page.add(tracking);

	    page.add(function trackingNotifications(props) {
	    	notify.publish('search/results', ["men|category listing", "Results|178", "men|mens-shoes"]);
	    });
	});

  	requireModules(["vendor.jquery", "common.storage"], function ($, storage) {
    	storage.local.set('intl.config', {"price_adjustment":{"coefficient":1.72,"rule_id":"17336"},"country":{"iso_3166_three":"CHN","iso_3166_two":"CN","name":"China","default_currency":"CNY","is_billable":true,"is_shippable":true,"requires_postal_code":true,"region":"AsiaPacific"},"currency":{"iso_4217_code":"CNY","name":"Chinese Yuan Renminbi","visa_supported":true,"mastercard_supported":true,"amex_supported":true,"supported_cards":["VISA","MASTERCARD","AMERICAN_EXPRESS"],"decimal_places":2,"symbol":"¥"},"shipping_destination":{"iso_3166":"China","ship_method":"Express","ship_min_days":3,"ship_max_days":5,"sales_tax_name":"VAT","price_includes_list":["Duties","VAT"],"local_country_name":null,"round_up":false,"price_includes":"Duties and VAT"},"exchange_rate":{"usd_rate":6.58625},"format":{"symbol":"¥","symbol_separator":"","symbol_before_amount":true,"grouping_separator":",","decimal_separator":".","decimal_places":2,"show_cents_by_default":true,"locale":"en_US","currency_code":"CNY"}});
  	});

  	requireModules(['common.admin_bar'], function (adminBar) {
    	adminBar.init();
  	});

  	requireModules(['common/page_controller'], function (page) {
    	page.setProperty('applicationName', 'web-search');
    	page.setProperty('gaPreference', {
      		siteSection:      'men',
      		pageType:         'category listing page solr',
      		doPageTrackCall:  'true',
      		userStatus: 'Logged Out'
    });

    return page.init({});
  });
</script>

<script type="text/javascript">
	$().ready(function() {
	
		var $login = $("#login");
		var $register = $("#register");
		var $username = $("#username");
		var $logined = $("#logined");
		var name = getCookie("username");
		
		if (username != null) {
			$username.text("${message("shop.header.welcome")}, " + name).show();
			$logined.show();
		} else {
			$login.show();
			$register.show();
			$logined.hide();
		}
	});
</script>

<div class="footer">
  <ul class="nav footer-nav clearfix">
    <li class="nav-item">
      <ul class="first-footer-links footer-links">
        <li><a class="gilt-logo logo hide-text" href="/sale/women">Gilt</a></li>
        <li>
          <div class="secondary copyright">&copy; 2007 - 2013 GILT GROUPE, INC.</div>
          <div class="secondary copyright">ALL RIGHTS RESERVED.</div>
        </li>
      </ul>
    </li>
    <li class="nav-item">
    <ul class="footer-links">
      <li class="primary">Company</li>
      <li><a class="secondary highlight" href="/company">About</a></li>
      <li><a class="secondary highlight" href="/company/careers">Careers</a></li>
      <li><a class="secondary highlight" href="http://tech.gilt.com">Technologie</a></li>
      <li><a class="secondary highlight" href="https://dev.gilt.com">Developers</a></li>
      <li><a class="secondary highlight" href="/support/faq">FAQ</a></li>
      <li><a class="secondary highlight" href="/gift-certificate/gift-card">E-Gift Cards</a></li>
      
      <li><a class="secondary highlight" href="/styles">Style Directory</a></li>
      <li><a class="secondary highlight" href="/brands">Brand Directory</a></li>
    </ul>
    </li>
    <li class="nav-item">
      <ul class="footer-links">
        <li class="primary">Customer Service</li>
        <li><a class="secondary highlight" href="/support">Contact Us</a></li>
        <li><a class="secondary highlight" href="/support/returns">Return Policy</a></li>
        <li><a class="secondary highlight" href="/support/shipping">Shipping &amp; Tax</a></li>
        <li><a class="secondary highlight" href="/support/global">International</a></li>
      </ul>
    </li>
    <li class="nav-item">
      <ul class="footer-links">
        <li class="primary">Policies</li>
        <li><a class="secondary highlight" href="/company/termsOfUse">Terms Of Service</a></li>
        <li><a class="secondary highlight" href="/company/privacy">Privacy</a></li>
        <li><a class="secondary highlight" href="/company/security">Security</a></li>
        <li><a class="secondary highlight" href="/company/websiteterms">Website Terms of Use</a></li>
      </ul>
    </li>
    <li class="nav-item">
      <ul class="footer-links">
        <li class="primary">Connect with Gilt</li>
        <li class="social social-top">
            <a class="social-icon secondary highlight" href="/apps/iphone">
              <div class="button">
                  <div class="icon mobile"></div>
              </div>
              <span class="label">Mobile</span>
            </a>
        </li>

        <li class="social">
          <a class="social-link secondary highlight" href="http://twitter.com/Gilt">
            <div class="button">
              <div class="icon twitter"></div>
            </div>
            <span class="label">Twitter</span>
          </a>
        </li>
        <li class="social">
          <a class="social-link secondary highlight" href="http://www.facebook.com/Gilt">
            <div class="button">
              <div class="icon facebook"></div>
            </div>
            <span class="label">Facebook</span>
          </a>
        </li>
        <li class="social">
          <a class="social-link secondary highlight" href="http://fusion.google.com/add?source=atgs&feedurl=https%3A//api.gilt.com/v1/sales/women/active.atom">
            <div class="button">
              <div class="icon reader"></div>
            </div>
            <span class="label">Google</span>
          </a>
        </li>
        <li class="social">
          <a class="social-link secondary highlight" href="https://dev.gilt.com">
            <div class="button">
              <div class="icon api"></div>
            </div>
            <span class="label">API</span>
          </a>
        </li>

      </ul>
    </li>
    <li class="nav-item">
      <ul class="footer-links">
        <li class="primary">Magazine Partner</li>
        <li>
          <a class="dujour-logo logo hide-text" rel="nofollow" href="http://www.dujour.com" title="DuJour" target="_blank">DuJour</a>
        </li>
      </ul>
    </li>
  </ul>
</div>