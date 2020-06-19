//
//  UINavigationBar+JGHandle.h
//  JG_GetDemo
//
//  Created by 郭军 on 2019/8/20.
//  Copyright © 2019 JG. All rights reserved.
//

/*
 使用：
 [self.navigationController.navigationBar navBarBackGroundColor:[UIColor redColor] image:nil isOpaque:YES];//颜色
 [self.navigationController.navigationBar navBarMyLayerHeight:90 isOpaque:YES];//背景高度
 //    [self.navigationController.navigationBar navBarAlpha:0 isOpaque:YES];//透明度
 //    [self.navigationController.navigationBar navBarBottomLineHidden:YES];//隐藏底线
 
 */

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationBar (JGHandle)

/**
 更改导航栏颜色和图片
 
 @param color 颜色
 @param barImage 图片
 @param opaque 样式，YES:状态字体为白色 NO:状态字体为黑色(默认)
 */
- (void)navBarBackGroundColor:(UIColor *_Nullable)color image:(UIImage *_Nullable)barImage isOpaque:(BOOL)opaque;

/**
 更改透明度
 
 @param alpha 导航栏透明度
 @param opaque 样式，YES:状态字体为白色 NO:状态字体为黑色(默认)
 */
- (void)navBarAlpha:(CGFloat)alpha isOpaque:(BOOL)opaque;

/**
 导航栏背景高度
 注意*这里并没有改导航栏高度，只是改了自定义背景高度
 
 @param height 高度
 @param opaque 样式，YES:状态字体为白色 NO:状态字体为黑色(默认)
 */
- (void)navBarMyLayerHeight:(CGFloat)height isOpaque:(BOOL)opaque;

/**
 隐藏底线
 */
- (void)navBarBottomLineHidden:(BOOL)hidden;

//还原回系统导航栏
- (void)navBarToBeSystem;

@end

#pragma mark -- 自定义导航栏层
@interface MyNavView :UIView
@property (nonatomic, assign) CGFloat   alpha;
@property (nonatomic, assign) BOOL      hiddenBottomLine;
@property (nonatomic, strong) UIColor   * _Nullable backColor;
@property (nonatomic, strong) UIImage   * _Nullable backImage;
@end


NS_ASSUME_NONNULL_END
