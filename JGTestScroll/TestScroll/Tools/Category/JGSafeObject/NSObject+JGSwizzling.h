//
//  NSObject+JGSwizzling.h
//  LH_QJ
//
//  Created by 郭军 on 2018/6/14.
//  Copyright © 2018年 JG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JGSwizzling)

+ (void)exchangeInstanceMethodWithSelfClass:(Class)selfClass
                           originalSelector:(SEL)originalSelector
                           swizzledSelector:(SEL)swizzledSelector;

@end
