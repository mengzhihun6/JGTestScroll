//
//  UIScrollView+JGAllowPanGestureEventPass.m
//  LH_QJ
//
//  Created by 郭军 on 2018/11/27.
//  Copyright © 2018年 JG. All rights reserved.
//

#import "UIScrollView+JGAllowPanGestureEventPass.h"

@implementation UIScrollView (JGAllowPanGestureEventPass)


-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    // 首先判断otherGestureRecognizer是不是系统pop手势
    if ([otherGestureRecognizer.view isKindOfClass:NSClassFromString(@"UILayoutContainerView")]) {
        // 再判断系统手势的state是began还是fail，同时判断scrollView的位置是不是正好在最左边
        if (otherGestureRecognizer.state == UIGestureRecognizerStateBegan && self.contentOffset.x == 0) {
            return YES;
        }
    }
    
    return NO;
}

@end
