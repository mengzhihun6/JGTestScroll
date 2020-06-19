//
//  NSMutableDictionary+JGSafe.m
//  LH_QJ
//
//  Created by 郭军 on 2018/6/14.
//  Copyright © 2018年 JG. All rights reserved.
//

#import "NSMutableDictionary+JGSafe.h"
#import <objc/runtime.h>
#import "NSObject+JGSwizzling.h"
@implementation NSMutableDictionary (JGSafe)
#pragma mark --- init method

+ (void)load {
    //只执行一次这个方法
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 替换 removeObjectForKey:
        NSString *tmpRemoveStr = @"removeObjectForKey:";
        NSString *tmpSafeRemoveStr = @"safeMutable_removeObjectForKey:";
        
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSDictionaryM")
                                     originalSelector:NSSelectorFromString(tmpRemoveStr)                                     swizzledSelector:NSSelectorFromString(tmpSafeRemoveStr)];
        
        
        
        // 替换 setObject:forKey:
        NSString *tmpSetStr = @"setObject:forKey:";
        NSString *tmpSafeSetRemoveStr = @"safeMutable_setObject:forKey:";
        
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSDictionaryM")
                                     originalSelector:NSSelectorFromString(tmpSetStr)                                     swizzledSelector:NSSelectorFromString(tmpSafeSetRemoveStr)];
        
    });
    
}

#pragma mark --- implement method

/**
 根据akey 移除 对应的 键值对
 
 @param aKey key
 */
- (void)safeMutable_removeObjectForKey:(id<NSCopying>)aKey {
    if (!aKey) {
        return;
    }
    [self safeMutable_removeObjectForKey:aKey];
}

/**
 将键值对 添加 到 NSMutableDictionary 内
 
 @param anObject 值
 @param aKey 键
 */
- (void)safeMutable_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (!anObject) {
        return;
    }
    if (!aKey) {
        return;
    }
    return [self safeMutable_setObject:anObject forKey:aKey];
}

@end
