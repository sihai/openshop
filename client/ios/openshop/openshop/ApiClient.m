//
//  ApiClient.m
//  openshop
//
//  Created by sihai on 24/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import "ApiClient.h"
#import "Configuration.h"
#import "DeviceUtils.h"
#import "HttpRequest.h"
#import "HttpClient.h"

static ApiClient* g_api_client = nil;

@interface HttpRequestDelegateImpl : NSObject <HttpRequestDelegate>

-(HttpRequestDelegateImpl*) initWithApiRequestDelegate: (id<ApiRequestDelegate>) delegate;
    @property(strong, nonatomic) id<ApiRequestDelegate> delegate;
@end

@implementation HttpRequestDelegateImpl

-(HttpRequestDelegateImpl*) initWithApiRequestDelegate: (id<ApiRequestDelegate>) delegate {
    self = [super init];
    if(self) {
        self.delegate = delegate;
    }
    return self;
}

-(void) dealloc {
    [self.delegate release];
    [super dealloc];
}

// HttpRequestDelegate
-(void) succeed: (id) request {
    ApiResponse* ar = [[ApiResponse alloc] initWithData: ((HttpRequest*)request).responseData];
    if(ar.isSucceed) {
        [self.delegate succeed: ar.data];
    } else {
        [self.delegate failed: ar.errorCode errorMsg: ar.errorMsg];
    }
    [ar release];
}

-(void) failed: (id) request {
    NSError* error = ((HttpRequest*)request)._error;
    [self.delegate failed: [NSString stringWithFormat: @"%@_%d" , error.domain, error.code] errorMsg: NETWORK_ERROR];
}

-(void) timeout: (id) request {
    NSError* error = ((HttpRequest*)request)._error;
    [self.delegate failed: [NSString stringWithFormat: @"%@_%d" , error.domain, error.code] errorMsg: NETWORK_TIMEOUT];
}


@end

@implementation ApiClient

+(ApiClient*) getInstance {
    
    if(!g_api_client) {
        @synchronized(self) {
            if(!g_api_client) {
                ApiClient* ac = [[ApiClient alloc] init];
                g_api_client = ac;
            }
        }
    }
    
    return g_api_client;
}

+(void) destroy {
    if(g_api_client) {
        [g_api_client release];
    }
}

-(void) dealloc {
    [super dealloc];
}

// 同步请求
-(ApiResponse*) sync: (ApiRequest*) request {
    ApiResponse* ar = nil;
    HttpRequest* hr = [ApiClient apiRequest2HttpRequest: request delegate: nil];
    [[HttpClient getInstance] sync: hr];
    if([hr isSucceed]) {
        ar = [[ApiResponse alloc] initWithData: hr.responseData];
    } else {
        ar = [[ApiResponse alloc] initWithError: hr.error];
    }
    return ar;
}

// 异步请求
-(void) async: (ApiRequest*) request delegate: (id<ApiRequestDelegate>) delegate {
    HttpRequest* hr = [ApiClient apiRequest2HttpRequest: request delegate: delegate];
    [[HttpClient getInstance] async: hr];
    [hr release];
}

//
+(HttpRequest*) apiRequest2HttpRequest: (ApiRequest*) ar delegate: (id<ApiRequestDelegate>) delegate {
    DeviceUtils* du = [DeviceUtils getInstance];
    Configuration* c = [Configuration getInstance];
    HttpRequest* hr = [[HttpRequest alloc] init ];
    hr.url = c.gateway;
    hr.method = POST;
    hr.delegate = [[HttpRequestDelegateImpl alloc] initWithApiRequestDelegate: delegate];
    [hr addHeader: c.appkey forKey: HTTP_HEADER_APPKEY];
    [hr addHeader: ar.apiName forKey: HTTP_HEADER_API_NAME];
    [hr addHeader: ar.apiVersion forKey: HTTP_HEADER_API_VERSION];
    [hr addHeader: [du getDeviceId ] forKey: HTTP_HEADER_DEVICE_ID];
    [hr addHeader: [du getDeviceName] forKey: HTTP_HEADER_DEVICE_NAME];
    [hr addHeader: [du getSystemName] forKey: HTTP_HEADER_SYSTEM_NAME];
    [hr addHeader: [du getSystemVersion] forKey: HTTP_HEADER_SYSTEM_VERSION];
    [hr addParameters: ar.parameters];
    return hr;
}

@end
