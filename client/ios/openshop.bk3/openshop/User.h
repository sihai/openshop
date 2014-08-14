//
//  User.h
//  openshop
//
//  Created by sihai on 14/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(assign, nonatomic) long long id;          // id
@property(strong, nonatomic) NSString* name;        // name
@property(strong, nonatomic) NSDate*   birthday;    // birthday

@end
