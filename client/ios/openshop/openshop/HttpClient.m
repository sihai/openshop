//
//  HttpClient.m
//  openshop
//
//  Created by sihai on 25/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import "HttpClient.h"
#import "HttpRequest.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"

@implementation HttpClient

static HttpClient* g_http_client = nil;

+(HttpClient*) getInstance {
    
    if(!g_http_client) {
        @synchronized(self) {
            if(!g_http_client) {
                HttpClient* hc = [[HttpClient alloc] init];
                g_http_client = hc;
            }
        }
    }
    
    return g_http_client;
}

-(void) dealloc {
    [super dealloc];
}

+(void) destroy {
    [g_http_client release];
}

-(HttpClient*) init {
    return [super init];
}

// 同步
-(void) sync: (HttpRequest*) request {
    if(GET == request.method) {
        // append query string to url
        [HttpClient addURLQueryParameters: request];
        ASIHTTPRequest *ar = [ASIHTTPRequest requestWithURL: [NSURL URLWithString: request.url]];
        // add http headers
        [HttpClient addHeaders: ar httpRequest: request];
        // add http query parameters
        [ar startSynchronous];
        [request resultWithASIHttpRequest: ar];
        //[ar release];
    } else if(POST == request.method) {
        ASIFormDataRequest *afdr = [ASIFormDataRequest requestWithURL: [NSURL URLWithString: request.url]];
        // add http headers
        [HttpClient addHeaders: afdr httpRequest: request];
        // add form data
        [HttpClient addPostQueryParameters: afdr httpRequest: request];
        [afdr startSynchronous];
        [request resultWithASIHttpRequest: afdr];
        //[afdr release];
    } else {
        request._error = [[NSError alloc] initWithDomain: UNSUPPORTED_HTTP_METHOD code: -1 userInfo: nil];
    }
}

// 异步
-(void) async: (HttpRequest*) request {
    if(GET == request.method) {
        // append query string to url
        [HttpClient addURLQueryParameters: request];
        ASIHTTPRequest *ar = [ASIHTTPRequest requestWithURL: [NSURL URLWithString: request.url]];
        // add http headers
        [HttpClient addHeaders: ar httpRequest: request];
        ar.delegate = request;
        [ar startAsynchronous];
        [ar release];
    } else if(POST == request.method) {
        ASIFormDataRequest *afdr = [ASIFormDataRequest requestWithURL: [NSURL URLWithString: request.url]];
        // add http headers
        [HttpClient addHeaders: afdr httpRequest: request];
        // add form data
        [HttpClient addPostQueryParameters: afdr httpRequest: request];
        afdr.delegate = request;
        [afdr startAsynchronous];
        [afdr release];
    } else {
        [request failed: [[NSError alloc] initWithDomain: UNSUPPORTED_HTTP_METHOD code: -1 userInfo: nil]];
    }
}

// 设置系统参数
+(void) addHeaders: (ASIHTTPRequest*) request httpRequest: (HttpRequest*) httpRequest {
    id key = nil;
    NSEnumerator* e =  [httpRequest.headers keyEnumerator];
    while(key = [e nextObject]) {
        [request addRequestHeader: key value: [httpRequest.headers valueForKey: key]];
    }
}

+(void) addURLQueryParameters: (HttpRequest*) httpRequest {
    id key = nil;
    NSEnumerator* e =  [httpRequest.parameters keyEnumerator];
    httpRequest.url = [httpRequest.url stringByAppendingString: @"?"];
    while(key = [e nextObject]) {
        httpRequest.url = [httpRequest.url stringByAppendingFormat: @"%@=%@", key, [httpRequest.parameters valueForKey: key]];
    }
}

+(void) addPostQueryParameters: (ASIFormDataRequest*) request httpRequest: (HttpRequest*) httpRequest {
    id key = nil;
    NSEnumerator* e =  [httpRequest.parameters keyEnumerator];
    while(key = [e nextObject]) {
        [request setPostValue: [httpRequest.parameters valueForKey: key] forKey: key];
    }
}

@end
