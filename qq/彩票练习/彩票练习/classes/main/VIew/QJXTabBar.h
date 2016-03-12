//
//  QJXTabBar.h
//  彩票练习
//
//  Created by 权建星 on 16/3/4.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import <UIKit/UIKit.h>

//设置代理将当前选中的按钮传递出去给控制器
@class QJXTabBar;
@protocol QJXTabBarDeegate <NSObject>

- (void)tabBar:(QJXTabBar *)tabBar WithSelectIndex:(NSInteger)selectIdex;

@end
@interface QJXTabBar : UIView

@property (nonatomic,strong) NSArray *array;

@property (nonatomic,weak) id<QJXTabBarDeegate>delegate;
@end
