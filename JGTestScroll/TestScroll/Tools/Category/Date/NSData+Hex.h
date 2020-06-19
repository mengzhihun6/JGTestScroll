//
//  NSData+Hex.h
//  FD_Rider
//
//  Created by 郭军 on 2019/3/19.
//  Copyright © 2019年 zhiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Hex)

-(NSData *)getCheckSum:(NSData *)byteStr;


/**进NSData的内容原封不动的转换为对应的字符串 */
- (NSString *)convertDataToHexStr:(NSData *)data ;

/**5-17 NSData转byte*/
- (Byte )byteFromData:(NSData *)originData;

@end

NS_ASSUME_NONNULL_END
