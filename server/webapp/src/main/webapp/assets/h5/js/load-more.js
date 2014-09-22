/**
 * @param callback
 */

var d = 32;

function loadmore(callback) {
	$(window).scroll(function() {
		if ((d + $(window).scrollTop()) >= ($(document).height() - $(window).height())) {
			callback();
		}
	});
}