//
//  Request.h
//  openshop
//
//  Created by sihai on 24/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiRequestDelegate.h"

#define API_NAME        @"api_name"
#define API_VERSION     @"api_version"
#define BIZ_PARAMETERS  @"biz_parameters"

@interface ApiRequest : NSObject

@property(strong, nonatomic) NSString* apiName;
@property(strong, nonatomic) NSString* apiVersion;
@property(strong, nonatomic) id<ApiRequestDelegate> delegate;

@property(strong, nonatomic) NSMutableDictionary* parameters;

//
-(ApiRequest*) initWithApiName: (NSString*) name apiVersion: (NSString*) v;

//
-(ApiRequest*) appendParameter: (NSString*) value forKey: (NSString*) key;

//
-(ApiRequest*) appendParameters: (NSDictionary*) parameters;

@end
