//
//  ViewController.m
//  OfflineLaunchCallback
//
//  Created by Max Goedjen on 6/27/15.
//  Copyright (c) 2015 Max Goedjen. All rights reserved.
//

#import "ViewController.h"

@import SystemConfiguration;

@implementation ViewController

// Will be called if started in Airplane mode on iOS 8.x, but not on 9.x
static void AFNetworkReachabilityCallback(SCNetworkReachabilityRef __unused target, SCNetworkReachabilityFlags flags, void *info) {
    NSLog(@"Hit");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(kCFAllocatorDefault, [@"apple.com" UTF8String]);
    SCNetworkReachabilitySetCallback(reachability, AFNetworkReachabilityCallback, NULL);
    SCNetworkReachabilityScheduleWithRunLoop(reachability, CFRunLoopGetMain(), kCFRunLoopCommonModes);
}

@end
