$(document).ready(function() {

                  function connect2JSBridge(callback) {
                  if (window.jsbridge) {
                  callback(jsbridge);
                  } else {
                  document.addEventListener('JSBridgeReady',
                                            function(event) {
                                            callback(event.jsbridge);
                                            },
                                            false);
                  }
                  };
                  
                  connect2JSBridge(function(jsbridge) {
                                   var uniqueId = 1;
                                   
                                   function log(message, data) {
                                   alert(uniqueId++ + '. ' + message + (data ? ': ' + JSON.stringify(data) : ''));
                                   };
                                   
                                   jsbridge.init(function(message) {
                                                 log('JS got a message', message);
                                                 });
                                   
                                   jsbridge.registerHandler('callJS',
                                                            function(data, response) {
                                                            log('JS handler callJS was called', data);
                                                            response.respondWith({
                                                                                 'Javascript Says': 'Not now!'
                                                                                 });
                                                            });
                                   
                                   //调用名为testObjcCallback的native端处理器，并传递参数，同时设置回调处理逻辑
                                   jsbridge.callHandler('callApi', {
                                                        'api_name': 'com.openteach.openshop.server.user.login',
                                                        'api_version': '0.0.1'
                                                        },
                                                        function(response) {
                                                        log('Got response from callApi', response)
                                                        });
                                   
                                   });

});
