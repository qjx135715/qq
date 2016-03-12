//
//  QJXBaseTableVC.m
//  彩票练习
//
//  Created by 权建星 on 16/3/9.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import "QJXBaseTableVC.h"

@interface QJXBaseTableVC ()


@end

@implementation QJXBaseTableVC

- (instancetype)init{
    
    return [self initWithStyle:(UITableViewStyleGrouped)];
    
}

- (NSMutableArray *)array{
    if (_array == nil) {
        _array = [[NSMutableArray alloc] init];
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //取出当前组
    QJXGroupModel *model= self.array[section];
    
    return model.rowArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QJXCell *cell = [QJXCell cellWithTableView:tableView andStyle:(UITableViewCellStyleDefault)];
    //取出当前组
    QJXGroupModel *group = self.array[indexPath.section];
    //取出单行
    QJXRowModel *row = group.rowArray[indexPath.row];
    //给cell赋值
    cell.rowModel = row;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取出当前行
    QJXGroupModel *group = self.array[indexPath.section];
    QJXRowModel *row = group.rowArray[indexPath.row];
    //判断是否有block
    if (row.myTask) {
        row.myTask(indexPath);
        return;
    }
    //判断当前行是否是箭头
    if ([row isKindOfClass:[QJXArrow class]]) {
        QJXArrow *arrow = (QJXArrow *)row;
        if (arrow.haveClass) {
            UIViewController *vc = [[arrow.haveClass alloc] init];
//            vc.view.backgroundColor = [UIColor purpleColor];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    QJXGroupModel *group = self.array[section];
    return group.headTitle;
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    QJXGroupModel *group = self.array [section];
    return group.footerTitle;
}

@end
