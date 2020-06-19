//
//  ZYIntegralMallSectionCH.m
//  WSCollege
//
//  Created by spring on 2020/5/20.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYIntegralMallSectionCH.h"

@interface ZYIntegralMallSectionCH ()
//竖线
@property (nonatomic, strong) UIView *VLine;


@property (nonatomic, strong) UIButton *LookMoreBtn;

@end



@implementation ZYIntegralMallSectionCH

- (void)configUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    _VLine = [UIView new];
    _VLine.backgroundColor = JGHexColor(@"#D43030");
    
    _TitleLbl = [UILabel new];
    _TitleLbl.textColor = JGHexColor(@"#505050");
    _TitleLbl.font = JGBoldFont(kWidthScale(14));
    
    _LookMoreBtn = [UIButton new];
    _LookMoreBtn.titleLabel.font = JGFont(kWidthScale(12));
    [_LookMoreBtn setTitleColor:JGHexColor(@"#929292") forState:UIControlStateNormal];
    [_LookMoreBtn setTitle:@"更多" forState:UIControlStateNormal];
    [_LookMoreBtn setImage:JGImage(@"arrow_right") forState:UIControlStateNormal];
    [_LookMoreBtn layoutWithStatus:JGLayoutStatusImageRight andMargin:10];
    [_LookMoreBtn addTarget:self action:@selector(LookMoreBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_VLine];
    [self addSubview:_TitleLbl];
    [self addSubview:_LookMoreBtn];

    [_VLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(15);
        make.centerY.equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(kWidthScale(3), kWidthScale(10)));
    }];
    
    [_TitleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(_VLine.mas_right).mas_offset(kWidthScale(5));
    }];
    
    [_LookMoreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.right.equalTo(self.mas_right).mas_offset(-15);
        make.width.equalTo(@(kWidthScale(60)));
    }];
}

#pragma mark - 更多 -
- (void)LookMoreBtnClick {
    
    if (self.BackInfo) {
        self.BackInfo(@"");
    }
}




@end
