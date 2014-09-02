//
//  JSBridgeWebView.m
//  openshop
//
//  Created by sihai on 14/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import "JSBridgeWebView.h"
#import "JSBridge.h"
#import "ApiRequest.h"
#import "ApiClient.h"


@interface ApiRequestDelegateImpl : NSObject <ApiRequestDelegate>

    @property(strong, nonatomic) JSBridgeResponseCallback callback;

    -(ApiRequestDelegateImpl*) initWithCallback: (JSBridgeResponseCallback) callback;
@end

@implementation ApiRequestDelegateImpl

-(ApiRequestDelegateImpl*) initWithCallback: (JSBridgeResponseCallback) callback {
    self = [super init];
    if(self) {
        self.callback = callback;
    }
    return self;
}

-(void) dealloc {
    [self.callback release];
    [super dealloc];
}

// 成功
-(void) succeed: (NSDictionary*) data {
    self.callback(data);
}

// 失败
-(void) failed: (NSString*) errorCode errorMsg: (NSString*) errorMsg {
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] initWithObjects: [[NSMutableArray alloc] initWithObjects: errorCode, errorMsg, nil] forKeys: [[NSMutableArray alloc] initWithObjects: ERROR_CODE, ERROR_MSG, nil]];
    self.callback(dic);
    NSLog(@"call api failed:%@", dic);
    [dic release];
}

// 超时
-(void) timeout {
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] initWithObjects: [[NSMutableArray alloc] initWithObjects: ERROR_TIMEOUT, ERROR_MSG_TIMEOUT, nil] forKeys: [[NSMutableArray alloc] initWithObjects: ERROR_CODE, ERROR_MSG, nil]];
    self.callback(dic);
    [dic release];
}

@end

@implementation JSBridgeWebView

@synthesize jsbridge;
@synthesize webview;


- (void) dealloc
{
    if(jsbridge) {
        [jsbridge release];
    }
    if(webview) {
        [webview release];
    }
    [super dealloc];
}

- (void)viewDidLoad
{
    
}

- (void) viewDidAppear:(BOOL)animated
{
    if (self.jsbridge)
    {
        return;
    }
    
    self.webview = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview: self.webview];
    
    // 初始化jsbridge
    
    //启用日志记录
    [JSBridge enableLogging];
    
    //实例化WebViewJavascriptBridge并定义native端的默认消息处理器
    self.jsbridge = [JSBridge bridgeForWebView: self.webview handler:^(id data, JSBridgeResponseCallback callback)
                {
                    NSLog(@"Native received message from JS: %@", data);
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Native got message from Javascript:" message:data delegate:nil cancelButtonTitle: @"OK" otherButtonTitles:nil];
                    [alert show];
                }];
    
    //注册一个供UI端调用的名为callApi的处理器，并定义用于响应的处理逻辑
    [self.jsbridge registerHandler:@"callApi" handler:^(id data, JSBridgeResponseCallback callback)
     {
         NSLog(@"callApi called: %@", data);
         ApiRequestDelegateImpl* delegate = [[ApiRequestDelegateImpl alloc] initWithCallback: callback];
         //callback(@"Response from callApi");
         NSDictionary* dic = (NSDictionary*) data;
         ApiRequest* ar = [[ApiRequest alloc] initWithApiName: [dic valueForKey: API_NAME] apiVersion: [dic valueForKey: API_VERSION]];
         [ar appendParameters: [dic valueForKey: BIZ_PARAMETERS]];
         //[[ApiClient getInstance] async: ar delegate: ];
         ApiResponse* r = [[ApiClient getInstance] sync: ar];
         if(r.isSucceed) {
             [delegate succeed: r.data];
         } else {
             [delegate failed: r.errorCode errorMsg: r.errorMsg];
         }
         [delegate release];
         [r release];
         [ar release];
     }];
    
    NSString* htmlPath = [[NSBundle mainBundle] pathForResource:@"main" ofType:@"html"];
    NSString* appHtml = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    NSURL *baseURL = [NSURL fileURLWithPath:htmlPath];
    [self.webview loadHTMLString:appHtml baseURL:baseURL];
}

- (void)webViewDidStartLoad:(UIWebView *)webview
{
    NSLog(@"webViewDidStartLoad");
}

- (void)webViewDidFinishLoad:(UIWebView *)webview
{
    NSLog(@"webViewDidFinishLoad");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
