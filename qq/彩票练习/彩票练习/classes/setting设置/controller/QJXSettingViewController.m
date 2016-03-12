//
//  QJXSettingViewController.m
//  彩票练习
//
//  Created by 权建星 on 16/3/9.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import "QJXSettingViewController.h"

#import "QJXAViewController.h"

@interface QJXSettingViewController ()

@end

@implementation QJXSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"fuck";
        NSLog(@"%p----%p",self.view,self.tableView);
    //添加数据
    [self setUp1];
    [self setUp2];
    [self setUp3];
}

- (void)setUp1{
    QJXArrow *model1 = [[QJXArrow alloc] initWithTitle:@"使用兑换码" AndImage:[UIImage imageNamed:@"more_homeshake"]];
    model1.haveClass = [QJXAViewController class];
    
    QJXSwitch *model2 = [[QJXSwitch alloc] initWithTitle:@"优惠券" AndImage:[UIImage imageNamed:@"RedeemCode"]];
    
    NSArray *array = @[model1,model2];

    QJXGroupModel *group = [[QJXGroupModel alloc] initWithRowArray:array];
    group.headTitle = @"第一组头部";
    group.footerTitle = @"第一组尾部";
    
    [self.array addObject:group];
}
- (void)setUp2{
    QJXRowModel *model = [[QJXRowModel alloc] initWithTitle:@"使用兑换码" AndImage:[UIImage imageNamed:@"more_homeshake"]];
    QJXRowModel *mode2 = [[QJXRowModel alloc] initWithTitle:@"优惠券" AndImage:[UIImage imageNamed:@"RedeemCode"]];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObjectsFromArray:@[model,mode2]];
    QJXGroupModel *group = [[QJXGroupModel alloc] initWithRowArray:array];
    group.footerTitle = @"dsssdfs";
    
    [self.array addObject:group];
}
- (void)setUp3{
    QJXRowModel *model = [[QJXRowModel alloc] initWithTitle:@"使用兑换码" AndImage:[UIImage imageNamed:@"more_homeshake"]];
    QJXRowModel *mode2 = [[QJXRowModel alloc] initWithTitle:@"优惠券" AndImage:[UIImage imageNamed:@"RedeemCode"]];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObjectsFromArray:@[model,mode2]];
    QJXGroupModel *group = [QJXGroupModel groupWithRowArray:array];
    
    [self.array addObject:group];
}

@end
