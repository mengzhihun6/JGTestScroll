//
//  UIControl+JGBtnClickLimit.h
//  LH_QJ
//
//  Created by 郭军 on 2018/5/19.
//  Copyright © 2018年 JG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (JGBtnClickLimit)

/** 间隔多少秒才能响应事件 */
@property(nonatomic, assign) NSTimeInterval  acceptEventInterval;
/** 是否能执行方法 */
@property(nonatomic, assign) BOOL ignoreEvent;

@end
