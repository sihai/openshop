//
//  DeviceUtils.m
//  openshop
//
//  Created by sihai on 28/8/14.
//  Copyright (c) 2014 openteach inc. All rights reserved.
//

#import "DeviceUtils.h"

static DeviceUtils* g_device_utils = nil;

@interface DeviceUtils () {
    NSString* _deviceId;
    NSString* _deviceName;
    NSString* _systemName;
    NSString* _systemVersion;
}

@end

@implementation DeviceUtils

//
+(DeviceUtils*) getInstance {
    if(!g_device_utils) {
        @synchronized(self) {
            if(!g_device_utils) {
                DeviceUtils* du = [[DeviceUtils alloc] init];
                [du loadSysInfo];
                g_device_utils = du;
            }
        }
    }
    
    return g_device_utils;
}

-(void) dealloc {
    [_deviceId release];
    [_deviceName release];
    [_systemName release];
    [_systemVersion release];
    [super dealloc];
}

-(void) loadSysInfo {
    _deviceId = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    _deviceName = [[UIDevice currentDevice] model];
    _systemName = [[UIDevice currentDevice] systemName];
    _systemVersion = [[UIDevice currentDevice] systemVersion];
}

//
-(NSString*) getDeviceId {
    return _deviceId;
}

//
-(NSString*) getDeviceName {
    return _deviceName;
}

//
-(NSString*) getSystemName {
    return _systemName;
}

//
-(NSString*) getSystemVersion {
    return _systemVersion;
}
@end
