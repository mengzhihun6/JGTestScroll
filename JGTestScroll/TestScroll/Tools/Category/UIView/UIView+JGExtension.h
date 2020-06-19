//
//  UIView+JGExtension.h
//  百思
//
//  Created by JUN on 16/5/16.
//  Copyright © 2016年 JUN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ArbitraryCornerRadiusViewType) {
    /** 默认全角 */
    ArbitraryCornerRadiusViewTypeDefault = 0,
    /** 左上角 */
    ArbitraryCornerRadiusViewTypeTopLeft = 1,
    /** 右上角 */
    ArbitraryCornerRadiusViewTypeTopRight = 2,
    /** 左下角 */
    ArbitraryCornerRadiusViewTypeBottomLeft = 3,
    /** 右下角 */
    ArbitraryCornerRadiusViewTypeBottomRight = 4,
    /** 左上角和右上角 */
    ArbitraryCornerRadiusViewTypeTopLeftTopRight = 5,
    /** 左上角和左下角 */
    ArbitraryCornerRadiusViewTypeTopLeftBottomLeft = 6,
    /** 左上角和右下角 */
    ArbitraryCornerRadiusViewTypeTopLeftBottomRight = 7,
    /** 右上角和左下角 */
    ArbitraryCornerRadiusViewTypeTopRightBottomLeft = 8,
    /** 右上角和右下角 */
    ArbitraryCornerRadiusViewTypeTopRightBottomRight = 9,
    /** 左下角和右下角 */
    ArbitraryCornerRadiusViewTypeBottomLeftBottomRight = 10,
    /** 左上角和右上角和左下角 */
    ArbitraryCornerRadiusViewTypeTopLeftTopRightBottomLeft = 11,
    /** 左上角和右上角和右下角 */
    ArbitraryCornerRadiusViewTypeTopLeftTopRightBottomRight = 12,
    /** 左上角和左下角和右下角 */
    ArbitraryCornerRadiusViewTypeTopLeftBottomLeftBottomRight = 13,
    /** 右上角和左下角和右下角 */
    ArbitraryCornerRadiusViewTypeTopRightBottomLeftBottomRight = 14,
};





@interface UIView (JGExtension)

@property (nonatomic, assign)CGSize size;
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat height;
@property(nonatomic,assign)CGFloat  bottom;
@property (nonatomic, assign)CGFloat x;
@property (nonatomic, assign)CGFloat y;
@property(nonatomic,assign)CGFloat  right;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

//加载同名的xib
+ (instancetype)viewFromXib;

/** 判断两个视图在同一窗口是否有重叠 */
- (BOOL)intersectWithView:(UIView *)view;


#pragma mark - 实现虚线功能  -
- (void)addBorderDottedLinewithColor:(UIColor *)color;

/** 在分类中声明@property, 只会生成方法的声明, 不会生成方法的实现和带有_下划线的成员变量*/
//UIView+JGExtension


/**
 视图切任意方向圆角
 
 @param cornerRadius 圆角大小
 @param type 圆角类型
 */
- (void)cornerRadius:(CGFloat)cornerRadius withType:(ArbitraryCornerRadiusViewType)type;


@end

