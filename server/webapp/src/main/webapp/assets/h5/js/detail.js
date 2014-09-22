function draw(p) {
	
}

$(document)
		.ready(
				function() {

					window.jsbridge
							.callHandler(
									'callApi',
									'com.openteach.openshop.server.product.get',
									'0.0.1',
									{
										'pid' : $.getParameter('pid')
									},
									function(response) {
										console
												.log('Got response from com.openteach.openshop.server.product.get', response);
										if (response.succeed) {
											draw(response.data);
										} else {
											// TODO
										}
									});
				});