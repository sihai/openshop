var pageNumber = 1;
var pageSize = 4;

function pclick(id) {
	var _this = $(this);
	window.location.href = '/h5/detail.html?pid=' + id;
}

function customize(id) {
	var _this = $(this);
	window.location.href = '/h5/customize.html?pid=' + id;
}

function appendProducts(data) {
	var length = data.content.length;
	for (var i = 0; i < length; i++) {
		appendProduct(data.content[i]);
	}
}

function appendProduct(p) {
	var html = '<div class="block_module paper_bh_white">';
	html +=			'<div class="clickable" onclick="pclick(' + p.id + ')">';
	html += 			'<div class="title-bar">';
	html += 				'<h2>' + p.name + '</h2>';
	html += 			'</div>';
	html += 			'<div style="padding:8px 8px;">'
	html += 				'<img class="stretch" alt="" src="' + (null != p.thumbnail ? p.thumbnail.replace('www.aigechibaole.com', '10.68.176.238') : p.image.replace('www.aigechibaole.com', '10.68.176.238')) + '" />';
	html += 			'</div>';
	html += 			'<h2>定制价格：￥' + p.price + '</h2>';
	html += 			'<div class="content_container">';
	html += 				p.recommendReason;
	html += 			'</div>';
	html +=			'</div>';
	html += 		'<div class="action-bar">';
	html += 			'<a href="#" class="customize-now btn" onclick="customize(' + p.id + ')">立即定制</a>'
	html += 		'</div>';
	html += 	'</div>';

	$('#product-list').append(html);
}

/**
 * 
 */
function search(catIds, keyword, pageNumber, pageSize) {
	window.jsbridge
			.callHandler(
					'callApi',
					'com.openteach.openshop.server.product.search',
					'0.0.1',
					{
						'cat_ids' : null == catIds ? [] : catIds,
						'keyword' : null == keyword ? "" : keyword,
						'page_number' : pageNumber,
						'page_size' : pageSize
					},
					function(response) {
						console
								.log(
										'Got response from com.openteach.openshop.server.product.search',
										response);
						if (response.succeed) {
							//
							appendProducts(response.data);
						} else {
							// TODO
						}
					});
}

function hidesubmenu() {
	$(".submenu").each(function() {
		var _this = $(this);
		_this.hide();
	});
}

$(document).ready(function() {
	$('#search-form-s').submit(function() {
		var keyword = encodeURIComponent($('#keyword-s').val());
		$('#keyword-s').val(keyword);
		return true;
	});

	/*
	$("body").click(function(e) {
		e = e || window.event;
		var target = $(e.target || e.srcElement);
		if (target.closest(".submenu").length == 0) {
			alert('body');
			hidesubmenu();
			return true;
		}
		return true;
	})
	*/
});