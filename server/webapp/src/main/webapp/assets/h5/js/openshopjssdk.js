;
(function() {

	var gateway = 'http://www.openshop.com:8080/api/do.jhtml';
	var appkey = 'openshop.client.h5.appkey';
	var deviceId = 'openshop.client.h5.deviceId';
	var deviceName = 'openshop.client.h5.deviceName';
	var systemName = 'openshop.client.h5.systemName';
	var systemVersion = 'openshop.client.h5.systemVersion';
	
	if (window.jsbridge) {
		return
	}
	
	//alert('try to init openshopjssdk');
	
	var jsbridge = {
			init: function() {
				
			},
			registerHandler: function(name, handler) {
				
			},
			callHandler: function(handlerName, apiName, apiVersion, parameters, callback) {
			
				//alert(handlerName + " " + apiName + " " + apiVersion + " " + parameters + " " + callback);
				if('callApi' == handlerName) {
					jQuery.ajax( {
						 url: gateway,
						 type: 'post',
						 timeout: 10000,
						 headers: {
							 'o-appkey': appkey, 
							 'o-device-id': deviceId, 
							 'o-device-name': deviceName,
							 'o-system-name': systemName,
							 'o-system-version': systemVersion, 
							 'o-api-name': apiName, 
							 'o-api-version': apiVersion},
						 dataType: "json",
						 data: {'biz_parameters': JSON.stringify(parameters)},
						 success: function(data, textStatus){
							 callback(data);
						 },
						 error: function(xhr, textStatus, errorThrown){
							 callback({'succeed': false, 'errorCode': 'UNKNOWN_ERROR', errorMsg: '未知错误'});
						 }
					 } );
				}
			}
	};
	
	window.jsbridge = jsbridge;
	
	var readyEvent = window.document.createEvent('Events');
    readyEvent.initEvent('JSBridgeReady', false, true);
    readyEvent.jsbridge = jsbridge;
    window.document.dispatchEvent(readyEvent);

})();
