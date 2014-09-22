/**
 * openshopjssdk
 */

function initopenshopjssdk () {
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
}

jQuery(document).ready(function(){
	initopenshopjssdk();
});

//
