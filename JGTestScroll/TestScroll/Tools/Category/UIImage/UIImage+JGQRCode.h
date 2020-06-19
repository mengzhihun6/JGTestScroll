//
//  UIImage+JGQRCode.h
//  ZJBL-SJ
//
//  Created by 郭军 on 2017/4/22.
//  Copyright © 2017年 ZJNY. All rights reserved.
//  二维码/条形码 生成

#import <UIKit/UIKit.h>

@interface UIImage (JGQRCode)

#pragma mark - 二维码生成
//Avilable in iOS 7.0 and later
+ (UIImage *)qrCodeImageWithContent:(NSString *)content
                      codeImageSize:(CGFloat)size
                               logo:(UIImage *)logo
                          logoFrame:(CGRect)logoFrame
                                red:(CGFloat)red
                              green:(CGFloat)green
                               blue:(NSInteger)blue;



#pragma mark - 生成条形码
//Avilable in iOS 8.0 and later
+ (UIImage *)barcodeImageWithContent:(NSString *)content
                       codeImageSize:(CGSize)size
                                 red:(CGFloat)red
                               green:(CGFloat)green
                                blue:(NSInteger)blue;
/**
 *  将字符串 --> 条形码
 *
 *  @param info 字符串
 *
 *  @return 一张条形码图片
 */
+ (UIImage *)barCodeImageWithInfo:(NSString *)info;

@end
