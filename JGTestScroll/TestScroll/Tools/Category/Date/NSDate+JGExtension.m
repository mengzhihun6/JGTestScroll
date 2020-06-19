//
//  NSDate+JGExtension.m
//  EFFICIENCYLOG
//
//  Created by stkcctv on 16/12/20.
//  Copyright © 2016年 JG. All rights reserved.
//

#import "NSDate+JGExtension.h"

@implementation NSDate (JGExtension)

- (BOOL)isThisYear
{
    // 判断self这个日期是否为今年
    NSCalendar *calendar = [NSCalendar calendar];
    
    // 年
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return selfYear == nowYear;
}


- (BOOL)isThisMonth
{
    // 判断self这个日期是否为今天
    NSCalendar *calendar = [NSCalendar calendar];
    
    // 获得年月日元素
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth;
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    return selfCmps.year == nowCmps.year
    && selfCmps.month == nowCmps.month;
}



- (BOOL)isToday
{
    // 判断self这个日期是否为今天
    NSCalendar *calendar = [NSCalendar calendar];
    
    // 获得年月日元素
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    return selfCmps.year == nowCmps.year
    && selfCmps.month == nowCmps.month
    && selfCmps.day == nowCmps.day;
}

- (BOOL)isYesterday
{
    // 判断self这个日期是否为昨天
    
    // self == 2016-10-31 23:07:08 -> 2016-10-31 00:00:00
    // now  == 2016-11-01 14:39:20 -> 2016-11-01 00:00:00
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";
    
    NSString *selfString = [fmt stringFromDate:self]; // 20161031
    NSString *nowString = [fmt stringFromDate:[NSDate date]]; // 20161101
    
    NSDate *selfDate = [fmt dateFromString:selfString]; // 2016-10-31 00:00:00
    NSDate *nowDate = [fmt dateFromString:nowString]; // 2016-11-01 00:00:00
    
    NSCalendar *calendar = [NSCalendar calendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == 1;
}

- (BOOL)isTomorrow
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";
    
    NSString *selfString = [fmt stringFromDate:self]; // 20161031
    NSString *nowString = [fmt stringFromDate:[NSDate date]]; // 20161101
    
    NSDate *selfDate = [fmt dateFromString:selfString]; // 2016-10-31 00:00:00
    NSDate *nowDate = [fmt dateFromString:nowString]; // 2016-11-01 00:00:00
    
    NSCalendar *calendar = [NSCalendar calendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == -1;
}

- (BOOL)isTimeout {
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd HH:mm";
    
    NSString *selfString = [fmt stringFromDate:self];
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    
    NSDate *selfDate = [fmt dateFromString:selfString];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    NSComparisonResult result = [selfDate compare:nowDate];
    
//        JGLog(@"%@ ---  %@",selfDate, nowDate);
//        JGLog(@"-----   %ld",result);
    
    return result==-1;
}


@end
