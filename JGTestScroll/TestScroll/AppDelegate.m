//
//  AppDelegate.m
//  TestScroll
//
//  Created by spring on 2020/6/18.
//  Copyright © 2020 spring. All rights reserved.
//

#import "AppDelegate.h"
#import "ZYIntegralMallController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ZYIntegralMallController alloc] init]];

    
    [self.window makeKeyAndVisible];

    
    return YES;
}



@end
