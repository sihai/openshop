//
//  Configuration.m
//  openshop
//
//  Created by sihai on 24/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import "Configuration.h"

@implementation Configuration

@synthesize gateway;
@synthesize appkey;
@synthesize secret;

static Configuration* g_configuration = nil;

+(Configuration*) getInstance {
    
    if(!g_configuration) {
        @synchronized(self) {
            if(!g_configuration) {
                Configuration* c = [[Configuration alloc] init];
                c.gateway = @"http://192.168.1.19:8080/api/do.jhtml";
                c.appkey = @"openshop.client.ios";
                c.secret = @"123456789";
                g_configuration = c;
            }
        }
    }
    
    return g_configuration;
}

-(void) dealloc {
    [self.gateway release];
    [self.appkey release];
    [self.secret release];
    [super dealloc];
}

+(void) destroy {
    if(g_configuration) {
        [g_configuration release];
    }
}

@end
