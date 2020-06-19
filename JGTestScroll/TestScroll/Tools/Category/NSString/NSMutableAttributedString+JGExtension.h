//
//  NSMutableAttributedString+JGExtension.h
//  FD_Rider
//
//  Created by 郭军 on 2019/3/20.
//  Copyright © 2019年 zhiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (JGExtension)

/**
 * 富文本 label展示不同字体颜色
 */
+(NSMutableAttributedString *)getStrWithAllStr:(NSString *)allStr rangeStr:(NSString *)rangeStr color:(UIColor *)color font:(CGFloat)font ;


/// 文字添加删除线
/// @param text 文字
/// @param color 删除线颜色
+ (NSMutableAttributedString *)getDeleteLineWithString:(NSString *)text color:(UIColor *)color;




@end

NS_ASSUME_NONNULL_END
