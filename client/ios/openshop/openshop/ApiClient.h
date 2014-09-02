//
//  ApiClient.h
//  openshop
//
//  Created by sihai on 24/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ApiRequest.h"
#import "ApiResponse.h"
#import "ApiRequestDelegate.h"

@interface ApiClient : NSObject

// 获取单例
+(ApiClient*) getInstance;

// 销毁
+(void) destroy;

// 同步请求
-(ApiResponse*) sync: (ApiRequest*) request;

// 异步请求
-(void) async: (ApiRequest*) request delegate: (id<ApiRequestDelegate>) delegate;

@end
