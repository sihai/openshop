/**
 * aigechibaole.com
 */

var TRIM_REGEX = /^[\x09\x0a\x0b\x0c\x0d\x20\xa0\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u2028\u2029\u202f\u205f\u3000]+|[\x09\x0a\x0b\x0c\x0d\x20\xa0\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u2028\u2029\u202f\u205f\u3000]+$/g;

/**
 * 
 * @param str
 * @returns
 */
function trim(str) {
	if(null == str) {
		return str;
	}
	return str.replace(TRIM_REGEX, "");
}

/**
 * 
 * @param str
 * @returns
 */
function isBlank(str) {
	return "" == trim(str);
}

/**
 * 
 * @param str
 */
function toInt(str) {
	return parseInt(str);
}

function setCartQuantity(quantity) {
	$("#cart-number").text('' + quantity);
}

function getCartQuantity() {
	parseInt($("#cart-number").text());
}

function refreshCart() {
	$.ajax({
		type: "GET",
		url: "/cart/get_quantity.jhtml",
		beforeSend: function(xmlhttprequest){
			//ShowLoading();
		},
		success: function(data, textStatus){
			//alert(data);
			setCartQuantity(data.quantity);
		},
		complete: function(xmlhttprequest, textStatus){
			//HideLoading();
		},
		error: function(){
			//请求出错处理
		}
	});
}

$().ready(function () {
 
	var $loginInfo = $("#login-info");
	var $login = $("#login");
	var $register = $("#register");
	var $loginFormDiv = $("#login-form-div");
	var $loginForm = $("#login-form");
	var $memberName = $("#member-name");
	var $memberInfo = $("#member-info");
	var $captchaImage = $("#captchaImage");
	var name = getCookie("name");
	var $username = $('#username');
	var $password = $('#password');
	var $captcha = $('#captcha');
	var $submit = $("#login-form :submit");
	
	if (name != null) {
		$memberName.text("您好, " + name);
		$memberInfo.show();
		$loginInfo.hide();
		
		$("#logout").click(function(){
			
		});
	} else {
		$memberInfo.hide();
		$loginInfo.show();
		
		$login.click(function(){
			$loginFormDiv.slideDown("slow");
			return false;
		});
		
		// 记住用户名
		var t = getCookie("username");
		if (null != t) {
			$username.val(t);
			$password.focus();
		} else {
			$username.focus();
		}
		
		// 
		$captchaImage.attr("src",  '/common/captcha.jhtml?captchaId=' + captchaId + '&timestamp=' + (new Date()).valueOf());
		
		// 更换验证码
		$captchaImage.click(function() {
			$captchaImage.attr("src",  '/common/captcha.jhtml?captchaId=' + captchaId + '&timestamp=' + (new Date()).valueOf());
		});
	}	
	
	// 表单验证、记住用户名
	$loginForm.validate({
		rules: {
			username: "required",
			password: "required",
			captcha: "required"
		},
		submitHandler: function(form) {
			$.ajax({
				url: baseURL + "/common/public_key.jhtml",
				type: "GET",
				dataType: "json",
				cache: false,
				beforeSend: function() {
					$submit.prop("disabled", true);
				},
				success: function(data) {
					var rsaKey = new RSAKey();
					rsaKey.setPublic(b64tohex(data.modulus), b64tohex(data.exponent));
					var enPassword = hex2b64(rsaKey.encrypt($password.val()));
					$.ajax({
						url: $loginForm.attr("action"),
						type: "POST",
						data: {
							username: $username.val(),
							enPassword: enPassword,
							captchaId: captchaId,
							captcha: $captcha.val()
						},
						dataType: "json",
						cache: false,
						success: function(message) {
							addCookie("username", $username.val(), {expires: 7 * 24 * 60 * 60});
							$submit.prop("disabled", false);
							if (message.type == "success") {
								location.href = location.href;
							} else {
								$.message(message);
								$captcha.val("");
								$captchaImage.attr("src", baseURL + '/common/captcha.jhtml?captchaId=' + captchaId + '&timestamp=' + (new Date()).valueOf());
							}
						}
					});
				}
			});
		}
	});
	
	$(':input').each(function() {
		$(this).emptyValue();
	});
	
	/*
	$(".product").each(function(){
		$(this).hover(function() {
			$(this).css('background-color', '#FDA617');
			$(this).find('font:first').css('color', 'white');
			$(this).find('font:last').css('color', 'white');
		}, function() {
			$(this).css('background-color', '#EEEEEE');
			$(this).find('font:first').css('color', '#FDAC1F');
			$(this).find('font:last').css('color', '#FDAC1F');
		});
	});
	*/
	$('.lazy_img').each(function() {
	    this.src = this.getAttribute('data-img-src');
	});
	
	if($('.fancybox').length > 0) {
		$('.fancybox').fancybox();
	}
	
	// 刷新购物车
	refreshCart();
});