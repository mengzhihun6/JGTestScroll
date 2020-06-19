//
//  NSString+JGDecimalNumber.m
//  LH_QJ
//
//  Created by 郭军 on 2018/5/23.
//  Copyright © 2018年 JG. All rights reserved.
//  处理高进度数字的工具类

#import "NSString+JGDecimalNumber.h"

@implementation NSString (JGDecimalNumber)


+ (NSString *)stringOfDoubleValueAfterPoint:(NSString *)value{
    NSDecimalNumber * valueNum = [NSDecimalNumber decimalNumberWithString:value];
    NSDecimalNumberHandler * handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc]init];
    formatter.zeroSymbol = @"--";
    formatter.positiveFormat = @"#.00";
    return [formatter stringFromNumber:[valueNum decimalNumberByRoundingAccordingToBehavior:handler]];
}

+ (NSString *)stringOfDoubleValueAfterPointDefaultZero:(NSString *)value{
    NSDecimalNumber * valueNum = [NSDecimalNumber decimalNumberWithString:value];
    NSDecimalNumberHandler * handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc]init];
    formatter.positiveFormat = @"#.00";
    formatter.zeroSymbol = @"0.00";
    return [formatter stringFromNumber:[valueNum decimalNumberByRoundingAccordingToBehavior:handler]];
}

+ (NSString *)stringOfDoubleValueAfterPointRemoveEndZero:(NSString *)value{
    NSDecimalNumber * valueNum = [NSDecimalNumber decimalNumberWithString:value];
    NSDecimalNumberHandler * handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc]init];
    formatter.zeroSymbol = @"--";
    formatter.maximumFractionDigits = 2;
    return [formatter stringFromNumber:[valueNum decimalNumberByRoundingAccordingToBehavior:handler]];
}

+ (NSString *)stringOfDoubleValueAfterPointDefaultZeroRemoveEndZero:(NSString *)value{
    NSDecimalNumber * valueNum = [NSDecimalNumber decimalNumberWithString:value];
    NSDecimalNumberHandler * handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc]init];
    formatter.zeroSymbol = @"0";
    formatter.maximumFractionDigits = 2;
    return [formatter stringFromNumber:[valueNum decimalNumberByRoundingAccordingToBehavior:handler]];
}

+ (NSString *)stringOfThreeValueAfterPoint:(NSString *)value{
    NSDecimalNumber * valueNum = [NSDecimalNumber decimalNumberWithString:value];
    NSDecimalNumberHandler * handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:3 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc]init];
    formatter.zeroSymbol = @"--";
    formatter.positiveFormat = @"#.000";
    return [formatter stringFromNumber:[valueNum decimalNumberByRoundingAccordingToBehavior:handler]];
}

+ (NSString *)stringOfThreeValueAfterPointDefaultZero:(NSString *)value{
    NSDecimalNumber * valueNum = [NSDecimalNumber decimalNumberWithString:value];
    NSDecimalNumberHandler * handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:3 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc]init];
    formatter.positiveFormat = @"#.000";
    formatter.zeroSymbol = @"0.000";
    return [formatter stringFromNumber:[valueNum decimalNumberByRoundingAccordingToBehavior:handler]];
}

+ (NSString *)stringOfThreeValueAfterPointRemoveEndZero:(NSString *)value{
    NSDecimalNumber * valueNum = [NSDecimalNumber decimalNumberWithString:value];
    NSDecimalNumberHandler * handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:3 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc]init];
    formatter.zeroSymbol = @"--";
    formatter.maximumFractionDigits = 3;
    return [formatter stringFromNumber:[valueNum decimalNumberByRoundingAccordingToBehavior:handler]];
}

+ (NSString *)stringOfThreeValueAfterPointDefaultZeroRemoveEndZero:(NSString *)value{
    NSDecimalNumber * valueNum = [NSDecimalNumber decimalNumberWithString:value];
    NSDecimalNumberHandler * handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:3 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc]init];
    formatter.zeroSymbol = @"0.000";
    formatter.maximumFractionDigits = 3;
    return [formatter stringFromNumber:[valueNum decimalNumberByRoundingAccordingToBehavior:handler]];
}

