//
//  Category.m
//  openshop
//
//  Created by sihai on 13/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import "Cat.h"

@implementation Cat

@synthesize id;
@synthesize name;

-(Cat*) initWith: (int) id name: (NSString*) name
{
    self.id = id;
    self.name = name;
    return self;
}

@end
