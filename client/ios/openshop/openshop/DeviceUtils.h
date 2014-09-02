//
//  DeviceUtils.h
//  openshop
//
//  Created by sihai on 28/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceUtils : NSObject

//
+(DeviceUtils*) getInstance;

//
-(NSString*) getDeviceId;

//
-(NSString*) getDeviceName;

//
-(NSString*) getSystemName;

//
-(NSString*) getSystemVersion;

@end
