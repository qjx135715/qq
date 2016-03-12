//
//  QJXGroupModel.h
//  彩票练习
//
//  Created by 权建星 on 16/3/9.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QJXGroupModel : NSObject
//头部标题
@property (nonatomic,strong) NSString *headTitle;
//尾部标题
@property (nonatomic,strong) NSString *footerTitle;
//行数数组
@property (nonatomic,strong) NSArray *rowArray;

- (instancetype)initWithRowArray:(NSArray *)rowArray;
+ (instancetype)groupWithRowArray:(NSArray *)rowArray;

@end
