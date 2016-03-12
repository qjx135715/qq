//
//  QJXArenaViewController.m
//  彩票
//
//  Created by 权建星 on 16/3/4.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import "QJXArenaViewController.h"

@interface QJXArenaViewController ()

@end

@implementation QJXArenaViewController

- (void)loadView{
    //添加一张图片作为view
    UIImage *image = [UIImage imageNamed:@"NLArenaBackground"];
    UIImageView *imageV = [[UIImageView alloc] initWithImage:image];
    self.view = imageV;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载新控件
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"足球",@"篮球"]];
    //设置默认选中第一个seg
    [seg setSelectedSegmentIndex:0];
    //设置背景图片
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    //设置标题的颜色
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    [seg setTitleTextAttributes:dict forState:UIControlStateSelected];
    
    //设置主题颜色
    [seg setTintColor:[UIColor colorWithRed:0 green:158 /255.0 blue:161 /255.0 alpha:1]];
    
    self.navigationItem.titleView = seg;
    
}

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
