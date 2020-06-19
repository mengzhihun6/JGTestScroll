//
//  UIImage+JGGif.h
//  LH_QJ
//
//  Created by 郭军 on 2018/8/17.
//  Copyright © 2018年 JG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JGGif)

/** 用一个Gif生成UIImage，传入一个GIFData */
+ (UIImage *)animatedImageWithAnimatedGIFData:(NSData *)theData;

/** 用一个Gif生成UIImage，传入一个GIF路径 */
+ (UIImage *)animatedImageWithAnimatedGIFURL:(NSURL *)theURL;



@end
