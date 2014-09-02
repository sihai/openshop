//
//  HttpRequest.m
//  openshop
//
//  Created by sihai on 25/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest

@synthesize method;
@synthesize url;
@synthesize headers;
@synthesize parameters;
@synthesize delegate;

-(NSString*) responseString {
    return self._stringResponse;
}

-(NSData*) responseData {
    return self._rawResponse;
}

-(NSError*) error {
    return self._error;
}

-(void) dealloc {
    [self.url release];
    [self.headers release];
    [self.parameters release];
    [self.delegate release];
    [self._stringResponse release];
    [self._rawResponse release];
    [self._error release];
    [super dealloc];
}

-(void) addHeader: (NSString*) value forKey: (NSString*) key {
    if(!self.headers) {
        self.headers = [[NSMutableDictionary alloc] init];
    }
    [self.headers setValue: value forKey: key];
}

-(void) addParameter: (NSString*) value forKey: (NSString*) key {
    if(!self.parameters) {
        self.parameters = [[NSMutableDictionary alloc] init];
    }
    [self.parameters setValue: value forKey: key];
}

-(void) addParameters: (NSDictionary*) dic {
    if(!self.parameters) {
        self.parameters = [[NSMutableDictionary alloc] init];
    }
    [self.parameters setValuesForKeysWithDictionary: dic];
}

- (void)requestStarted:(ASIHTTPRequest *)request {
    
}

- (void)request:(ASIHTTPRequest *)request didReceiveResponseHeaders:(NSDictionary *)responseHeaders {
    
}
- (void)request:(ASIHTTPRequest *)request willRedirectToURL:(NSURL *)newURL {
    
}

- (void)requestFinished:(ASIHTTPRequest *)request {
    self._stringResponse = [request responseString];
    self._rawResponse = [request responseData];
    [self.delegate succeed: self];
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    self._error = [request error];
    [self.delegate failed: self];
}

- (void)requestRedirected:(ASIHTTPRequest *)request {
}

- (void)request:(ASIHTTPRequest *)request didReceiveData:(NSData *)data {
}

- (void)authenticationNeededForRequest:(ASIHTTPRequest *)request {
}

- (void)proxyAuthenticationNeededForRequest:(ASIHTTPRequest *)request {
}

-(void) failed: (NSError*) error {
    self._error = error;
    [self.delegate failed: self];
}

-(void) resultWithASIHttpRequest: (ASIHTTPRequest*) d {
    self._stringResponse = [d responseString];
    self._rawResponse = [d responseData];
    self._error = [d error];
}

-(BOOL) isSucceed {
    return !self._error;
}

@end
