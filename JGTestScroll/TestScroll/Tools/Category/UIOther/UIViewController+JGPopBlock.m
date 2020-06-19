//
//  UIViewController+JGPopBlock.m
//  LH_QJ
//
//  Created by 郭军 on 2018/8/17.
//  Copyright © 2018年 JG. All rights reserved.
//

#import "UIViewController+JGPopBlock.h"
#import <objc/runtime.h>

static char popBlockKey;

@implementation UIViewController (JGPopBlock)


-(void)setPopBlock:(PopBlock)popBlock{
    objc_setAssociatedObject(self, &popBlockKey, popBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(PopBlock)popBlock{
    
    PopBlock popBlock = objc_getAssociatedObject(self, &popBlockKey);
    
    return popBlock;
}


@end
