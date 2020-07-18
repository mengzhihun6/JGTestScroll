//
//  UIStatusBarManager+JGTap.m
//  WSCollege
//
//  Created by spring on 2020/7/11.
//  Copyright © 2020 JG. All rights reserved.
//

#import "UIStatusBarManager+JGTap.h"

#if TARGET_OS_IPHONE
#import <objc/runtime.h>
#import <objc/message.h>
#else
#import <objc/objc-class.h>
#endif


@implementation UIStatusBarManager (JGTap)

+ (void)load
{
    Method orignalMethod = class_getInstanceMethod(self, @selector(handleTapAction:));
    Method swizzledMethod = class_getInstanceMethod(self, @selector(statusBarTouchedAction:));
    method_exchangeImplementations(orignalMethod, swizzledMethod);
}

- (void)statusBarTouchedAction:(id)sender{
    [self statusBarTouchedAction:sender];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"JGStatusBarTappedNotification" object:nil];
}



@end
