//
//  JSBridge.h
//  openshop
//
//  Created by sihai on 14/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define JSBRIDGE_SCHEMA             @"jsbridge"
#define JSBRIDGE_QUEUE_MESSAGE      @"__JSBRIDGE_QUEUE_MESSAGE__"

#ifndef __IPHONE_OS_VERSION_MAX_ALLOWED
    #define __IPHONE_OS_VERSION_MAX_ALLOWED
#endif

#if defined __MAC_OS_X_VERSION_MAX_ALLOWED
    #import <WebKit/WebKit.h>
    #define JSBRIDGE_PLATFORM_OSX
    #define JSBRIDGE_WEBVIEW_TYPE WebView
    #define JSBRIDGE_WEBVIEW_DELEGATE_TYPE NSObject
#elif defined __IPHONE_OS_VERSION_MAX_ALLOWED
    #define JSBRIDGE_PLATFORM_IOS
    #define JSBRIDGE_WEBVIEW_TYPE UIWebView
    #define JSBRIDGE_WEBVIEW_DELEGATE_TYPE NSObject<UIWebViewDelegate>
#endif

typedef void (^JSBridgeResponseCallback)(id response);
typedef void (^JSBridgeHandler)(id data, JSBridgeResponseCallback response);

@interface JSBridge : JSBRIDGE_WEBVIEW_DELEGATE_TYPE

+ (instancetype) bridgeForWebView: (JSBRIDGE_WEBVIEW_TYPE*) webView handler: (JSBridgeHandler) handler;

+ (instancetype) bridgeForWebView: (JSBRIDGE_WEBVIEW_TYPE*) webView webViewDelegate: (JSBRIDGE_WEBVIEW_DELEGATE_TYPE*)webViewDelegate handler: (JSBridgeHandler) handler;

+ (instancetype) bridgeForWebView: (JSBRIDGE_WEBVIEW_TYPE*) webView webViewDelegate: (JSBRIDGE_WEBVIEW_DELEGATE_TYPE*) webViewDelegate handler:(JSBridgeHandler) handler resourceBundle: (NSBundle*) bundle;

+ (void) enableLogging;

- (void) send: (id) message;

- (void) send: (id) message responseCallback: (JSBridgeResponseCallback) responseCallback;

- (void) registerHandler: (NSString*) handlerName handler: (JSBridgeHandler)handler;

- (void) callHandler: (NSString*) handlerName;

- (void) callHandler: (NSString*) handlerName data: (id) data;

- (void) callHandler: (NSString*) handlerName data: (id) data responseCallback: (JSBridgeResponseCallback) responseCallback;

- (void) reset;

@end
