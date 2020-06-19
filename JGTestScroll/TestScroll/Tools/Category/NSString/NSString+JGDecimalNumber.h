//
//  NSString+JGDecimalNumber.h
//  LH_QJ
//
//  Created by 郭军 on 2018/5/23.
//  Copyright © 2018年 JG. All rights reserved.
//  处理高进度数字的工具类

#import <Foundation/Foundation.h>

@interface NSString (JGDecimalNumber)

/**
 保留两位小数 如果数值为0则返回-- (而且不四舍五入)
 
 @param value 数值
 @return 结果
 */
+ (NSString *)stringOfDoubleValueAfterPoint:(NSString *)value;


/**
 保留两位小数 如果数值为0则返回0.00 (而且不四舍五入)
 
 @param value 数值
 @return 结果
 */
+ (NSString *)stringOfDoubleValueAfterPointDefaultZero:(NSString *)value;


/**
 保留两位小数 如果数值为0则返回-- 如果最后小数位为0 则去掉 （2.10 变成 2.1, 2.00 变成 2） (而且不四舍五入)
 
 @param value 数值
 @return 结果
 */
+ (NSString *)stringOfDoubleValueAfterPointRemoveEndZero:(NSString *)value;


/**
 保留两位小数 如果数值为0则返回0.00 如果最后小数位为0 则去掉 （2.10 变成 2.1, 2.00 变成 2） (而且不四舍五入)
 
 @param value 数值
 @return 结果
 */
+ (NSString *)stringOfDoubleValueAfterPointDefaultZeroRemoveEndZero:(NSString *)value;


/**
 保留三位小数 如果数值为0则返回-- (而且不四舍五入)
 
 @param value 数值
 @return 结果
 */
+ (NSString *)stringOfThreeValueAfterPoint:(NSString *)value;


/**
 保留三位小数 如果数值为0则返回0.000 (而且不四舍五入)
 
 @param value 数值
 @return 结果
 */
+ (NSString *)stringOfThreeValueAfterPointDefaultZero:(NSString *)value;


/**
 保留三位小数 如果数值为0则返回-- 如果最后小数位为0 则去掉 （2.100 变成 2.1, 2.000 变成 2） (而且不四舍五入)
 
 @param value 数值
 @return 结果
 */
+ (NSString *)stringOfThreeValueAfterPointRemoveEndZero:(NSString *)value;


/**
 保留三位小数 如果数值为0则返回0.000 如果最后小数位为0 则去掉 （2.100 变成 2.1, 2.000 变成 2） (而且不四舍五入)
 
 @param value 数值
 @return 结果
 */
+ (NSString *)stringOfThreeValueAfterPointDefaultZeroRemoveEndZero:(NSString *)value;


/**
 保留2位小数 转换为百分比 如果数值为0 变成--
 
 @param value 数值
 @return 结果
 */
+ (NSString *)stringToPercentageWithDoubleValueAfterPointRemoveEndZero:(NSString *)value;


/**
 保留2位小数 转换为百分比 如果数值为0 变成0.00%
 
 @param value 数值
 @return 结果
 */
+ (NSString *)stringToPercentageWithDoubleValueAfterPointDefaultZero:(NSString *)value;


/**
 保留3位小数 转换为百分比 如果数值为0 变成--
 
 @param value 数值
 @return 结果
 */
+ (NSString *)stringToPercentageWithThreeValueAfterPointRemoveEndZero:(NSString *)value;


/**
 保留3位小数 转换为百分比 如果数值为0 变成0.000%
 
 @param value 数值
 @return 结果
 */
+ (NSString *)stringToPercentageWithThreeValueAfterPointDefaultZero:(NSString *)value;





/**
 *  格式化数字  去掉浮点数后面多余的0
 *  数字小于一万，保持不变:4321-->4321
 *  数字大于一万，且千位无值:40321-->4万
 *  数字大于一万，且千位有值:43210-->4.3万
 */
+ (NSString *)formatNumber:(double)number;




/**
 IOS 人民币单位转换，元 转 万元 转 亿，等等。

 @param string 金额字符串
 @param integer 位数
 @return 结果
 */
+ (NSString *)getDealNumwithstring:(NSString *)string withNumCount:(NSInteger)integer;

@end
