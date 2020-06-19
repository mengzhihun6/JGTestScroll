//
//  ZYIntegralMallTopCH.m
//  WSCollege
//
//  Created by spring on 2020/5/20.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYIntegralMallTopCH.h"

@interface ZYIntegralMallTopCH ()

@property (nonatomic, strong) UILabel *TitleLbl;

@property (nonatomic, strong) UILabel *ScoreLbl;

@property (nonatomic, strong) UILabel *DescLbl;

@property (nonatomic, strong) UIButton *InfoBtn;

@property (nonatomic, strong) UIButton *DetailBtn;

@end



@implementation ZYIntegralMallTopCH

- (void)configUI {
    
    self.backgroundColor = JGHexColor(@"#FF5733");

    _TitleLbl = [UILabel new];
    _TitleLbl.textColor = [UIColor whiteColor];
    _TitleLbl.font = JGFont(kWidthScale(13));
    _TitleLbl.text = @"我的福利币";
    
    _ScoreLbl = [UILabel new];
    _ScoreLbl.textColor = [UIColor whiteColor];
    _ScoreLbl.font = JGBoldFont(kWidthScale(21));
    _ScoreLbl.text = @"0";
    
    _DescLbl = [UILabel new];
    _DescLbl.textColor = [UIColor whiteColor];
    _DescLbl.font = JGFont(kWidthScale(13));
    _DescLbl.text = @"兑换不减少学习积分";
    
    _InfoBtn = [UIButton new];
    _InfoBtn.tag = 1;
    _InfoBtn.clipsToBounds = YES;
    _InfoBtn.layer.cornerRadius = kWidthScale(7.5);
    _InfoBtn.titleLabel.font = JGFont(kWidthScale(10));
    [_InfoBtn setTitleColor:JGHexColor(@"#FF5733") forState:UIControlStateNormal];
    [_InfoBtn setTitle:@"福利币说明" forState:UIControlStateNormal];
    [_InfoBtn setImage:JGImage(@"integral_top_right") forState:UIControlStateNormal];
    [_InfoBtn setBackgroundImage:JGWhiteImage forState:UIControlStateNormal];
    [_InfoBtn layoutWithStatus:JGLayoutStatusImageRight andMargin:8];
    [_InfoBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _DetailBtn = [UIButton new];
    _DetailBtn.tag = 2;
    _DetailBtn.titleLabel.font = JGFont(kWidthScale(10));
    [_DetailBtn setTitle:@"福利币明细" forState:UIControlStateNormal];
    [_DetailBtn setImage:JGImage(@"integral_top_right1") forState:UIControlStateNormal];
    [_DetailBtn setBackgroundImage:[UIImage imageWithColor:JGHexColor(@"#FF7F63")] forState:UIControlStateNormal];
    [_DetailBtn layoutWithStatus:JGLayoutStatusImageRight andMargin:5];
    [_DetailBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];

    
    
    
    [self addSubview:_TitleLbl];
    [self addSubview:_ScoreLbl];
    [self addSubview:_DescLbl];
    [self addSubview:_InfoBtn];
    [self addSubview:_DetailBtn];

    [_TitleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).mas_offset(kWidthScale(13));
    }];
    
    [_ScoreLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(_TitleLbl.mas_bottom).mas_offset(kWidthScale(5));
    }];
    
    [_DescLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(_ScoreLbl.mas_bottom).mas_offset(kWidthScale(5));
    }];
    
    [_InfoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(_DescLbl.mas_bottom).mas_offset(kWidthScale(8));
        make.size.mas_equalTo(CGSizeMake(kWidthScale(75), kWidthScale(15)));
    }];
    
    [_DetailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.mas_top).mas_offset(kWidthScale(10));
        make.size.mas_equalTo(CGSizeMake(kWidthScale(75), kWidthScale(15)));
    }];
}


- (void)BtnClick:(UIButton *)btn {
    
    if (self.BackInfo) {
        self.BackInfo(btn);
    }
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_DetailBtn cornerRadius:kWidthScale(7.5) withType:ArbitraryCornerRadiusViewTypeTopLeftBottomLeft];
}


@end
