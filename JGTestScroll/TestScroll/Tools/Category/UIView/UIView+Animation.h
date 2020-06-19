//
//  UIView+Animation.h
//  day0503UIViewController
//
//  Created by JUN on 16/4/11.
//  Copyright © 2016年 QF. All rights reserved.
//
/* 过渡效果
 fade     //交叉淡化过渡(不支持过渡方向)
 push     //新视图把旧视图推出去
 moveIn   //新视图移到旧视图上面
 reveal   //将旧视图移开,显示下面的新视图
 cube     //立方体翻滚效果
 oglFlip  //上下左右翻转效果
 suckEffect   //收缩效果，如一块布被抽走(不支持过渡方向)
 rippleEffect //滴水效果(不支持过渡方向)
 pageCurl     //向上翻页效果
 pageUnCurl   //向下翻页效果
 cameraIrisHollowOpen  //相机镜头打开效果(不支持过渡方向)
 cameraIrisHollowClose //相机镜头关上效果(不支持过渡方向)
 */
#import <UIKit/UIKit.h>

typedef enum{
    TranstionTypePageCurl = 0,          //向上翻一页
    TranstionTypePageUnCurl,            //向下翻一页
    TranstionTypeRippleEffect,          //滴水效果
    TranstionTypeSuckEffect,            //收缩效果，如一块布被抽走
    TranstionTypeCube,                  //立方体效果
    TranstionTypeOglFlip,               //上下翻转效果
    TranstionTypeCameraIrisHollowOpen,  //相机镜头打开效果(不支持过渡方向)
    TranstionTypeCameraIrisHollowClose, //相机镜头关上效果(不支持过渡方向)
    TranstionTypeFade,                   //交叉淡化过渡(不支持过渡方向)
    TranstionTypePush,                   //新视图把旧视图推出去
    TranstionTypeMoveIn,                 //新视图移到旧视图上面
    TranstionTypeReveal                 //将旧视图移开,显示下面的新视图
} TranstionType;


typedef enum{
    TransitionDirectionFromLeft,
    TransitionDirectionFromRight,
    TransitionDirectionFromTop,
    TransitionDirectionFromBottom
} TransitionDirection;

@interface UIView (Animation)

-(void)addTansitionAnimationType:(TranstionType )type duration:(NSTimeInterval)duration direction:(TransitionDirection )direction;

@end
