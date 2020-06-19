//
//  ZYIntegralMallCategoryTitleView.m
//  WSCollege
//
//  Created by spring on 2020/6/11.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYIntegralMallCategoryTitleView.h"

@interface ZYIntegralMallCategoryTitleView ()
/** 所有内容 */
@property (nonatomic, strong) UIScrollView *contentView;
//指示器
@property (nonatomic, strong) UIView *indicatorView;
//记录选中按钮
@property (nonatomic, strong) UIButton *selectedButton;

@end


@implementation ZYIntegralMallCategoryTitleView


- (void)configUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    _contentView = [UIScrollView new];
    _contentView.showsVerticalScrollIndicator = NO;
    _contentView.showsHorizontalScrollIndicator = NO;
    
    [self addSubview:_contentView];
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)setTitleArrM:(NSArray *)titleArrM {
    _titleArrM = titleArrM;
    
    
    CGFloat W = kWidthScale(75);
    //设置内容Size
    self.contentView.contentSize = CGSizeMake(titleArrM.count * W, 0);

    
    // 底部的指示器
    _indicatorView = [[UIView alloc] init];
    _indicatorView.backgroundColor = JGHexColor(@"#D43030");
    _indicatorView.height = kWidthScale(1);
    _indicatorView.width = W;
    _indicatorView.y = kWidthScale(40) - _indicatorView.height;
    
    // 内部的子标签
    CGFloat width = W;
    CGFloat height = kWidthScale(40);
    for (NSInteger i = 0; i < titleArrM.count; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i*width, 0, width, height)];
        button.tag = i;
        button.titleLabel.font = JGFontMedium_size(kWidthScale(16));
        [button setTitleColor:JGHexColor(@"#505050") forState:UIControlStateNormal];
        [button setTitleColor:JGHexColor(@"#D43030") forState:UIControlStateSelected];
        [button setTitle:titleArrM[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:button];
        
        // 默认点击按钮
        if (i == 0) { //默认选中第一个
            button.selected = YES;
            self.selectedButton = button;
            _indicatorView.centerX = button.centerX;
        }
    }
    [self.contentView addSubview:_indicatorView];
}


- (NSInteger)selectedIndex {
    return self.selectedButton.tag;
}

//设置选中项
- (void)selectItemAtIndex:(NSInteger)index {
        
    UIButton *button = self.contentView.subviews[index];
    [self selectedBtn:button isBackInfo:NO];
}


- (void)titleClick:(UIButton *)button {
    
    [self selectedBtn:button isBackInfo:YES];
}


- (void)selectedBtn:(UIButton *)button isBackInfo:(BOOL)isBack {
    
    
    if (self.selectedButton == button) return;
    
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
    if (self.SelBackInfo && isBack) {
        self.SelBackInfo(@(button.tag));
    }
    
    CGFloat W = kWidthScale(75) * self.titleArrM.count;
    if (W >= kDeviceWidth) {
        [self managerScrollFromSubView:button superViewwWidth:kDeviceWidth];
    }
    
    // 动画
    [UIView animateWithDuration:0.15 animations:^{
        self.indicatorView.centerX = button.centerX;
    }];
}


/// UIScrollView 指定某个视图滚动至屏幕中心
/// @param view  要滚动至屏幕中心的视图
/// @param superViewwWidth 可显示范围宽度  一般为屏幕宽度
-(void)managerScrollFromSubView:(UIView *)view  superViewwWidth:(CGFloat)superViewwWidth
{
    // 距离屏幕中心点距离
    CGFloat offsetX = view.center.x - superViewwWidth/2;
    if (offsetX < 0)
    {
        offsetX = 0;
    }
    // 超出屏幕部分的宽度
    CGFloat maxRight = self.contentView.contentSize.width - superViewwWidth;
    if (offsetX > maxRight)
    {
        // 当前屏幕左侧有超屏内容 只滚动右边剩余量
        offsetX = maxRight;
    }
    
    [self.contentView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end

