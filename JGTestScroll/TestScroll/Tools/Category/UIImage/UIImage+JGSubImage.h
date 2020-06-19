//
//  UIImage+JGSubImage.h
//  LH_QJ
//
//  Created by 郭军 on 2018/8/17.
//  Copyright © 2018年 JG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JGSubImage)

/** 截取当前image对象rect区域内的图像 */
- (UIImage *)subImageWithRect:(CGRect)rect;

/** 压缩图片至指定尺寸 */
- (UIImage *)rescaleImageToSize:(CGSize)size;

/** 压缩图片至指定像素 */
- (UIImage *)rescaleImageToPX:(CGFloat )toPX;

/** 在指定的size里面生成一个平铺的图片 */
- (UIImage *)getTiledImageWithSize:(CGSize)size;

/** UIView转化为UIImage */
+ (UIImage *)imageFromView:(UIView *)view;

/** 将两个图片生成一张图片 */
+ (UIImage*)mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage;

#pragma mark - UIImage 压缩到1.5M 以内上传 -
-(NSData *)imageData:(UIImage *)myimage;



-(UIImage*)getSubImage:(CGRect)rect;

-(UIImage*)scaleToSize:(CGSize)size;

+ (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size;

//压缩图片质量
+(UIImage *)reduceImage:(UIImage *)image percent:(float)percent;
//压缩图片尺寸
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;

/**
 重新绘制图片大小
 
 @param image 原始图片
 @param size  需要的大小
 
 @return 返回改变大小后图片
 */
+ (UIImage*) originImage:(UIImage*)image scaleToSize:(CGSize)size;

/**
 *  图片圆角处理
 *
 *  @param image 图片名字
 *
 *  @return 圆角图片
 */
+ (UIImage *)circleImage:(NSString *)image;




/**
 图片圆角处理
 
 @param size 尺寸
 @param fillCorlor 填充颜色
 @param completion 返回图片
 */
- (void)jg_cornerImageWithSize:(CGSize)size fillCorlor:(UIColor *)fillCorlor completion:(void(^)(UIImage *image))completion;
/*
 UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
 iv.center = self.view.center;
 [self.view addSubview:iv];
 
 UIImage *img = [UIImage imageNamed:@"timg.jpeg"];
 
 [img jg_cornerImageWithSize:CGSizeMake(200, 200) fillCorlor:[UIColor whiteColor] completion:^(UIImage *image) {
 iv.image = image;
 }];
 
 */






/**
 *  vImage模糊图片
 *
 *  @param image 原始图片
 *  @param blur  模糊数值(0-1)
 *
 *  @return 重新绘制的新图片
 */
+(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;

/**
 *  根据传递的View生成一张图片
 *
 *  @param view 图片名字
 *
 *  @return 图片
 */
+ (UIImage *)snapshotWithView:(UIView *)view;


@end
