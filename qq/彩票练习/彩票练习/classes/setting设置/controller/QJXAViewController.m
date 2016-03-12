//
//  QJXAViewController.m
//  彩票练习
//
//  Created by 权建星 on 16/3/9.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import "QJXAViewController.h"
#import "QJXCell.h"

@interface QJXAViewController ()

@end

@implementation QJXAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"比分直播";
    [self addGroup0];

}

- (void)addGroup0 {
    
    //描述行模型
    QJXRowModel *model1 = [[QJXRowModel alloc] initWithTitle:@"双色球" AndImage:nil];
    model1.detailTitle = @"每周二,四,日开奖";
    model1.myTask= ^(NSIndexPath *indexPath){
        NSLog(@"qjx");
    };
    
    QJXRowModel *model2 = [[QJXRowModel alloc] initWithTitle:@"双色球" AndImage:nil];
    QJXArrow *model3= [[QJXArrow alloc] initWithTitle:@"双色球" AndImage:nil];
    QJXSwitch *model4 = [[QJXSwitch alloc] initWithTitle:@"双色球" AndImage:nil];
    QJXSwitch *model5 = [[QJXSwitch alloc] initWithTitle:@"双色球" AndImage:nil];
    
    //一组中有多少行
    NSArray *rowArray = @[model1,model2,model3,model4,model5];
    
    //创建一个组模型
    QJXGroupModel *gropItem = [QJXGroupModel groupWithRowArray:rowArray];
    gropItem.headTitle = @"第一组头";
    gropItem.footerTitle = @"第一组尾部";
    
    [self.array addObject:gropItem];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    QJXCell *cell = [QJXCell cellWithTableView:tableView andStyle:(UITableViewCellStyleSubtitle)];
    QJXGroupModel *group = self.array[indexPath.section];
    QJXRowModel *row = group.rowArray[indexPath.row];
    cell.rowModel = row;
    
    return cell;
}

@end





