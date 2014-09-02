//
//  RequestDelegate.h
//  openshop
//
//  Created by sihai on 24/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ApiRequestDelegate <NSObject>

// 成功
-(void) succeed: (NSDictionary*) data;

// 失败
-(void) failed: (NSString*) errorCode errorMsg: (NSString*) errorMsg;

// 超时
-(void) timeout;
@end
