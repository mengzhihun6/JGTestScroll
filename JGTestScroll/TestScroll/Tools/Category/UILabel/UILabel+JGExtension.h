//
//  UILabel+JGExtension.h
//  FD_iPad
//
//  Created by 郭军 on 2019/5/5.
//  Copyright © 2019 JG. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (JGExtension)
//文本垂直对齐
@property (nonatomic) NSString *verticalText;


/**
 配置 label 的属性【行间距】【要显示的最大宽度】
 
 @param font 要配置的 label 的字体大小
 @param lineSpace  行间距
 @param maxWidth 要展示的最大宽度
 */
- (void)configFont:(CGFloat)font lineSpace:(CGFloat)lineSpace maxWidth:(CGFloat)maxWidth;


@end

NS_ASSUME_NONNULL_END
