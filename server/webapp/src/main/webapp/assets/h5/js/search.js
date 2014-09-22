$(document).ready(function() {
	var catIds = null;
	var keyword = null;
	var str = $.getParameter('cat_ids');
	if (str) {
		catIds = str.split(",");
	}
	str = $.getParameter('keyword');
	if (str) {
		keyword = decodeURIComponent(str);
		$('#keyword').val(keyword);
	}

	search(catIds, keyword, pageNumber, pageSize);

	$('#search-form').submit(function() {
		var keyword = $('#keyword').val();
		if (!keyword) {
			//
			return false;
		}
		search(null, keyword, 1, 40);
		return false;
	});
});