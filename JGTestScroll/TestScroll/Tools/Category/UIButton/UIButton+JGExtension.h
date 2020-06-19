//
//  UIButton+JGExtension.h
//  FD_iPad
//
//  Created by 郭军 on 2019/6/25.
//  Copyright © 2019 ZYWL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (JGExtension)

/**
 按钮中的图片360度旋转 持续旋转
 */
- (void)JG_Rotate360DegreesAction;

/**
 结束按钮中的图片旋转
 */
- (void)JG_StopRotating;


/**
 按钮中的图片180度旋转 1次
 */
- (void)JG_Rotate180DegreesAction;

@end

NS_ASSUME_NONNULL_END
