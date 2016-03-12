//
//  QJXNavigationController.m
//  彩票练习
//
//  Created by 权建星 on 16/3/4.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import "QJXNavigationController.h"

@interface QJXNavigationController ()<UINavigationControllerDelegate>
@property (nonatomic,weak) id popdelegate;

@end

@implementation QJXNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.popdelegate = self.interactivePopGestureRecognizer.delegate;
}

+ (void)initialize{
    //获取该类的所有bar
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor blackColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [bar setTitleTextAttributes:dict];
    //设置主题颜色
    [bar setBarTintColor:[UIColor orangeColor]];
    //设置返回按钮的颜色
//    [bar setTintColor:[UIColor whiteColor]];
//    
//    
//    UIBarButtonItem *baritem = [UIBarButtonItem appearance];
//    [baritem setBackgroundVerticalPositionAdjustment:-23 forBarMetrics:(UIBarMetricsDefault)];
//    [baritem setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -283) forBarMetrics:(UIBarMetricsDefault)];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //添加自定义返回按钮图片
    //判断是否是导航控制器根控制器
    if (self.childViewControllers.count != 0) {
        NSLog(@"非根控制器");
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NavBack"] style:0 target:self action:@selector(back)];
        //清空代理
        self.interactivePopGestureRecognizer.delegate = nil;
    }
    NSLog(@"根控制器");
    [super pushViewController:viewController animated:animated];
    NSLog(@"%s",__func__);
}
//返回上一个界面
- (void)back{
    [self popViewControllerAnimated:YES];
}
//导控制器即将显示View的时候调用
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count == 1) {
        //是根控制器
        self.interactivePopGestureRecognizer.delegate = self.popdelegate;
    }
}

@end









