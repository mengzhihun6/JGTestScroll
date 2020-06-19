//
//  ZYIntegralMallMoreController.m
//  WSCollege
//
//  Created by spring on 2020/6/11.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYIntegralMallMoreController.h"
#import "ZYIntegralMallCCell.h"


@interface ZYIntegralMallMoreController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *CollectionView;

@end

static NSString * const ZYIntegralMallCCellId = @"ZYIntegralMallCCellId";

@implementation ZYIntegralMallMoreController


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
                
        [_CollectionView registerClass:[ZYIntegralMallCCell class] forCellWithReuseIdentifier:ZYIntegralMallCCellId];
    }
    return _CollectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}

- (void)configUI {
    
    //顶部线
    UIView *TopLine = [[UIView alloc] initWithFrame:CGRectMake(0, SJHeight, kDeviceWidth, 1)];
    TopLine.backgroundColor = JGHexColor(@"#CCCCCC");
    [self.view addSubview:TopLine];
    
    [self.view addSubview:self.CollectionView];
    
    [_CollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).mas_offset(SJHeight+1);
        make.height.mas_equalTo(kDeviceHight - SJHeight - IphoneXTH-1);
    }];
}



#pragma mark - UICollectionViewDataSource
//指定有多少个子视图
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 18;
}

//// 显示表头的数据
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//
//    if (kind == UICollectionElementKindSectionHeader){ //头部视图
//
//    } else {  //尾部视图
//
//    }
//    return nil;
//}

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
    return CGSizeZero;
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
    return UIEdgeInsetsMake(15, 15, 15, 15);
}

//设置子视图上下之间的距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 12;
}

//设置子视图左右之间的距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return  15;
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
