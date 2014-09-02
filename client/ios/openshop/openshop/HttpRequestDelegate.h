//
//  HttpRequestDelegate.h
//  openshop
//
//  Created by sihai on 25/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HttpRequestDelegate <NSObject>

-(void) succeed: (id) request;

-(void) failed: (id) request;

-(void) timeout: (id) request;

@end
