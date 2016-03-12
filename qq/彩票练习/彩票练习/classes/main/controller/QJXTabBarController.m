//
//  QJXTabBarController.m
//  彩票
//
//  Created by 权建星 on 16/3/4.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import "QJXTabBarController.h"
#import "QJXArenaViewController.h"
#import "QJXFindTableViewController.h"
#import "QJXHallTableViewController.h"
#import "QJXLotterMessageTableViewController.h"
#import "QJXMylotterViewController.h"

#import "QJXTabBar.h"
#import "QJXNavigationController.h"
#import "QJXArenaNavigationController.h"


@interface QJXTabBarController ()<QJXTabBarDeegate>
@property (nonatomic,strong) NSMutableArray* buttonArray;

@end

@implementation QJXTabBarController

//懒加载
- (NSMutableArray *)buttonArray{
    if (_buttonArray == nil) {
        _buttonArray = [[NSMutableArray alloc] init];
    }
    return _buttonArray;
}

//添加所有子控制器,创建新的tabbar并传递模型数据
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加所有子控制器
    [self addAllChildController];
    
    //创建新的tabBar,系统的不能满足需要
    //1 先删除系统自带的tabBar
    //由于需要系统的隐藏tabbar的功能,所以不能删除tabbar
//    [self.tabBar removeFromSuperview];
    
    //2 创建自己的tabBar
    QJXTabBar *tabBar = [[QJXTabBar alloc] init];
    
    //3 给自己的tabBar设置属性sh
    tabBar.frame = self.tabBar.bounds;
//    tabBar.backgroundColor = [UIColor redColor];
    //4 向自定义tabBar传递数组模型数据
    tabBar.array = self.buttonArray;
    
    //6 设置代理
    tabBar.delegate = self;
    
    //5 赋值
    [self.tabBar addSubview:tabBar];
}
//在view即将显示的时候,将系统tabbar按钮删除
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    for (UIView *view in self.tabBar.subviews) {
        if (![view isKindOfClass:[QJXTabBar class]]) {
            [view removeFromSuperview];
            //然后修改tabbar自带的属性
        }
    }
}

//实现代理方法,接收被选中的按钮
- (void)tabBar:(QJXTabBar *)tabBar WithSelectIndex:(NSInteger)selectIdex{
    //设置当前选中的按钮
    self.selectedIndex = selectIdex;
}

//添加所有子控制器
- (void)addAllChildController{
    //彩票大厅
    QJXHallTableViewController *hallVC = [[QJXHallTableViewController alloc] init];
    hallVC.view.backgroundColor = [UIColor redColor];
    [self addSingleVC:hallVC title:@"彩票大厅" image:[UIImage imageNamed:@"TabBar_LotteryHall_new"] selectImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"]];
    //竞技场
    QJXArenaViewController *arenaVC = [[QJXArenaViewController alloc] init];
    arenaVC.view.backgroundColor = [UIColor blueColor];
    [self addSingleVC:arenaVC title:@"竞技场" image:[UIImage imageNamed:@"TabBar_Arena_new"] selectImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"]];
    //发现
//    QJXFindTableViewController *findVC = [[QJXFindTableViewController alloc] init];
    //加载storyboard
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"QJXFindTableViewController" bundle:nil];
    UIViewController *findVC = [story instantiateInitialViewController];
    [self addSingleVC:findVC title:@"发现" image:[UIImage imageNamed:@"TabBar_Discovery_new"] selectImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"]];
    //开奖信息
    QJXLotterMessageTableViewController *hisVC = [[QJXLotterMessageTableViewController alloc] init];
    hisVC.view.backgroundColor = [UIColor purpleColor];
    [self addSingleVC:hisVC title:@"开奖信息" image:[UIImage imageNamed:@"TabBar_History_new"] selectImage:[UIImage imageNamed:@"TabBar_History_selected_new"]];
    //我的彩票
    QJXMylotterViewController *myLottery = [[QJXMylotterViewController alloc] init];
    [self addSingleVC:myLottery title:@"我的彩票" image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selectImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"]];
    

//添加每一个子控件
}
- (void)addSingleVC:(UIViewController *)vc title:(NSString *)title image:(UIImage *)image selectImage:(UIImage *)selectImage{
    
    //设置tabBar属性
    
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectImage;
    vc.title = title;
    //给控制器添加一层导航控制器
    if ([vc isKindOfClass:[QJXArenaViewController class]]) {
        QJXArenaNavigationController *nav = [[QJXArenaNavigationController alloc] initWithRootViewController:vc];
        [self addChildViewController:nav];
    }else{
        QJXNavigationController *nav = [[QJXNavigationController alloc] initWithRootViewController:vc];
        [self addChildViewController:nav];
    }
    //记录tabBar里面的模型,并添加到数组中
    [self.buttonArray addObject:vc.tabBarItem];
//    NSLog(@"%@",self.buttonArray);
}

@end
