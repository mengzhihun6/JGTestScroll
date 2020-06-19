//
//  NSString+JGUrl.h
//  LH_QJ
//
//  Created by 郭军 on 2018/7/30.
//  Copyright © 2018年 JG. All rights reserved.
//  url字符串中具有特殊功能的特殊字符的字符串，或者中文字符,作为参数用GET方式传递时，需要用urlencode处理一下

#import <Foundation/Foundation.h>

@interface NSString (JGUrl)

//URLEncode
+ (NSString*)encodeString:(NSString*)unencodedString;

//URLDEcode
+(NSString *)decodeString:(NSString*)encodedString;

#pragma mark - 工具方法 HmacSHA1加密；
//HmacSHA1加密
+ (NSString *)HmacSha1:(NSString *)key data:(NSString *)value;



@end
