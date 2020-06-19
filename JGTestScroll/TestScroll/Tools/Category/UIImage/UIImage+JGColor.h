//
//  UIImage+JGColor.h
//  ZJBL-SJ
//
//  Created by 郭军 on 2017/3/14.
//  Copyright © 2017年 ZJNY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JGColor)
/** 根据颜色生成纯色图片 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/** 取图片某一像素的颜色 */
- (UIColor *)colorAtPixel:(CGPoint)point;

/** 获得灰度图 */
- (UIImage *)convertToGrayImage;

/** 改变图片的颜色 */
-(UIImage*)imageChangeColor:(UIColor*)color;


/**
 制作一张带有渐变色的image

 @param frame frame
 @return 渐变色的image
 */
+ (UIImage *)GradientImgWithFrame:(CGRect)frame;
@end
