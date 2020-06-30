//
//  ZYIntegralMallCategoryTitleView.h
//  WSCollege
//
//  Created by spring on 2020/6/11.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZYIntegralMallCategoryTitleView : ZYBaseView
//标签数组
@property (nonatomic, strong) NSArray *titleArrM;
//获取选中索引
@property (nonatomic, assign, readonly) NSInteger selectedIndex;
//点击反馈
@property (nonatomic, copy) ReturnBackInfo SelBackInfo;
//设置选中标签
- (void)selectItemAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
