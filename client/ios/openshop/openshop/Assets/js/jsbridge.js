; (function() {

        if (window.jsbridge) {
                return
        }
        var jsbridgeIframe;
        var sendMessageQueue = [];
        var receiveMessageQueue = [];
        var messageHandlers = {};

        var JSBRIDGE_SCHEMA = 'jsbridge';
        var QUEUE_HAS_MESSAGE = '__JSBRIDGE_QUEUE_MESSAGE__';

        var responseCallbacks = {};
        var uniqueId = 1;

        function _createQueueReadyIframe(doc) {
                jsbridgeIframe = doc.createElement('iframe');
                jsbridgeIframe.style.display = 'none';
                jsbridgeIframe.src = JSBRIDGE_SCHEMA + '://' + QUEUE_HAS_MESSAGE;
                doc.documentElement.appendChild(jsbridgeIframe);
        }

        function init(messageHandler) {
                if (jsbridge._messageHandler) {
                        throw new Error('jsbridge.init called twice');
                }
                jsbridge._messageHandler = messageHandler;
                var receivedMessages = receiveMessageQueue;
                receiveMessageQueue = null;
                for (var i = 0; i < receivedMessages.length; i++) {
                        _dispatchMessageFromObjC(receivedMessages[i]);
                }
        }

        function send(data, responseCallback) {
                _doSend({
                        data: data
                },
                responseCallback);
        }

        function registerHandler(handlerName, handler) {
                messageHandlers[handlerName] = handler;
        }

        function callHandler(handlerName, data, responseCallback) {
                _doSend({
                        handlerName: handlerName,
                        data: data
                },
                responseCallback);
        }

        function _doSend(message, responseCallback) {
                if (responseCallback) {
                        var callbackId = 'cb_' + (uniqueId++) + '_' + new Date().getTime();
                        responseCallbacks[callbackId] = responseCallback;
                        message['callbackId'] = callbackId;
                }
                sendMessageQueue.push(message);
                jsbridgeIframe.src = JSBRIDGE_SCHEMA + '://' + QUEUE_HAS_MESSAGE;
        }

        function _fetchQueue() {
                var messageQueueString = JSON.stringify(sendMessageQueue);
                sendMessageQueue = [];
                return messageQueueString;
        }

        function _dispatchMessageFromObjC(messageJSON) {
                setTimeout(function _timeoutDispatchMessageFromObjC() {
                        var message = JSON.parse(messageJSON);
                        var messageHandler;

                        if (message.responseId) {
                                var responseCallback = responseCallbacks[message.responseId];
                                if (!responseCallback) {
                                        return;
                                }
                                responseCallback(message.responseData);
                                delete responseCallbacks[message.responseId];
                        } else {
                                var responseCallback;
                                if (message.callbackId) {
                                        var callbackResponseId = message.callbackId;
                                        responseCallback = function(responseData) {
                                                _doSend({
                                                        responseId: callbackResponseId,
                                                        responseData: responseData
                                                });
                                        }
                                }

                                var handler = jsbridge._messageHandler;
                                if (message.handlerName) {
                                        handler = messageHandlers[message.handlerName];
                                }

                                try {
                                        handler(message.data, responseCallback)
                                } catch(exception) {
                                        if (typeof console != 'undefined') {
                                                console.log("jsbridge: WARNING: javascript handler threw.", message, exception)
                                        }
                                }
                        }
                });
        }

        function _handleMessageFromObjC(messageJSON) {
                if (receiveMessageQueue) {
                        receiveMessageQueue.push(messageJSON);
                } else {
                        _dispatchMessageFromObjC(messageJSON);
                }
        }

        window.jsbridge = {
                init: init,
                send: send,
                registerHandler: registerHandler,
                callHandler: callHandler,
                _fetchQueue: _fetchQueue,
                _handleMessageFromObjC: _handleMessageFromObjC
        };

        var doc = document;
        _createQueueReadyIframe(doc);
        var readyEvent = doc.createEvent('Events');
        readyEvent.initEvent('JSBridgeReady');
        readyEvent.jsbridge = jsbridge;
        doc.dispatchEvent(readyEvent);
})();
