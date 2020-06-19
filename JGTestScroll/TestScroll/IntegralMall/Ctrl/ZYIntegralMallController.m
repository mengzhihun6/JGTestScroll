//
//  ZYIntegralMallController.m
//  WSCollege
//
//  Created by spring on 2020/5/19.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYIntegralMallController.h"
#import "ZYIntegralMallTopCH.h"
#import "ZYIntegralMallCategoryTitleView.h"
#import "ZYIntegralMallSectionCH.h"
#import "ZYIntegralMallCCell.h"
//#import "ZYExchangeRecordController.h" //兑换记录
//#import "ZYInMallWelfareDetailController.h" //福利币明细
#import "ZYIntegralMallMoreController.h" //查看更多

@interface ZYIntegralMallController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIButton *rightBarButton;

@property (nonatomic, strong) ZYIntegralMallCategoryTitleView *CateTitleView;

@property (nonatomic, strong) UICollectionView *CollectionView;
@property (nonatomic, strong) ZYIntegralMallTopCH *MallTopCH;

@property (nonatomic, strong) NSArray *titleArrM;

@end

static NSString * const ZYIntegralMallTopCHId = @"ZYIntegralMallTopCHId";
static NSString * const ZYIntegralMallSectionCHId = @"ZYIntegralMallSectionCHId";
static NSString * const ZYIntegralMallCCellId = @"ZYIntegralMallCCellId";

@implementation ZYIntegralMallController

- (NSArray *)titleArrM {
    if (!_titleArrM) {
        _titleArrM = @[@"推荐",@"流量包",@"新闻",@"金粉",@"大白菜",@"胡萝卜",@"系公司",@"西葫芦",@"鸡蛋",@"皇冠",@"辣椒",@"万银"];
    }
    return _titleArrM;
}

- (UIButton *)rightBarButton {
    if (!_rightBarButton) {
        _rightBarButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
        [_rightBarButton setTitle:@"兑换记录" forState:UIControlStateNormal];
        _rightBarButton.titleLabel.font = JGBoldFont(15);
        _rightBarButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_rightBarButton setTitleColor:[UIColor colorWithHexCode:@"#9B9898"] forState:UIControlStateNormal];
        [_rightBarButton addTarget:self action:@selector(rightBarButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBarButton;
}

- (ZYIntegralMallCategoryTitleView *)CateTitleView {
    if (!_CateTitleView) {
        _CateTitleView = [[ZYIntegralMallCategoryTitleView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kWidthScale(40))];
        WEAKSELF;
        _CateTitleView.SelBackInfo = ^(id data) {
            [weakSelf CategoryViewDidClickSelectedItemAtIndex:[data integerValue]];
        };
    }
    return _CateTitleView;
}


- (UICollectionView *)CollectionView {
    if (!_CollectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _CollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _CollectionView.backgroundColor = [UIColor whiteColor];
        _CollectionView.delegate = self;
        _CollectionView.dataSource = self;
        _CollectionView.showsVerticalScrollIndicator = NO;
        _CollectionView.showsHorizontalScrollIndicator = NO;
        
        //顶部
        [_CollectionView registerClass:[ZYIntegralMallTopCH class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZYIntegralMallTopCHId];
        
        [_CollectionView registerClass:[ZYIntegralMallSectionCH class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZYIntegralMallSectionCHId];
        
        [_CollectionView registerClass:[ZYIntegralMallCCell class] forCellWithReuseIdentifier:ZYIntegralMallCCellId];
    }
    return _CollectionView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"积分商城";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBarButton];
}

#pragma mark - 导航栏点击 兑换记录 -
- (void)rightBarButtonItemClick:(UIButton *)btn {
    
//    ZYExchangeRecordController *VC = [ZYExchangeRecordController new];
//    [self.navigationController pushViewController:VC animated:YES];
    
}


- (void)configUI {
    
    self.CateTitleView.titleArrM = self.titleArrM;
    
    [self.view addSubview:self.CollectionView];
    
    [_CollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).mas_offset(SJHeight);
        make.bottom.equalTo(self.view.mas_bottom).mas_offset(-IphoneXTH);
    }];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.titleArrM.count + 1;
}

//指定有多少个子视图
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) return 0;
    return arc4random() % 5 + 5;
}

// 显示表头的数据
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    WEAKSELF;
    if (kind == UICollectionElementKindSectionHeader){ //头部视图
        
        if (indexPath.section == 0) {
            
            ZYIntegralMallTopCH *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:ZYIntegralMallTopCHId forIndexPath:indexPath];
            self.MallTopCH = header;
            if (self.CateTitleView.superview == nil) {
                //首次使用ZYIntegralMallTopCH的时候，把CateTitleView添加到它上面。
                self.CateTitleView.y = kWidthScale(115);
                [header addSubview:self.CateTitleView];
            }
            header.BackInfo = ^(id data) {
                [weakSelf IntegralMallTopCHButtonClickWithBtn:data];
            };
            return header;
        }else {
            
            ZYIntegralMallSectionCH *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:ZYIntegralMallSectionCHId forIndexPath:indexPath];
            header.TitleLbl.text = [self.titleArrM objectAtIndex:indexPath.section-1];

