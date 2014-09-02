//
//  Configuration.h
//  openshop
//
//  Created by sihai on 24/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Configuration : NSObject

@property(strong, nonatomic) NSString* gateway;
@property(strong, nonatomic) NSString* appkey;
@property(strong, nonatomic) NSString* secret;

+(Configuration*) getInstance;

+(void) destroy;

@end
