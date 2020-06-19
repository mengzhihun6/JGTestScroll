//
//  NSMutableAttributedString+JGExtension.m
//  FD_Rider
//
//  Created by 郭军 on 2019/3/20.
//  Copyright © 2019年 zhiyuan. All rights reserved.
//

#import "NSMutableAttributedString+JGExtension.h"

@implementation NSMutableAttributedString (JGExtension)


/**
 * 富文本 label展示不同字体颜色
 */
+(NSMutableAttributedString *)getStrWithAllStr:(NSString *)allStr rangeStr:(NSString *)rangeStr color:(UIColor *)color font:(CGFloat)font {
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:allStr];
    NSRange range1 = [[str string] rangeOfString:rangeStr];
    [str addAttribute:NSForegroundColorAttributeName value:color range:range1];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:range1];
    return str;
}

/// 文字添加删除线
/// @param text 文字
/// @param color 删除线颜色
+ (NSMutableAttributedString *)getDeleteLineWithString:(NSString *)text color:(UIColor *)color {
    
    NSUInteger length = [text length];
      NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:text];
      [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
      [attri addAttribute:NSStrikethroughColorAttributeName value:color range:NSMakeRange(0, length)];
      return attri;
}


@end
