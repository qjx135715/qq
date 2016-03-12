//
//  QJXBuyViewController.m
//  彩票练习
//
//  Created by 权建星 on 16/3/7.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import "QJXBuyViewController.h"
#import "QJXButton.h"

@interface QJXBuyViewController ()

@end

@implementation QJXBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航条的标题,创建自定义按钮
    QJXButton  *btn = [QJXButton buttonWithType:(UIButtonTypeCustom)];
    //设置按钮属性
    [btn setTitle:@"全部选中" forState:(UIControlStateNormal)];
    [btn setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:(UIControlStateNormal)];
    //设置按钮尺寸
    [btn sizeToFit];
    //添加按钮到导航控制器标题
    self.navigationItem.titleView = btn;
    
    //添加返回按钮
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NavBack"] style:0 target:self action:@selector(change)];
}
//- (void)change{
//    NSLog(@"%s",__func__);
//    [self.navigationController popViewControllerAnimated:YES];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
