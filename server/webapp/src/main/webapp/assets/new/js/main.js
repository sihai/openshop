var animationOut;
(function($j)
{
	var groups;
	var $menu;
	var $login;
	var menuHeight;
	var marginTop;
	var bodyPlaque;
	var cartError,
		itemName;
	var isiPad = navigator.userAgent.match(/iPad/i) != null;


	function init()
	{

		resize();	
		if ( !isiPad ){
			$j("html").niceScroll({cursorcolor:"#999", cursorwidth:"8px", railpadding:{top:0,right:15,left:0,bottom:0} });
			$j(".shipping-info-popup-mage").niceScroll({cursorcolor:"#999", cursorwidth:"8px", railoffset:{top:0,left:-15}});
			$j(".subscription-legals-popup-mage").niceScroll({cursorcolor:"#999", cursorwidth:"8px", railoffset:{top:0,left:-15}});
			$j(".shipping-info-popup-mage").getNiceScroll().hide();
			$j(".subscription-legals-popup-mage").getNiceScroll().hide();
		}else{
			//$j("body .wrapper").css("height",606)
			//$j("body .wrapper").css("width",790)
			//$j("body .wrapper").css("border","1px solid green")
			if( $j("body").hasClass("onestepcheckout-index-index") || 
				$j("body").hasClass("checkout-cart-index") ||
				  $j("body").hasClass("customer-account-create")  ){
					$j("body .wrapper").niceScroll({cursorcolor:"#999", cursorwidth:"8px", 
					railpadding:{top:0,right:0,left:54,bottom:0} });
			}else{
					$j("body .wrapper").niceScroll({cursorcolor:"#999", cursorwidth:"8px", 
					railpadding:{top:0,right:0,left:0,bottom:0} });
			}
			$j(".shipping-info-popup-mage").niceScroll({cursorcolor:"#FF0000", cursorwidth:"8px", 
										railoffset:{top:0,right:0,left:0,bottom:0}});
			$j(".subscription-legals-popup-mage").niceScroll( {cursorcolor:"#999", cursorwidth:"8px", 
										railoffset:{top:0,right:0,left:0,bottom:0}});
			$j(".shipping-info-popup-mage").getNiceScroll().hide();
			$j(".subscription-legals-popup-mage").getNiceScroll().hide();
		}

		if ( isiPad ){
			$j("body").addClass("ipad")
		}

		// ipad input fix
        $j('body.ipad input').focus( 
        	function(){ 
        		//window.scrollTo(0, $j(this).offset().top); 
        		parent.window.scrollTo(1, $j(this).offset().top-72); 
        	} 
        );
        $j('body.ipad input').focusout( 
        	function(){ 
        		//window.scrollTo(0, 0); 
        		parent.window.scrollTo(0, 0); 
        	} 
        );
        //$j('body.ipad input').keydown( 
        //	function(){ window.scrollTo(0, 0); parent.window.scrollTo(0, 0); } );

		$j(document).bind('touchmove', function(e){
		    e.preventDefault();
		});

		$j("body .wrapper").bind('touchmove', function(e){
		   
		});
		 
        $j("#myaccount_logout").bind("click", logout);


		$j("#helpdesk-ticket-form #fields-file input#filename.input-file").customFileInput();		
		$j("#helpdesk-reply-form .file input#filename.input-file").customFileInput();		

		$j(".input-telephone input").keydown(isNumeric);
		$j("input#telephone").keydown(isNumeric);
		$j("input#fax").keydown(isNumeric);
        $j(".customer-dob input").keydown(isNumeric);

	  	if ( screen.height >= 1050 ) {
		    $j("#four").css({ "margin-bottom":"135px" });
		} else if ( screen.height >= 1080 ) {
		    $j("#four").css({ "margin-bottom":"165px" });
		} else if ( screen.height >= 1200 ) {
		    $j("#four").css({ "margin-bottom":"195px" });
		}

		/* CHECHKOUT */

		  if ($j("body.onestepcheckout-index-index").length != 0){

		  		menuHeight = $j(".header-fixed").height() + 72;
				groups = [ $j("#one"), $j("#two"), $j("#three"), $j("#four") ];
				$menu = $j(".selectores li");
				$login = $j("#onestepcheckout-login-link");
				$menu.bind("click", gotoTarget);
				$login.bind("click", openLoginPopup);
				$j('#account-modal .close').bind("click", closeLoginPopup );
				
				if( navigator.platform.indexOf("iPad") == -1)
				{
					
					$j(window).bind("scroll", render);
				}
			/*	
				$j("#billing_address_list select option").each(function(){
					$j("#billing_address_list select option").removeAttr("selected");
					
				});
		  		$j("#billing_address_list select option:first").attr("selected","selected");

				$j(".spain.lang-es #billing_address_list select option:nth-child(2)").html("España (Península y Baleares)");	
				$j(".spain.lang-en #billing_address_list select option:nth-child(3)").html("Spain (Península y Baleares)");	
		  	*/
		  		
		  }

		  if ($j(".checkout-cart-index").length != 0 || $j(".checkout-onepage-success").length != 0){
		  	$j("a#go_shopping, button#go_shopping").addClass("has-validation");
		  	$j("a#go_shopping").click(function(e){
				e.preventDefault();
				parent.globalBus.publish( 'satorisan', 'history-goto', { url: "/shop" } );
				return false;
			});
			$j("button#go_shopping").click(function(e){
				e.preventDefault();
				parent.globalBus.publish( 'satorisan', 'history-goto', { url: "/shop" } );
				return false;
			});
			$j(".checkout-onepage-success .buttons-set button").click(function(e){
				e.preventDefault();
				parent.globalBus.publish( 'satorisan', 'history-goto', { url: "/shop" } );
				return false;
			});

		  }
		  
		  bodyPlaque = "<div id='plaque' style='z-index:999999999;top:0;left:0;position:absolute;width:"+$j(window).width()+"px;height:"+$j(window).height()+"px;background:white;'></div>";
		  //window.selectBox = $j("#department_id").selectBoxIt().data("selectBoxIt");
		  if( $j("body").hasClass("ipad") ){
		  	/* native_selectboxit = true; */
		  }else{
		  	// native_selectboxit = false;
			$j(".shipping-select,.language-select,body.sales-order-history .pages select,.customer-address-form select#country, body.sales-order-history .limiter select, .onestepcheckout-index-index select, body.customer-account-create select, #helpdesk-ticket-form select, body.helpdeskultimate-customer-index .limiter select").selectBoxIt({ hideEffectSpeed:200, showEffectSpeed:200, showEffect:"fadeIn", hideEffect:"fadeOut"});
		  }
		  
		  //$j("body").append(bodyPlaque);
		  setTimeout(animationIn, 1000);

		  $j("a,button").not(".has-validation").not(".button-save").not(".selectboxit-option-anchor").bind("click", function(e){
		  		e.preventDefault();
		  		var url;
		  		if ($j(this).attr("href") !== undefined)
		  		{
		  			url = $j(this).attr("href");
		  		}

		  		if ($j(this).attr("onclick") !== undefined)
		  		{
		  			url = $j(this).attr("onclick");
		  			url = url.replace("window.location='", "");
		  			url = url.replace("'", "");
		  			url = url.replace(";", "");
		  		}

		  		animationOut(function(){
		  			document.location = url;
		  		});
		  		return false;
		  });

		  
		  if ( $j(".checkout-cart-index").length != 0 ) {


		  	//if ( $j(".cart-error").hasClass("lang-es") || $j(".cart-error").hasClass("lang-en") ){
		  	if ( $j(".cart-error .messages .error-msg ul li span").length != 0 ){
			  	cartError = $j(".cart-error .messages .error-msg ul li span").html();
			  	cartError = cartError.split(" ");
			  	//console.log(cartError[3]);
			  	if ( $j(".cart-error").hasClass("lang-es") != false && cartError[3] == "Satorisan"){
			  		//console.log(cartError[3] == "Satorisan");
			  		itemName = cartError[4].split("-");
			  		itemName = itemName[0]+" Tamaño "+itemName[1]+"</strong>";
			  		cartErrorTxt = cartError[0]+" "+cartError[1]+" "+cartError[2]+" <strong>"+cartError[3]+" "+itemName+" "+cartError[5]+" "+cartError[6]+" "+cartError[7]+" "+cartError[8]+" "+cartError[9]+" "+cartError[10]+" "+cartError[11];
			  		$j(".cart-error .messages .error-msg ul li span").html(cartErrorTxt);

			  	}else if ( $j(".cart-error").hasClass("lang-en") != false && cartError[4] == "Satorisan") {
			  		itemName = cartError[5].split("-");
			  		itemName = itemName[0]+" Size "+itemName[1]+"</strong>";
			  		cartErrorTxt = cartError[0]+" "+cartError[1]+" "+cartError[2]+" "+cartError[3]+" <strong>"+cartError[4]+" "+itemName+" "+cartError[6]+" "+cartError[7]+" "+cartError[8]+" "+cartError[9]+" "+cartError[10]+" "+cartError[11];
			  		$j(".cart-error .messages .error-msg ul li span").html(cartErrorTxt);

			  	}
			}

		  	$j(".open-shipping-popup").click(function(e){
		  		e.preventDefault();
    			parent.iframeInterface.ganalyticsTrackEvent({name:"SHIPPING INFO"});
		  		$j("html").getNiceScroll().hide();
		  		$j("body.ipad .wrapper").getNiceScroll().hide();
		  		$j(".shipping-info-popup-mage").getNiceScroll().show();
		  		$j(".shipping-info-popup-mage").css("display","block");
		  		$j(".shipping-info-popup-mage").animate( { "opacity" : 1 }, {duration:550, complete:function(){
		  			$j(".shipping-info-popup-content").animate( { "opacity" : 1 }, {duration:550});
		  			parent.iframeInterface.closePopUpButton();
		  		}});
		  		//alert(1);
		  		return false;

		  	});
		  	$j(".shipping-info-popup-close").click(function(){
		  		$j("html").getNiceScroll().show();
		  		$j("body.ipad .wrapper").getNiceScroll().show();
		  		$j(".shipping-info-popup-mage").getNiceScroll().hide();
		  		$j(".shipping-info-popup-content").animate( { "opacity" : 0 }, {duration:550, complete:function(){
		  			parent.iframeInterface.openPopUpButton();
		  			$j(".shipping-info-popup-mage").animate( { "opacity" : 0 }, {duration:550, complete:function(){
				  		$j(".shipping-info-popup-mage").css("display","none");

					}});
		  		}});	
				
		  	});
		  }

		  /*** ERROR REGISTER***/

		  $j(".account-create .button").click(function(){
		  	div = ".account-create";
		  	setTimeout(function(){
		  		errorForms(div);
		  	},10);
		  });
		  
		  /*** ERROR LOGIN***/

		  $j("#login-form .button").click(function(){
		  	div = "#login-form";
		  	setTimeout(function(){
		  		errorForms(div);
		  	},10);
		  });

		  /*** HELP DESK***/

		  $j("#helpdesk-ticket-form .button").click(function(){
		  	div = "#helpdesk-ticket-form";
		  	setTimeout(function(){
		  		errorForms(div);
		  	},10);
		  });

		  /*** My Account ***/

		  $j(".open-subscription-legals").click(function(e){
		  		e.preventDefault();
		  		
		  		$j("html").getNiceScroll().hide();
		  		$j("body.ipad .wrapper").getNiceScroll().hide();
		  		$j(".subscription-legals-popup-mage").getNiceScroll().show();
		  		$j(".subscription-legals-popup-mage").css("display","block");
		  		parent.iframeInterface.accountHideMenu();
		  		$j(".subscription-legals-popup-mage").animate( { "opacity" : 1 }, {duration:550, complete:function(){
		  			$j(".subscription-info-popup-content").animate( { "opacity" : 1 }, {duration:550});
		  			parent.iframeInterface.closePopUpButton();
		  		}});
		  		return false;

		  	});
		  	$j(".subscription-info-popup-close").click(function(){
		  		$j("html").getNiceScroll().show();
		  		$j("body.ipad .wrapper").getNiceScroll().show();
		  		$j(".subscription-legals-popup-mage").getNiceScroll().hide();
		  		$j(".subscription-info-popup-content").animate( { "opacity" : 0 }, {duration:550, complete:function(){
		  			parent.iframeInterface.openPopUpButton();
		  			parent.iframeInterface.accountShowMenu();
		  			$j(".subscription-legals-popup-mage").animate( { "opacity" : 0 }, {duration:550, complete:function(){
				  		$j(".subscription-legals-popup-mage").css("display","none");

					}});
		  		}});	
				
		  	});
	}

	function errorForms(div)
	{
		
		$j(div+" div input").each(function(){
			//console.log($j(this).parent().find("label"));
			if ( $j(this).hasClass("validation-failed") == true){
				//console.log($j(this).parent().parent().find("label"));
				$j(this).parent().parent().find("label").addClass("validation-failed");
			}
		});

		$j(div+" input").each(function(){
			//console.log($j(this).parent().find("label"));
			if ( $j(this).hasClass("validation-failed") == true){
				//console.log($j(this).parent().find("label"));
				$j(this).parent().find("label").addClass("validation-failed");
			}
		});




	}

	function openLoginPopup()
	{
		//$j('#onestepcheckout-login-popup-contents-forgot').hide();
        //$j('#onestepcheckout-login-popup-contents-login').show();
		$j("#onestepcheckout-login-popup").animate( { "height": "225px" }, 500 );
		$j(".checkoutcontainer").animate( { "margin-top": "409px"}, 500 );
	}

	function closeLoginPopup()
	{
		$j("#onestepcheckout-login-popup").animate( { "height": "0" }, 500 );
		$j(".checkoutcontainer").animate( { "margin-top": "190px"}, 500 );
	}

	function animationIn()
	{
		/*$j("#plaque").animate( { left:0-$j("#plaque").width()}, {duration:550, complete:function(){
			$j("body").css( { overflow:"auto" });	
		}} );*/
		$j("body").animate( { "opacity" : 1 }, {duration:550} );
		
		if( $j("body").hasClass("sales-order-history") || 
			$j("body").hasClass("sales-order-view") || 
			$j("body").hasClass("customer-account-edit") || 
			$j("body").hasClass("customer-address-index") || 
			$j("body").hasClass("customer-address-form") || 
			$j("body").hasClass("helpdeskultimate-customer-index") || 
			$j("body").hasClass("helpdeskultimate-customer-view") ){
				parent.showAccountMenu(550);	
		}
		
	}

	animationOut = function (_callback)
	{
		$j("body").animate( { "opacity":0}, {duration:550, complete:function(){
			_callback();
		}} );
		if( !$j("body").hasClass("sales-order-history") && 
			!$j("body").hasClass("sales-order-view") && 
			!$j("body").hasClass("customer-account-edit") && 
			!$j("body").hasClass("customer-address-index") && 
			!$j("body").hasClass("customer-address-form") && 
			!$j("body").hasClass("helpdeskultimate-customer-index") && 
			!$j("body").hasClass("helpdeskultimate-customer-view") ){
				parent.hideAccountMenu(550);
		}
		/*$j("body").css( { overflow:"hidden" });
		$j("#plaque").css({left:$j(window).width()}).animate( { left:0}, {duration:550, complete:function(){
			_callback();
		}} );*/
	}

	logout=function()
    {
        $j.ajax({
          cache: true,
          url: "/website/webservices/logout.php",
          contentType: "application/x-www-form-urlencoded;charset=UTF-8",
          success: function(data_json) {
            document.location = location.pathname;
          }
        });
    }


    isNumeric = function(e){
        var keyPressed;
        if (!e) var e = window.event;
        if (e.keyCode) keyPressed = e.keyCode;
        else if (e.which) keyPressed = e.which;
        var hasDecimalPoint = (($j(this).val().split('.').length-1)>0);
        if ( keyPressed == 46 || keyPressed == 8 ||((keyPressed == 190||keyPressed == 110)&&(!hasDecimalPoint)) || keyPressed == 9 || keyPressed == 27 || keyPressed == 13 ||
                 // Allow: Ctrl+A
                (keyPressed == 65 && e.ctrlKey === true) ||
                 // Allow: home, end, left, right
                (keyPressed >= 35 && keyPressed <= 39)) {
                     // let it happen, don't do anything
                     return;
            }
            else {
                // Ensure that it is a number and stop the keypress
                if (e.shiftKey || (keyPressed < 48 || keyPressed > 57) && (keyPressed < 96 || keyPressed > 105 )) {
                    e.preventDefault();
                }
            }    
    }


	function gotoTarget(e)
	{
		if( navigator.platform.indexOf("iPad") != -1 || navigator.platform.indexOf("iPod") != -1 ){
			//alert(groups[ $j(".selectores li").index( $j(this) ) ].offset().top);
		} else {
			e.preventDefault();
			menuHeight = $j(".header-fixed").height() + 72;
			$j("body,html").animate( {"scrollTop" : groups[ $j(".selectores li").index( $j(this) ) ].offset().top - menuHeight}, {duration:450})
			return false;
		}
	}
/*
	{
		e.preventDefault();
		menuHeight = $j(".header-fixed").height() + 72;
		$j("body,html").animate( {"scrollTop" : groups[ $j(".selectores li").index( $j(this) ) ].offset().top - menuHeight}, {duration:450})
		//parent.iframeInterface.ganalyticsTrackEvent({name:"CHECKOUT "+$j(this).find("a").attr("title")});
		return false;
	}
*/
	function render()
	{
		//alert('render');	
		//var scrollPosition = $j("body").scrollTop();
		var scrollPosition = $j(window).scrollTop();
		
		menuHeight = $j(".header-fixed").height() + 74;	
		marginTop = $j(".header-fixed").height() + 63;
		
		$menu.removeClass("active");
		for (var i=0; i<groups.length; i++)
		{
			
			if (i<groups.length-1)
			{
				if ( (scrollPosition + menuHeight) >= groups[i].offset().top && (scrollPosition + menuHeight) < groups[i+1].offset().top )
				{
					$menu.eq(i).addClass("active");
				}
			}
			else
			{
				if ( (scrollPosition + menuHeight) > groups[i].offset().top )
				{
					$menu.eq(i).addClass("active");
				}	
			}

    		
		}

		if (scrollPosition < menuHeight) $menu.eq(0).addClass("active");

		if(scrollPosition >= ($j("body").outerHeight()-$j(window).height()-5) ){
			$menu.removeClass("active");
			$menu.eq(3).addClass("active");
		}
	}

	

	function resize()
	{
		var toWidth = $j(window).width()-75;
		console.log(toWidth);
        if (toWidth >= 900)
        {
        	/** Checkout **/
            $j(".lang-en #onestepcheckout-toc-popup .onestepcheckout-popup-wrapper .close").css("left",821);
            $j(".lang-es #onestepcheckout-toc-popup .onestepcheckout-popup-wrapper .close").css("left",756);

            /** Cart **/
            $j(".lang-es .freeshipping .shipping-info-popup-mage .shipping-info-popup-close ").css("left",794);
            $j(".lang-en .freeshipping .shipping-info-popup-mage .shipping-info-popup-close ").css("left",811);
        }

        if (toWidth <= 890)
        {
        	/** Checkout **/
            $j(".lang-en #onestepcheckout-toc-popup .onestepcheckout-popup-wrapper .close").css("left",756);
            $j(".lang-es #onestepcheckout-toc-popup .onestepcheckout-popup-wrapper .close").css("left",692);

            /** Cart **/
            $j(".lang-es .freeshipping .shipping-info-popup-mage .shipping-info-popup-close ").css("left",730);
            $j(".lang-en .freeshipping .shipping-info-popup-mage .shipping-info-popup-close ").css("left",746);
        }
		
	}


	$j(window).resize(resize);

	$j(document).bind("ready", init);


})(jQuery); 