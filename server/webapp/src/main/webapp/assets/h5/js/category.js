var pageNumber = 1;
var pageSize = 40;

$(document)
		.ready(
				function() {

					window.jsbridge
							.callHandler(
									'callApi',
									'com.openteach.openshop.server.product.list',
									'0.0.1',
									{
										'cat_id' : $.getParameter('cat_id'),
										'page_number': pageNumber,
										'page_size': pageSize
									},
									function(response) {
										console
												.log(
														'Got response from com.openteach.openshop.server.product.list',
														response);
										if (response.succeed) {
											//
										} else {
											// TODO
										}
									});
				});