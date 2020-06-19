//
//  QJFormatDateTime.m
//  LH_QJ
//
//  Created by 郭军 on 2018/7/14.
//  Copyright © 2018年 JG. All rights reserved.
//

#import "QJFormatDateTime.h"

#pragma mark - 其他
static NSDateFormatter *fmt_;
static NSCalendar *calendar_;

@implementation QJFormatDateTime


/**
 *  在第一次使用QJFormatDateTime类时调用1次
 */
+ (void)initialize
{
    fmt_ = [[NSDateFormatter alloc] init];
    calendar_ = [NSCalendar calendar];
}


+ (NSString *)FormatDateWithTime:(long)time {
    
    fmt_.dateFormat = @"yyyy年MM月dd日 HH:mm:ss";
    NSDate *createdAtDate = [NSDate dateWithTimeIntervalSince1970:time];

    if (createdAtDate.isThisYear) { // 今年
        
        if (createdAtDate.isToday) { // 今天
            // 手机当前时间
            NSDate *nowDate = [NSDate date];
            NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
            NSDateComponents *cmps = [calendar_ components:unit fromDate:createdAtDate toDate:nowDate options:0];
            
            if (cmps.hour >= 1) { // 时间间隔 >= 1小时
                return [NSString stringWithFormat:@"%zd小时前", cmps.hour];
            } else if (cmps.minute >= 1) { // 1小时 > 时间间隔 >= 1分钟
                return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
            } else { // 1分钟 > 分钟
                return @"刚刚";
            }
        } else if (createdAtDate.isYesterday) { // 昨天
            fmt_.dateFormat = @"昨天 HH:mm:ss";
            return [fmt_ stringFromDate:createdAtDate];
        } else { // 其他
            fmt_.dateFormat = @"MM月dd日 HH:mm:ss";
            return [fmt_ stringFromDate:createdAtDate];
        }

    }else {
        
        return [fmt_ stringFromDate:createdAtDate];
    }
}

@end
