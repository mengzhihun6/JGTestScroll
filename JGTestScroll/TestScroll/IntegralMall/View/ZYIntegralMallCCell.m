//
//  ZYIntegralMallCCell.m
//  WSCollege
//
//  Created by spring on 2020/5/20.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYIntegralMallCCell.h"

@interface ZYIntegralMallCCell ()

@property (nonatomic, strong) UIView *TotalView;

@property (nonatomic, strong) UIImageView *Icon;

@property (nonatomic, strong) UILabel *TitleLbl;

@property (nonatomic, strong) UILabel *PriceLbl;


@end



@implementation ZYIntegralMallCCell

- (void)configUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    _TotalView = [UIView new];
    _TotalView.backgroundColor = [UIColor whiteColor];
    _TotalView.layer.shadowColor = JGHexColor(@"#CCCCCC").CGColor;
    _TotalView.layer.shadowOffset = CGSizeMake(0,1);
    _TotalView.layer.shadowOpacity = 1;
    _TotalView.layer.shadowRadius = 3;
    _TotalView.layer.cornerRadius = 5;
    
    _Icon = [UIImageView new];
    _Icon.layer.cornerRadius = 5;
    _Icon.clipsToBounds = YES;
    _Icon.backgroundColor = JGRandomColor;
    
    _TitleLbl = [UILabel new];
    _TitleLbl.numberOfLines = 2;
    _TitleLbl.textColor = JGHexColor(@"#505050");
    _TitleLbl.font = JGFontMedium_size(kWidthScale(13));
    _TitleLbl.text = @"新华书店网上书城3元电子书抵扣券";
    
    _PriceLbl = [UILabel new];
    _PriceLbl.textColor = JGHexColor(@"#FF5733");
    _PriceLbl.font = JGFontMedium_size(kWidthScale(13));
    _PriceLbl.text = @"3000福利币";
    
    
    [self addSubview:_TotalView];
    [_TotalView addSubview:_Icon];
    [_TotalView addSubview:_TitleLbl];
    [_TotalView addSubview:_PriceLbl];

    
    
    [_TotalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 3, 0));
    }];
    
    [_Icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(_TotalView);
        make.height.equalTo(@(kWidthScale(104)));
    }];
    
    [_TitleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_TotalView.mas_left).mas_offset(12);
        make.right.equalTo(_TotalView.mas_right).mas_offset(-12);
        make.top.equalTo(_Icon.mas_bottom).mas_offset(kWidthScale(6));
    }];
    
    [_PriceLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_TitleLbl.mas_left);
        make.bottom.equalTo(_TotalView.mas_bottom).mas_offset(-kWidthScale(8));
    }];
}



@end
