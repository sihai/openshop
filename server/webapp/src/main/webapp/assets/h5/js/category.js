$(document).ready(function() {
	var catIds = null;
	var keyword = null;
	var str = $.getParameter('cat_ids');
	if(str) {
		catIds = str.split(",");
	}
	str = $.getParameter('keyword');
	if(str) {
		keyword = decodeURIComponent(str);
		$('#keyword').val(keyword);
	}
	
	search(catIds, keyword, pageNumber, pageSize);
	
	loadmore(function() {
		search(catIds, keyword, ++pageNumber, pageSize);
	});
});