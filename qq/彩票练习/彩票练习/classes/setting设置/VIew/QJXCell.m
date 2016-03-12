//
//  QJXCell.m
//  彩票练习
//
//  Created by 权建星 on 16/3/9.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import "QJXCell.h"
#import "QJXArrow.h"
#import "QJXSwitch.h"

@implementation QJXCell
//内部封装创建cell的方法
+ (instancetype)cellWithTableView:(UITableView *)tableView andStyle:(UITableViewCellStyle)style{
    static NSString *ID = @"in";
    QJXCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[QJXCell alloc] initWithStyle:style reuseIdentifier:ID];
    }
    return cell;
}
//给模型赋值
- (void)setRowModel:(QJXRowModel *)rowModel{
    _rowModel = rowModel;
    //设置数据
    [self setinformation:rowModel];
    //设置辅助view
    [self setView:rowModel];
}
//设置cell属性
- (void)setinformation:(QJXRowModel *)row{
    self.textLabel.text = row.title;
    self.imageView.image = row.iamge;
    self.detailTextLabel.text = row.detailTitle;
}
//设置cell的辅助view
- (void)setView:(QJXRowModel *)row{
    if ([row isKindOfClass:[QJXArrow class]]) {
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }else if ([row isKindOfClass:[QJXSwitch class]]){
        self.accessoryView = [[UISwitch alloc] init];
    }else{
        self.accessoryView = nil;
    }
}
@end
