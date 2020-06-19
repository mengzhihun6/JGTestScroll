//
//  UIButton+JGExtension.m
//  FD_iPad
//
//  Created by 郭军 on 2019/6/25.
//  Copyright © 2019 ZYWL. All rights reserved.
//

#import "UIButton+JGExtension.h"

@implementation UIButton (JGExtension)


//- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
//    [super sendAction:action to:target forEvent:event];
//
//    [[UIApplication sharedApplication].keyWindow endEditing:YES];
//}




/**
 按钮中的图片360度旋转
 */
- (void)JG_Rotate360DegreesAction {
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: -M_PI * 2.0 ];
    rotationAnimation.duration = 1.0;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = MAXFLOAT;
    [self.imageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}


/**
 结束按钮中的图片旋转
 */
- (void)JG_StopRotating {
    //返回原来位置
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: 0 ];
    rotationAnimation.duration = 1.0;
    //    rotationAnimation.cumulative = YES;
    //    rotationAnimation.autoreverses=NO;
    //防止动画结束回到原始位置
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.fillMode = kCAFillModeForwards;
    rotationAnimation.repeatCount = 1;//重复次数
    //注意一定要是rotationAnimation2不然会很快
    [self.imageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation2"];
}


/**
 按钮中的图片180度旋转 1次
 */
- (void)JG_Rotate180DegreesAction {
    [UIView beginAnimations:@"rotate"context:nil];
    [UIView setAnimationDuration:.25f];
    if(CGAffineTransformEqualToTransform(self.imageView.transform,CGAffineTransformIdentity)){
        self.imageView.transform = CGAffineTransformMakeRotation(M_PI);
    }else {
        self.imageView.transform =CGAffineTransformIdentity;
    }
    [UIView commitAnimations];
}

@end
