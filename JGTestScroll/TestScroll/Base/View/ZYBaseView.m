//
//  ZYBaseView.m
//  WSCollege
//
//  Created by spring on 2020/5/15.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYBaseView.h"

@implementation ZYBaseView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self configUI];
        
    }
    return self;
}


- (void)configUI {}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