+ (NSString *)stringToPercentageWithDoubleValueAfterPointRemoveEndZero:(NSString *)value{
    NSDecimalNumber * valueNum = [NSDecimalNumber decimalNumberWithString:value];
    NSDecimalNumberHandler * handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc]init];
    formatter.zeroSymbol = @"--";
    formatter.positiveFormat = @"#.00%";
    return [formatter stringFromNumber:[valueNum decimalNumberByRoundingAccordingToBehavior:handler]];
}

+ (NSString *)stringToPercentageWithDoubleValueAfterPointDefaultZero:(NSString *)value{
    NSDecimalNumber * valueNum = [NSDecimalNumber decimalNumberWithString:value];
    NSDecimalNumberHandler * handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc]init];
    formatter.positiveFormat = @"#.00%";
    formatter.zeroSymbol = @"0.00%";
    return [formatter stringFromNumber:[valueNum decimalNumberByRoundingAccordingToBehavior:handler]];
}

+ (NSString *)stringToPercentageWithThreeValueAfterPointRemoveEndZero:(NSString *)value{
    NSDecimalNumber * valueNum = [NSDecimalNumber decimalNumberWithString:value];
    NSDecimalNumberHandler * handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:3 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc]init];
    formatter.positiveFormat = @"#.000%";
    formatter.zeroSymbol = @"--";
    return [formatter stringFromNumber:[valueNum decimalNumberByRoundingAccordingToBehavior:handler]];
}

+ (NSString *)stringToPercentageWithThreeValueAfterPointDefaultZero:(NSString *)value{
    NSDecimalNumber * valueNum = [NSDecimalNumber decimalNumberWithString:value];
    NSDecimalNumberHandler * handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:3 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc]init];
    formatter.positiveFormat = @"#.000%";
    formatter.zeroSymbol = @"0.000%";
    return [formatter stringFromNumber:[valueNum decimalNumberByRoundingAccordingToBehavior:handler]];
}


/**
 *  格式化数字  去掉浮点数后面多余的0
 *  数字小于一万，保持不变:4321-->4321
 *  数字大于一万，且千位无值:40321-->4万
 *  数字大于一万，且千位有值:43210-->4.3万
 */
+ (NSString *)formatNumber:(double)number{
    
    NSString *result = nil;
    if (number < 10000) {
        
        NSString *outNumber = [NSString stringWithFormat:@"%.2f", number];
        result = [NSString stringWithFormat:@"%@",@(outNumber.floatValue)];
    }else {
        
        NSString *outNumber = [NSString stringWithFormat:@"%.2f", number /10000.0];
         result = [NSString stringWithFormat:@"%@万",@(outNumber.floatValue)];
    }
    
    // 假设为"4.0万"，把".0"去掉
//    result = [result stringByReplacingOccurrencesOfString:@".00" withString:@""];
    return result;
}




+ (NSString *)getDealNumwithstring:(NSString *)string withNumCount:(NSInteger)integer{
    
    NSDecimalNumber *numberA = [NSDecimalNumber decimalNumberWithString:string];
    NSDecimalNumber *numberB ;
    if (integer == 4) {
        numberB =  [NSDecimalNumber decimalNumberWithString:@"10000"];
    } else if (integer == 8){
        numberB =  [NSDecimalNumber decimalNumberWithString:@"100000000"];
    }else{
        numberB =  [NSDecimalNumber decimalNumberWithString:@"10000"];
    }
    //NSDecimalNumberBehaviors对象的创建  参数 1.RoundingMode 一个取舍枚举值 2.scale 处理范围 3.raiseOnExactness  精确出现异常是否抛出原因 4.raiseOnOverflow  上溢出是否抛出原因  4.raiseOnUnderflow  下溢出是否抛出原因  5.raiseOnDivideByZero  除以0是否抛出原因。
    NSDecimalNumberHandler *roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    
    /// 这里不仅包含Multiply还有加 减 乘。
    NSDecimalNumber *numResult = [numberA decimalNumberByDividingBy:numberB withBehavior:roundingBehavior];
    NSString *strResult = [numResult stringValue];
    return strResult;
}



@end
