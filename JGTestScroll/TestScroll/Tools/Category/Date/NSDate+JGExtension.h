//
//  NSDate+JGExtension.h
//  EFFICIENCYLOG
//
//  Created by stkcctv on 16/12/20.
//  Copyright © 2016年 JG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (JGExtension)

/**
 *  是否为今年
 */
- (BOOL)isThisYear;

/**
 *  是否为本月
 */
- (BOOL)isThisMonth;

/**
 *  是否为今天
 */
- (BOOL)isToday;

/**
 *  是否为昨天
 */
- (BOOL)isYesterday;

/**
 *  是否为明天
 */
- (BOOL)isTomorrow;


/**
 *  是否超时
 */
- (BOOL)isTimeout;


@end
