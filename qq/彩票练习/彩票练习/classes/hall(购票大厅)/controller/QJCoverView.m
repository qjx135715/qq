//
//  QJCoverView.m
//  彩票练习
//
//  Created by 权建星 on 16/3/5.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import "QJCoverView.h"

@implementation QJCoverView

+ (void)coverView{
    //提供接口,快速创建coverView
    QJCoverView *coverView = [[QJCoverView alloc] init];
    coverView.frame = [UIScreen mainScreen].bounds;
    coverView.backgroundColor = [UIColor blueColor];
    coverView.alpha = 0.6;
    
    //添加到最外层窗口中
    [[UIApplication sharedApplication].keyWindow addSubview:coverView];
}

@end
