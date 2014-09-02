//
//  Response.m
//  openshop
//
//  Created by sihai on 24/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import "ApiResponse.h"
#import "HttpRequest.h"
#import "JSONKit.h"

@implementation ApiResponse

@synthesize rawContent;
@synthesize stringContent;
@synthesize data;
@synthesize errorCode;
@synthesize errorMsg;

//
-(ApiResponse*) initWithData: (NSData*) d {
    self = [super init];
    if(self) {
        self.rawContent = d;
        NSError* ep = nil;
        self.stringContent = [[NSString alloc] initWithData: d encoding: NSUTF8StringEncoding];
        NSDictionary* dic = [self.stringContent objectFromJSONStringWithParseOptions: JKSerializeOptionNone error: &ep];
        if(ep) {
            self.errorCode = ERROR_SERVER_RETURN_UNSUPPORTED_RESPONSE;
            self.errorMsg = ERROR_MSG_SERVER_RETURN_UNSUPPORTED_RESPONSE;
        } else {
            self.errorCode = [dic valueForKey: ERROR_CODE];
            self.errorMsg = [dic valueForKey: ERROR_MSG];
            self.data = [dic valueForKey: DATA];
        }
        
        //[dic release];
    }
    return self;
}

-(ApiResponse*) initWithError: (NSError*) error {
    self.errorCode = [NSString stringWithFormat: @"%@_%d", error.domain, error.code];
    self.errorMsg = NETWORK_ERROR;
    return self;
}

-(void) dealloc {
    [rawContent release];
    [stringContent release];
    [data release];
    [errorCode release];
    [errorMsg release];
    [super dealloc];
}

-(BOOL) isSucceed {
    return [API_SUCCEED isEqualToString: self.errorCode];
}

@end
