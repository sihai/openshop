/**
 * aigechibaole.com
 */

/**
 * 
 */
function useAddress(addressId) {
	//alert(addressId);
	
	$.ajax({
		url: "/member/receiver/get.jhtml",
		type: "GET",
		data: {id: addressId},
		dataType: "json",
		cache: false,
		beforeSend: function() {
		},
		success: function(data) {
			if (data.message.type == "success") {
				
				$.fancybox.close();
			} else {
				$.message(data.message);
			}
		},
		complete: function() {
		}
	});
}

$().ready(function () {
 
	var $effectivePoint = $("#effectivePoint");
	var $effectivePrice = $("#effectivePrice");
	var $quantity = $("input[name='quantity']");
	var $increase = $("span.increase");
	var $decrease = $("span.decrease");
	var $delete = $("a.delete");
	
	var $receiverId = $("#receiverId");
	
	var $isInvoice = $("#isInvoice");
	var $invoiceTitleTr = $("#invoiceTitleTr");
	var $invoiceTitle = $("#invoiceTitle");
	var $payMethod = $("#pay_method");
	
	var $orderForm = $("#orderForm");
	var $submit = $("#submit");
	
	var timeouts = {};
	
	$('img[name = "item-checked"]').click(function() {
		var $this = $(this);
		var tr = $this.closest("tr");
		if($this.attr('value') == 'checked') {
			$this.attr('value', 'unchecked');
			this.src = '/assets/v2/shop/images/no.png';
			//
			deleteCartItem(tr, $this.attr('data'));
		} else {
			$this.attr('value', 'checked');
			this.src = '/assets/v2/shop/images/yes.png';
			addCartItem(tr, $this.attr('data'));
		}
	});
	
	$('img[name = "pay_method"]').click(function() {
		var $this = $(this);
		var value = $this.attr('value');
		if(value == $payMethod.val()) {
			return false;
		}
		$payMethod.val(value);
		this.src = $this.attr('prefix') + 'selected.png'
		
		$('img[name = "pay_method"]').each(function() {
			var _this = $(this);
			if(_this.attr('value') != value) {
				this.src = _this.attr('prefix') + 'unselected.png'
			}
		})
	});
	
	// 初始数量
	$quantity.each(function() {
		var $this = $(this);
		$this.data("value", $this.val());
	});
	
	// 数量
	$quantity.keypress(function(event) {
		var key = event.keyCode ? event.keyCode : event.which;
		if ((key >= 48 && key <= 57) || key==8) {
			return true;
		} else {
			return false;
		}
	});
	
	// 增加数量
	$increase.click(function() {
		var $quantity = $(this).parent().siblings("input");
		var quantity = $quantity.val();
		if (/^\d*[1-9]\d*$/.test(quantity)) {
			$quantity.val(parseInt(quantity) + 1);
		} else {
			$quantity.val(1);
		}
		edit($quantity);
	});
	
	// 减少数量
	$decrease.click(function() {
		var $quantity = $(this).parent().siblings("input");
		var quantity = $quantity.val();
		if (/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 1) {
			$quantity.val(parseInt(quantity) - 1);
		} else {
			$quantity.val(1);
		}
		edit($quantity);
	});
	
	// 编辑数量
	$quantity.bind("input propertychange change", function(event) {
		if (event.type != "propertychange" || event.originalEvent.propertyName == "value") {
			edit($(this));
		}
	});
	
	// 编辑数量
	function edit($quantity) {
		var quantity = $quantity.val();
		if (/^\d*[1-9]\d*$/.test(quantity)) {
			var $tr = $quantity.closest("tr");
			var id = $tr.find("img[name='item-checked']").attr('data');
			clearTimeout(timeouts[id]);
			timeouts[id] = setTimeout(function() {
				$.ajax({
					url: "edit.jhtml",
					type: "POST",
					data: {id: id, quantity: quantity},
					dataType: "json",
					cache: false,
					beforeSend: function() {
						$submit.prop("disabled", true);
					},
					success: function(data) {
						if (data.message.type == "success") {
							$quantity.data("value", quantity);
							$tr.find("span.subtotal").text(currency(data.subtotal, true));
							if (!data.isLowStock) {
								$tr.find("span.lowStock").remove();
							}
							$effectivePoint.text(data.effectivePoint);
							$effectivePrice.text(currency(data.effectivePrice, true, true));
						} else if (data.message.type == "warn") {
							$.message(data.message);
							$quantity.val($quantity.data("value"));
						} else if (data.message.type == "error") {
							$.message(data.message);
							$quantity.val($quantity.data("value"));
							setTimeout(function() {
								location.reload(true);
							}, 3000);
						}
					},
					complete: function() {
						$submit.prop("disabled", false);
					}
				});
			}, 500);
		} else {
			$quantity.val($quantity.data("value"));
		}
	}
	
	function addCartItem(tr, cartItemId) {
		
	}
	
	// 删除
	function deleteCartItem(tr, cartItemId) {
		if (confirm(deleteConfirmMessage)) {
			var $this = $(this);
			clearTimeout(timeouts[cartItemId]);
			$.ajax({
				url: "delete.jhtml",
				type: "POST",
				data: {id: cartItemId},
				dataType: "json",
				cache: false,
				beforeSend: function() {
					$submit.prop("disabled", true);
				},
				success: function(data) {
					if (data.message.type == "success") {
						if (data.quantity > 0) {
							tr.remove();
							$effectivePoint.text(data.effectivePoint);
							$effectivePrice.text(currency(data.effectivePrice, true, true));
						} else {
							location.reload(true);
						}
					} else {
						$.message(data.message);
						setTimeout(function() {
							location.reload(true);
						}, 3000);
					}
				},
				complete: function() {
					$submit.prop("disabled", false);
				}
			});
		}
	};
	
	// 收货地址
	$("#receiver li").live("click", function() {
		var $this = $(this);
		$receiverId.val($this.attr("receiverId"));
		$("#receiver li").removeClass("selected");
		$this.addClass("selected");
		if(setting.isInvoiceEnabled) {
			if ($.trim($invoiceTitle.val()) == "") {
				$invoiceTitle.val($this.find("strong").text());
			}
		}
	});
	
	// 开据发票
	$isInvoice.click(function() {
		$invoiceTitleTr.toggle();
		calculate();
	});
	
	// 计算
	function calculate() {
		$.ajax({
			url: "/member/order/calculate.jhtml",
			type: "POST",
			data: $orderForm.serialize(),
			dataType: "json",
			cache: false,
			success: function(data) {
				if (data.message.type == "success") {
					$freight.text(currency(data.freight, true));
					if (data.promotionDiscount > 0) {
						$promotionDiscount.text(currency(data.promotionDiscount, true));
						$promotionDiscount.parent().show();
					} else {
						$promotionDiscount.parent().hide();
					}
					if (data.couponDiscount > 0) {
						$couponDiscount.text(currency(data.couponDiscount, true));
						$couponDiscount.parent().show();
					} else {
						$couponDiscount.parent().hide();
					}
					if (data.tax > 0) {
						$tax.text(currency(data.tax, true));
						$tax.parent().show();
					} else {
						$tax.parent().hide();
					}
					$amountPayable.text(currency(data.amountPayable, true, true));
				} else {
					$.message(data.message);
					setTimeout(function() {
						location.reload(true);
					}, 3000);
				}
			}
		});
	}
	
	// 订单提交
	$submit.click(function() {
		var paymethod = $('#pay_method').val();
		
		if(setting.isInvoiceEnabled) {
			if ($isInvoice.prop("checked") && $.trim($invoiceTitle.val()) == "") {
				$.message("warn", invoiceTileRequiredMessage);
				return false;
			}
		}
		$.ajax({
			url: "/member/order/create.jhtml",
			type: "POST",
			data: $orderForm.serialize(),
			dataType: "json",
			cache: false,
			beforeSend: function() {
				$submit.prop("disabled", true);
			},
			success: function(message) {
				if (message.type == "success") {
					location.href = "/member/order/payment.jhtml?sn=" + message.content;
				} else {
					$.message(message);
					setTimeout(function() {
						location.reload(true);
					}, 3000);
				}
			},
			complete: function() {
				$submit.prop("disabled", false);
			}
		});
	});
});