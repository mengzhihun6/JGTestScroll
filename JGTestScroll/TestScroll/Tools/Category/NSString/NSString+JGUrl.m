//
//  NSString+JGUrl.m
//  LH_QJ
//
//  Created by 郭军 on 2018/7/30.
//  Copyright © 2018年 JG. All rights reserved.
//

#import "NSString+JGUrl.h"
#include <CommonCrypto/CommonDigest.h>
#include <CommonCrypto/CommonHMAC.h>


@implementation NSString (JGUrl)

//URLEncode  //编码
+ (NSString*)encodeString:(NSString*)uncodeString {
    
    // CharactersToBeEscaped = @":/?&=;+!@#$()~',*";
    // CharactersToLeaveUnescaped = @"[].";
    
    /*
     'CFURLCreateStringByAddingPercentEscapes' is deprecated: first deprecated in iOS 9.0 - Use [NSString stringByAddingPercentEncodingWithAllowedCharacters:] instead, which always uses the recommended UTF-8 encoding, and which encodes for a specific URL component or subcomponent (since each URL component or subcomponent has different rules for what characters are valid).
     */
    
//    NSString * charaters = @"?!@#$^&%*+,:;='\"`<>()[]{}/\\| ";
//    NSCharacterSet * set = [[NSCharacterSet characterSetWithCharactersInString:charaters] invertedSet];
//    NSString * hString2 = [unencodedString stringByAddingPercentEncodingWithAllowedCharacters:set];
//    return hString2;

    
//    NSString *encodedString = (NSString *)
//    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
//                                                              (CFStringRef)unencodedString,
//                                                              NULL,
//                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
//                                                              kCFStringEncodingUTF8));
//
//
//    return encodedString;
    
    return (NSString *)CFBridgingRelease((__bridge CFTypeRef _Nullable)([[uncodeString description] stringByAddingPercentEncodingWithAllowedCharacters:[[NSCharacterSet characterSetWithCharactersInString:@"!*'();:@&=+$,/?%#[]"] invertedSet]]));
}


//URLDEcode  //解码
+ (NSString *)decodeString:(NSString*)decodeString
{
    
    /*
     'CFURLCreateStringByReplacingPercentEscapesUsingEncoding' is deprecated: first deprecated in iOS 9.0 - Use [NSString stringByRemovingPercentEncoding] or CFURLCreateStringByReplacingPercentEscapes() instead, which always uses the recommended UTF-8 encoding.
     */
    
    
//    NSString *decodedString  = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
//                                                                                                                     (__bridge CFStringRef)encodedString,
//                                                                                                                     CFSTR(""),
//                                                                                                                     CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
//    return decodedString;
    
    
    return (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapes(kCFAllocatorDefault, (CFStringRef)decodeString, CFSTR("")));
}




#pragma mark - 工具方法 HmacSHA1加密；
//!!!!: 2. HmacSHA1加密；
+ (NSString *)HmacSha1:(NSString *)key data:(NSString *)value
{
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *valueData = [value dataUsingEncoding:NSUTF8StringEncoding];
    
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, [keyData bytes], [keyData length], [valueData bytes], [valueData length], result);
    
    NSData *HMAC = [[NSData alloc] initWithBytes:result
                                          length:sizeof(result)];
    //    NSLog(@"%d行  %@",__LINE__,HMAC);
    NSString *str =  [HMAC convertDataToHexStr:HMAC];
    //    NSLog(@"%d行  %@",__LINE__,str);
    
    return str;
}



@end
