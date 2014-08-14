//
//  Category.h
//  openshop
//
//  Created by sihai on 13/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cat : NSObject

@property(assign, nonatomic) int id;
@property(strong, nonatomic) NSString* name;

-(Cat*) initWith: (int) id name: (NSString*) name;

@end
