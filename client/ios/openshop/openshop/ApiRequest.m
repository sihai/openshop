//
//  Request.m
//  openshop
//
//  Created by sihai on 24/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import "ApiRequest.h"

@implementation ApiRequest

@synthesize apiName;
@synthesize apiVersion;
@synthesize delegate;

-(ApiRequest*) initWithApiName: (NSString*) name apiVersion: (NSString*) v {
    self = [super init];
    if(self) {
        self.apiName = name;
        self.apiVersion = v;
    }
    return self;
}

-(void) dealloc {
    [self.apiName release];
    [self.apiVersion release];
    [self.delegate release];
    [super dealloc];
}

//
-(ApiRequest*) appendParameter: (NSString*) value forKey: (NSString*) key {
    if(!self.parameters) {
        self.parameters = [[NSMutableDictionary alloc] init];
    }
    [self.parameters setObject: value forKey: key];
    return self;
}

-(ApiRequest*) appendParameters: (NSDictionary*) parameters {
    if(!self.parameters) {
        self.parameters = [[NSMutableDictionary alloc] init];
    }
    [self.parameters addEntriesFromDictionary: parameters];
    return self;
}

@end
