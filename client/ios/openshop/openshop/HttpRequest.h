//
//  HttpRequest.h
//  openshop
//
//  Created by sihai on 25/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequestDelegate.h"
#import "ASIHTTPRequest.h"
#import "ASIHTTPRequestDelegate.h"

typedef enum {
    GET,
    POST
} HttpMethod;

#define NETWORK_ERROR       @"网络错误"
#define NETWORK_TIMEOUT     @"网络超时"

#define HTTP_GET    @"get"
#define HTTP_POST   @"post"

#define HTTP_HEADER_APPKEY              @"o-appkey"
#define HTTP_HEADER_API_NAME            @"o-api-name"
#define HTTP_HEADER_API_VERSION         @"o-api-version"
#define HTTP_HEADER_DEVICE_ID           @"o-device-id"
#define HTTP_HEADER_DEVICE_NAME         @"o-device-name"
#define HTTP_HEADER_SYSTEM_NAME         @"o-system-name"
#define HTTP_HEADER_SYSTEM_VERSION      @"o-system-version"


@interface HttpRequest : NSObject <ASIHTTPRequestDelegate>

@property(nonatomic) HttpMethod method;
@property(strong, nonatomic) NSString* url;
@property(strong, nonatomic) NSDictionary* headers;
@property(strong, nonatomic) NSDictionary* parameters;

//
@property(strong, nonatomic, retain) NSString* _stringResponse;
@property(strong, nonatomic, retain) NSData*   _rawResponse;
@property(strong, nonatomic, retain) NSError*  _error;

@property(strong, nonatomic) id<HttpRequestDelegate> delegate;

-(void) addHeader: (NSString*) value forKey: (NSString*) key;

-(void) addParameter: (NSString*) value forKey: (NSString*) key;

-(void) addParameters: (NSDictionary*) dic;

-(NSString*) responseString;

-(NSData*) responseData;

-(NSError*) error;

-(void) failed: (NSError*) error;

-(void) resultWithASIHttpRequest: (ASIHTTPRequest*) d;

-(BOOL) isSucceed;

@end
