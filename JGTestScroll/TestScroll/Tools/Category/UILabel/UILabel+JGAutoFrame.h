//
//  UILabel+JGAutoFrame.h
//  ZJBL-SJ
//
//  Created by 郭军 on 2017/3/16.
//  Copyright © 2017年 ZJNY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (JGAutoFrame)

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;


/**
 设置行间距的前提下的 label 高度
 
 @param str 字符串
 @param font  字体大小
 @param lineSpace 行间距
 @param maxWidth 最大显示宽度
 @return 要展示的 label 的高度
 */
+ (CGFloat)getHeightWithString:(NSString *)str font:(CGFloat)font lineSpace:(CGFloat)lineSpace maxWidth:(CGFloat)maxWidth;

@end
