//
//  JSBridgeWebView.h
//  openshop
//
//  Created by sihai on 14/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSBridge.h"

@interface JSBridgeWebView : UIViewController <UIWebViewDelegate>

@property(strong, nonatomic) JSBridge* jsbridge;
@property(strong, nonatomic) UIWebView* webview;

@end
