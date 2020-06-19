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


@property (nonatomic, assign, readonly) NSInteger selectedIndex;

- (void)selectItemAtIndex:(NSInteger)index;

@property (nonatomic, copy) ReturnBackInfo SelBackInfo;

@end

NS_ASSUME_NONNULL_END
