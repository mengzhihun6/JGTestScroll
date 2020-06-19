//
//  UIViewController+JGPopBlock.h
//  LH_QJ
//
//  Created by 郭军 on 2018/8/17.
//  Copyright © 2018年 JG. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PopBlock)(UIBarButtonItem *backItem);

@interface UIViewController (JGPopBlock)

@property(nonatomic,copy)PopBlock popBlock;

@end
