//
//  QJXGroupModel.m
//  彩票练习
//
//  Created by 权建星 on 16/3/9.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import "QJXRowModel.h"

@implementation QJXRowModel

+ (instancetype)rowModelWithTitle:(NSString *)title AndImage:(UIImage *)image{
    return [[self alloc] initWithTitle:title AndImage:image];
}

- (instancetype)initWithTitle:(NSString *)title AndImage:(UIImage *)image{
    if (self = [super init]) {
        self.title = title;
        self.iamge = image;
    }
    return self;
}

@end
