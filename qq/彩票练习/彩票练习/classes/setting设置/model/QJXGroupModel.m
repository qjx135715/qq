//
//  QJXGroupModel.m
//  彩票练习
//
//  Created by 权建星 on 16/3/9.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import "QJXGroupModel.h"

@implementation QJXGroupModel

- (instancetype)initWithRowArray:(NSArray *)rowArray{
    if (self = [super init]) {
        _rowArray = rowArray;
    }
    return self;
}
+ (instancetype)groupWithRowArray:(NSArray *)rowArray{
    return [[self alloc] initWithRowArray:rowArray];
}
@end
