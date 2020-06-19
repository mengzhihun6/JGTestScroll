//
//  ZYBaseViewController.m
//  WSCollege
//
//  Created by spring on 2020/5/15.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYBaseViewController.h"

@interface ZYBaseViewController ()

@end

@implementation ZYBaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];

    
    [self configUI];
    
}

- (void)configUI {}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