//            if (indexPath.section == 1) {
//
//                header.TitleLbl.text = @"精品图书推荐";
//            }else {
//
//                header.TitleLbl.text = @"学习免流量";
//            }
            header.BackInfo = ^(id data) {
                [weakSelf IntegralMallSectionCHLookMoreBtnClickWithIndexPath:indexPath];
            };
            
            return header;
        }
        
    } else {  //尾部视图
        
    }
    return nil;
}

//指定子视图
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ZYIntegralMallCCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZYIntegralMallCCellId forIndexPath:indexPath];
    return cell;
}


#pragma mark - 点击事件 -
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
}



// 表头尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) return CGSizeMake(kDeviceWidth, kWidthScale(155));
    return CGSizeMake(kDeviceWidth, kWidthScale(38));
}

// 表尾尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}

//返回每个子视图的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat W = (kDeviceWidth - 45) / 2;
    return CGSizeMake(W, kWidthScale(180)+3);
}

//设置每个子视图的缩进
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    //UIEdgeInsets insets = {top, left, bottom, right};
    if (section == 0) return UIEdgeInsetsZero;
    if (section == 2) return UIEdgeInsetsMake(-3, 15, 20, 15);
    return UIEdgeInsetsMake(0, 15, 0, 15);
}

//设置子视图上下之间的距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 12;
}

//设置子视图左右之间的距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return  15;
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.y >= kWidthScale(115)) {
        
        if (self.CateTitleView.superview != self.view) {
            self.CateTitleView.y = SJHeight;
            [self.view addSubview:self.CateTitleView];
        }
    }else if (self.CateTitleView.superview != self.MallTopCH) {
        //当滚动的contentOffset.y小于了指定sectionHeader的y值，且还没有被添加到sectionCategoryHeaderView上的时候，就需要切换superView
        self.CateTitleView.y = kWidthScale(115);
        [self.MallTopCH addSubview:self.CateTitleView];
    }
    
    //    JGLog(@"%f - %f", scrollView.contentOffset.y, kWidthScale(115));
    
    if (!(scrollView.isTracking || scrollView.isDecelerating)) {
        //不是用户滚动的，比如setContentOffset等方法，引起的滚动不需要处理。
        return;
    }
    
    //用户滚动的才处理
    //获取categoryView下面一点的所有布局信息，用于知道，当前最上方是显示的哪个section
    CGRect topRect = CGRectMake(0, scrollView.contentOffset.y + 1, kDeviceWidth, 1);
    UICollectionViewLayoutAttributes *topAttributes = [self.CollectionView.collectionViewLayout layoutAttributesForElementsInRect:topRect].firstObject;
    NSUInteger topSection = topAttributes.indexPath.section;
    
//    JGLog(@"topSection - %ld", topSection);
    if (topAttributes != nil && topSection >= 1) {
        if (self.CateTitleView.selectedIndex != topSection - 1) {
            //不相同才切换
            [self.CateTitleView selectItemAtIndex:topSection - 1];
        }
    }
}

- (void)CategoryViewDidClickSelectedItemAtIndex:(NSInteger)index {
    //这里关心点击选中的回调！！！
        
    if (index == 0) {
        
        [self.CollectionView setContentOffset:CGPointMake(0, 0) animated:YES];
        
    }else {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:index+1];
        [self.CollectionView layoutIfNeeded];
        UICollectionViewLayoutAttributes *attributes =[self.CollectionView layoutAttributesForItemAtIndexPath:indexPath];
        CGRect rect = attributes.frame;
        
        CGPoint point = CGPointMake(0, rect.origin.y - kWidthScale(38));
        [self.CollectionView setContentOffset:point animated:YES];
    }
}


#pragma mark - 顶部按钮点击 -
- (void)IntegralMallTopCHButtonClickWithBtn:(UIButton *)btn {
    
    if (btn.tag == 1) { //福利币说明
        
    }else if (btn.tag == 2) { //福利币明细
        
//        ZYInMallWelfareDetailController *VC = [ZYInMallWelfareDetailController new];
//        [self.navigationController pushViewController:VC animated:YES];
    }
}

#pragma mark - 查看更多
- (void)IntegralMallSectionCHLookMoreBtnClickWithIndexPath:(NSIndexPath *)indexPath {
    
    ZYIntegralMallMoreController *VC = [ZYIntegralMallMoreController new];
    VC.title = [self.titleArrM objectAtIndex:indexPath.section - 1];
    [self.navigationController pushViewController:VC animated:YES];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
