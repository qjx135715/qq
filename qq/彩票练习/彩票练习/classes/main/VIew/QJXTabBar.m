//
//  QJXTabBar.m
//  彩票练习
//
//  Created by 权建星 on 16/3/4.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import "QJXTabBar.h"
#import "QJXButton.h"

@interface QJXTabBar()
@property (nonatomic,strong) UIButton *previousBtn;

@end

@implementation QJXTabBar

- (void)setArray:(NSArray *)array{
    //加载tabbar中的子控件
    _array = array;
    for (int i = 0; i < array.count; i++) {
        
        ///取出每一个数组中的数据
        UITabBarItem *item = array[i];
        
        //添加自定义按钮
        QJXButton *button = [QJXButton buttonWithType:(UIButtonTypeCustom)];
        button.tag = i;
        
        //设置按钮的状态
//        [button setImage:item.image forState:(UIControlStateNormal)];
//        [button setImage:item.selectedImage forState:(UIControlStateSelected)];
        [button setBackgroundImage:item.image forState:(UIControlStateNormal)];
        [button setBackgroundImage:item.selectedImage forState:(UIControlStateSelected)];
        
        //添加自控家
        [self addSubview:button];
        
        //监听按钮点击
        [button addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchDown)];
        
        //判断当前是否是第一个按钮,
        if (i == 0) {
            [self btnClick:button];
        }
    }
}

- (void)btnClick:(UIButton *)btn{
    //取消上一个按钮的选中状态
    self.previousBtn.selected = NO;
    
    //将当前按钮设置为选中状态
    btn.selected = YES; 
    
    //将当前按钮设置为下一个按钮
    self.previousBtn = btn;
    
    //调用代理方法,将当前选中的按钮传递出去
    if ([self.delegate respondsToSelector:@selector(tabBar:WithSelectIndex:)]) {
        [self.delegate tabBar:self WithSelectIndex:btn.tag];
    }
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //设置按钮尺寸
    CGFloat width = self.bounds.size.width / 5;
    CGFloat heith = self.bounds.size.height;
    CGFloat x = 0;
    CGFloat y = 0;
    for (int i = 0 ; i < self.subviews.count; i++) {
        //取出每一个按钮
        QJXButton *btn = self.subviews[i];
        x = width * i;
        btn.frame = CGRectMake(x, y, width, heith);
    }
}


@end
