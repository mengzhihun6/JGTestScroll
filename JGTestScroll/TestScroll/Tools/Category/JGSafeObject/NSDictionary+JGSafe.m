//
//  NSDictionary+JGSafe.m
//  LH_QJ
//
//  Created by 郭军 on 2018/6/14.
//  Copyright © 2018年 JG. All rights reserved.
//

#import "NSDictionary+JGSafe.h"
#import <objc/runtime.h>
#import "NSObject+JGImpChangeTool.h"

@implementation NSDictionary (JGSafe)

+ (void)load{
    [self SwizzlingMethod:@"initWithObjects:forKeys:count:" systemClassString:@"__NSPlaceholderDictionary" toSafeMethodString:@"initWithObjects_st:forKeys:count:" targetClassString:@"NSDictionary"];
}
-(instancetype)initWithObjects_st:(id *)objects forKeys:(id<NSCopying> *)keys count:(NSUInteger)count {
    NSUInteger rightCount = 0;
    for (NSUInteger i = 0; i < count; i++) {
        if (!(keys[i] && objects[i])) {
            break;
        }else{
            rightCount++;
        }
    }
    self = [self initWithObjects_st:objects forKeys:keys count:rightCount];
    return self;
}


@end
