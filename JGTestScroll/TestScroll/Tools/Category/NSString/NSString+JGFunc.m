//
//  NSString+JGFunc.m
//  LH_QJ
//
//  Created by 郭军 on 2018/9/29.
//  Copyright © 2018年 JG. All rights reserved.
//

#import "NSString+JGFunc.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (JGFunc)


//MD5加密
- (NSString *)jg_md5String {
    //1.首先将字符串转换成UTF-8编码, 因为MD5加密是基于C语言的,所以要先把字符串转化成C语言的字符串
    const char *fooData = [self UTF8String];
    
    //2.然后创建一个字符串数组,接收MD5的值
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    //3.计算MD5的值, 这是官方封装好的加密方法:把我们输入的字符串转换成16进制的32位数,然后存储到result中
    CC_MD5(fooData, (CC_LONG)strlen(fooData), result);
    /**
     第一个参数:要加密的字符串
     第二个参数: 获取要加密字符串的长度
     第三个参数: 接收结果的数组
     */
    
    //4.创建一个字符串保存加密结果
    NSMutableString *saveResult = [NSMutableString string];
    
    //5.从result 数组中获取加密结果并放到 saveResult中
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [saveResult appendFormat:@"%02x", result[i]];
    }
    /*
     x表示十六进制，%02X  意思是不足两位将用0补齐，如果多余两位则不影响
     JGLog("%02X", 0x888);  //888
     JGLog("%02X", 0x4); //04
     */
    return saveResult;
}



- (NSString *)rb_base64EncodingString {
    NSData *data = [self dataUsingEncoding:(NSUTF8StringEncoding)];
    
    return [data base64EncodedStringWithOptions:(NSDataBase64Encoding64CharacterLineLength)];
}


+ (BOOL)isEmptyString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([string isEqualToString:@"(null)"]) {
        return YES;
    }
    
    if ([string isEqualToString:@"<null>"]) {
        return YES;
    }
    if ([string isEqualToString:@""]) {
        return YES;
    }
    if ([string length] == 0) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] ==  0) {
        return YES;
    }
    
    //能来到这:NB 非空。
    return NO;
}

+ (NSString *)pureStrWithOriginStr:(NSString *)originStr {
    // 去掉换行符号 与下面👇注释代码效果一样
    originStr = [originStr stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    originStr = [originStr stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    originStr = [originStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    originStr = [originStr stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    // 这个只能取出普通空格。对于系统通讯录中的空格无能为力。
    originStr = [originStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    originStr = [originStr stringByReplacingOccurrencesOfString:@"\0" withString:@""];
    originStr = [originStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
    originStr = [originStr stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    return originStr;
}


/**时间戳字符串转时间 2018-10-24*/
+ (NSString *)timeStrFromTimeStamp:(NSString *)timestamp {
    
    //ios的时间戳都是10位数的精确到10位  这里面容易出问题。：/1000 和不/1000有问题
    long interval = [timestamp doubleValue];
    //如果 : 服务器返回的是13位时间戳 毫秒
    if (timestamp.length == 13) {
        interval = [timestamp doubleValue] / 1000;
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    
    //日期格式化字符串
    NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
    //设置日期格式
    [dateformat setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    //转字符串 并返回
    return  [dateformat stringFromDate:date];
}

+ (NSString *)NYRtimeStrFromTimeStamp:(NSString *)timestamp {
    //ios的时间戳都是10位数的精确到10位  这里面容易出问题。：/1000 和不/1000有问题
    NSTimeInterval interval = [timestamp longLongValue];
    //如果 : 服务器返回的是13位时间戳 毫秒
    if (timestamp.length == 13) {
        interval = [timestamp floatValue] / 1000;
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    
    //日期格式化字符串
    NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
    //设置日期格式
    [dateformat setDateFormat:@"yyyy-MM-dd"];
    
    //转字符串 并返回
    return  [dateformat stringFromDate:date];
}

/***2.时间转时间戳 返回值为NSNumber*/
//+ (NSNumber *)timeStampFromDateStr:(NSString *)datestr {
//
//    //1.先将时间转换为NSDate
//    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
//    [fmt setDateFormat:@"yyyy-MM-dd"];
//    NSDate *date = [fmt dateFromString:datestr];
//
//    //2.NSDate转时间戳
//    NSTimeInterval inteval = [date timeIntervalSince1970];
//
//    //3.转成13位 NSNumber:Java 后台时间戳为：13位时间戳
//    return @(inteval *1000);
//}
+ (NSNumber *)timeStampFromDateStr:(NSString *)datestr {
    
    NSNumber *timeStamp = [self jfdjWithFormatString:@"yyyy-MM-dd" dateStr:datestr];
    return timeStamp;
}

/**2-1时间字符传转时戳, 2018-10-3 11:30*/
+ (NSNumber *)timeStampnyrsfFromDateStr:(NSString *)datestr {
    return [self jfdjWithFormatString:@"yyyy-MM-dd HH:mm" dateStr:datestr];
}

+ (NSNumber *)jfdjWithFormatString:(NSString *)formatStr dateStr:(NSString *)datestr{
    //1.先将时间转换为NSDate
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    [fmt setDateFormat:formatStr];
    NSDate *date = [fmt dateFromString:datestr];
    
    //2.NSDate转时间戳
    NSTimeInterval inteval = [date timeIntervalSince1970];
    
    //3.转成13位 NSNumber:Java 后台时间戳为：13位时间戳
    return @(inteval *1000);
}


#pragma mark - 国际语言判断
/**3.判断是不是中文 2018-11-16*/
+ (BOOL)rb_ChineseLanguage {
    NSString *language = [self rb_getPrefereanceLanguage];
    
    if ([language hasPrefix:@"zh"]) { //中文 ios11 zh-Hans-US
        return YES;
    }
    return NO;
}

/**3.获取当前系统语言 2018-11-16
 https://www.cnblogs.com/killiancheung/p/4610956.html*/
+ (NSString *)rb_getPrefereanceLanguage {
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    //获取所有的系统语言
    NSArray *allLanguages = [def objectForKey:@"AppleLanguages"];
    
    //当前系统语言
    NSString *preferredLanguage  = [allLanguages firstObject];
    
    //    FDLog(@"当前t系统语言:%@",preferredLanguage);
    
    return preferredLanguage;
}


- (BOOL)isEmpty {
    
    //    NSLog(@"judgeIsEmptyWithString string length = %lu", (unsigned long)[string length]);
    
    if ([self length] == 0){
        //JGLog(@"#### string length = 0");
        return YES;
    }
    
    if (self == nil){
        //JGLog(@"#### string is nil");
        return YES;
    }
    
    if (self == Nil){
        //JGLog(@"#### string is Nil");
        return YES;
    }
    
    if (self == NULL){
        //JGLog(@"#### string is NULL");
        return YES;
    }
    
    if ([self isKindOfClass:[NSNull class]]){
        //JGLog(@"#### string is Null");
        return YES;
    }
    
    if ([self isEqual:@""]){
        //JGLog(@"#### string is eqeal @\"\"");
        return YES;
    }
    
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0){
        //JGLog(@"#### string is space");
        return YES;
    }
    return NO;
    
    
}
@end
