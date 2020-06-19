//
//  NSString+JGFunc.h
//  LH_QJ
//
//  Created by 郭军 on 2018/9/29.
//  Copyright © 2018年 JG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JGFunc)

#pragma mark - MD5加密 -
- (NSString *)jg_md5String;

/**base64编码*/
- (NSString *)rb_base64EncodingString;

/**判断一个字符串是否是空串*/
+ (BOOL)isEmptyString:(NSString *)string;
+ (NSString *)pureStrWithOriginStr:(NSString *)originStr;





/**1.时间戳字符串转时间 2018-10-24 18:40注意服务器返回的可能是13位时间戳*/
+ (NSString *)timeStrFromTimeStamp:(NSString *)timestamp;
/**1-2 年月日 12018-10-24 */
+ (NSString *)NYRtimeStrFromTimeStamp:(NSString *)timestamp;

/***2.时间转时间戳 返回值为NSNumber Java后台要的是13位时间戳*/
+ (NSNumber *)timeStampFromDateStr:(NSString *)datestr;

/**2-1时间字符传转时戳, 2018-10-3 11:30*/
+ (NSNumber *)timeStampnyrsfFromDateStr:(NSString *)datestr;


/**3.判断是不是中文 2018-11-16*/
+ (BOOL)rb_ChineseLanguage;
/**3.获取当前系统语言 2018-11-16*/
//+ (NSString *)rb_getPrefereanceLanguage;


- (BOOL)isEmpty;


@end
