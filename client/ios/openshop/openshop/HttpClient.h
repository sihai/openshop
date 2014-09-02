//
//  HttpClient.h
//  openshop
//
//  Created by sihai on 25/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequest.h"


@interface HttpClient : NSObject


#define UNSUPPORTED_HTTP_METHOD @"unsupported_http_method"


// 单列
+(HttpClient*) getInstance;

// 同步
-(void) sync: (HttpRequest*) request;

// 异步
-(void) async: (HttpRequest*) request;


@end
