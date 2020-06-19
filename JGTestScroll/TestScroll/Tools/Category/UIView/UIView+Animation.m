//
//  UIView+Animation.m
//  day0503UIViewController
//
//  Created by JUN on 16/4/11.
//  Copyright © 2016年 QF. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)

-(void)addTansitionAnimationType:(TranstionType )type duration:(NSTimeInterval)duration direction:(TransitionDirection )direction{
    
    NSArray *animationTypeArr = @[@"pageCurl", @"pageUnCurl", @"rippleEffect", @"suckEffect", @"cube", @"oglFlip" , @"cameraIrisHollowOpen", @"cameraIrisHollowClose", @"fade", @"push", @"moveIn", @"reveal"];
    NSArray *directionArr = @[@"fromLeft", @"fromRight", @"fromTop", @"fromBottom"];
    
    CATransition *animation = [[CATransition alloc]init];
        animation.duration = duration;
    
        animation.type = animationTypeArr[type];

        animation.subtype = directionArr[direction];

    
    [self.layer addAnimation:animation forKey:nil];
}


@end
