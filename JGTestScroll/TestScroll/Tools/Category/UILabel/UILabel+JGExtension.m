//
//  UILabel+JGExtension.m
//  FD_iPad
//
//  Created by 郭军 on 2019/5/5.
//  Copyright © 2019 JG. All rights reserved.
//

#import "UILabel+JGExtension.h"
#import "objc/Runtime.h"

@implementation UILabel (JGExtension)

- (NSString *)verticalText{
    // 利用runtime添加属性
    return objc_getAssociatedObject(self, @selector(verticalText));
}

- (void)setVerticalText:(NSString *)verticalText{
    objc_setAssociatedObject(self, &verticalText, verticalText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSMutableString *str = [[NSMutableString alloc] initWithString:verticalText];
    NSInteger count = str.length;
    for (int i = 1; i < count; i ++) {
        [str insertString:@"\n" atIndex:i*2-1];
    }
    self.text = str;
    self.numberOfLines = 0;
}

#pragma mark -- 配置 label 的属性【行间距】【要显示的最大宽度】
/**
 配置 label 的行间距
 
 @param font 要配置的 label 的字体大小
 @param lineSpace  行间距
 @param maxWidth 要展示的最大宽度
 */
- (void)configFont:(CGFloat)font lineSpace:(CGFloat)lineSpace maxWidth:(CGFloat)maxWidth {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = size.height+1>font*2 ? lineSpace:0;
    NSRange range = NSMakeRange(0, [self.text length]);
    [attributedString addAttribute:NSBaselineOffsetAttributeName value:NSBaselineOffsetAttributeName range:range];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paraStyle range:range];
    
    self.attributedText = attributedString;
}



@end
