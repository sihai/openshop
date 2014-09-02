$(document).ready(
		function() {

			function connect2JSBridge(callback) {
				if (window.jsbridge) {
					callback(jsbridge);
				} else {
					document.addEventListener('JSBridgeReady', function(event) {
						callback(event.jsbridge);
					}, false);
				}
			};

			connect2JSBridge(function(jsbridge) {
				var uniqueId = 1;

				function log(message, data) {
					alert(uniqueId++ + '. ' + message
							+ (data ? ': ' + JSON.stringify(data) : ''));
				}
				;

				jsbridge.init(function(message) {
					log('JS got a message', message);
				});

				jsbridge.registerHandler('callJS', function(data, response) {
					log('JS handler callJS was called', data);
					response.respondWith({
						'Javascript Says' : 'Not now!'
					});
				});

			});

		});