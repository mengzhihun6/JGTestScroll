//
//  UILabel+JGAutoFrame.m
//  ZJBL-SJ
//
//  Created by 郭军 on 2017/3/16.
//  Copyright © 2017年 ZJNY. All rights reserved.
//

#import "UILabel+JGAutoFrame.h"

@implementation UILabel (JGAutoFrame)

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = font;
    [label sizeToFit];
    return label.frame.size.width;
}


#pragma mark -- 计算带有行间距的 label 的高度
+ (CGFloat)getHeightWithString:(NSString *)str font:(CGFloat)font lineSpace:(CGFloat)lineSpace maxWidth:(CGFloat)maxWidth
{
    CGFloat labelHeight = 0.0f;
    CGSize originSize = [str boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = originSize.height+1>font*2 ? lineSpace:0;
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:font],
                          NSParagraphStyleAttributeName:paraStyle
                          ,NSBaselineOffsetAttributeName:NSBaselineOffsetAttributeName};
    CGSize size = [str boundingRectWithSize:CGSizeMake(maxWidth,MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine |
                   NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    labelHeight = size.height+1;
    return labelHeight;
}



@end
