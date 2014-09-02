//
//  Response.h
//  openshop
//
//  Created by sihai on 24/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ERROR_CODE  @"errorCode"
#define ERROR_MSG   @"errorMsg"
#define DATA        @"data"

#define ERROR_TIMEOUT       @"timeout"
#define ERROR_MSG_TIMEOUT   @"超时"

#define ERROR_SERVER_RETURN_UNSUPPORTED_RESPONSE        @"server_return_unsupported_response"
#define ERROR_MSG_SERVER_RETURN_UNSUPPORTED_RESPONSE    @"服务器异常"

#define API_SUCCEED     @"succeed"

@interface ApiResponse : NSObject

@property(strong, nonatomic) NSData*        rawContent;
@property(strong, nonatomic) NSString*      stringContent;
@property(strong, nonatomic) NSDictionary*  data;
@property(strong, nonatomic) NSString*      errorCode;
@property(strong, nonatomic) NSString*      errorMsg;

//
-(ApiResponse*) initWithData: (NSData*) data;

-(ApiResponse*) initWithError: (NSError*) error;

-(BOOL) isSucceed;
@end
