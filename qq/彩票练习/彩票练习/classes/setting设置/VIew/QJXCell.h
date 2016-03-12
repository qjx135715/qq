//
//  QJXCell.h
//  彩票练习
//
//  Created by 权建星 on 16/3/9.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QJXRowModel.h"

@interface QJXCell : UITableViewCell

@property (nonatomic,strong)QJXRowModel *rowModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView andStyle:(UITableViewCellStyle)style;

@end
