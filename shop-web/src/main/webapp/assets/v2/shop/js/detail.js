/**
 * aigechibaole.com
 */
$().ready(function () {
 
	$(".tab_item").each(function(){
		$(this).click(function() {
			var current = $('.current-tab');
			var odetail = current.attr('detail-id');
			var detail = $(this).attr('detail-id');
			if(detail == odetail) {
				return false;
			}
			current.removeClass('current-tab');
			current.parent().css('background-color', '');
			var cdetail = $('#' + odetail);
			cdetail.hide();
			
			$(this).addClass('current-tab');
			$(this).parent().css('background-color', '#C3C3C3');
			var d = $('#' + detail);
			d.show();
			return false;
		});
	});
	
	$("#add").click(function() {
		var num = $("#number").val();
		if(isBlank(num)) {
			$("#number").val(1);
		} else {
			$("#number").val(toInt(num) + 1);
		}
	});
	
	$("#sub").click(function() {
		var newv = 0;
		var num = $("#number").val();
		if(isBlank(num)) {
			$("#number").val(0);
		} else {
			newv = toInt(num) - 1;
			newv = newv < 0 ? 0 : newv;
			$("#number").val(newv);
		}
	});
	
	var $quantity = $('#number');
	// 加入购物车
	$('#add-2-cart').click(function() {
		var quantity = $quantity.val();
		if (/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 0) {
			$.ajax({
				url: "${base}/cart/add.jhtml",
				type: "POST",
				data: {id: ${product.id}, quantity: quantity},
				dataType: "json",
				cache: false,
				success: function(message) {
					var n = getCartQuantity() + parseInt(quantity);
					setCartQuantity(n);
					$.message(message);
				}
			});
		} else {
			$.message("warn", "${message("shop.product.quantityPositive")}");
		}
	});
});