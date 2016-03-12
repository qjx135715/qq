//
//  QJXCollectionViewCell.m
//  彩票练习
//
//  Created by 权建星 on 16/3/8.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import "QJXCollectionViewCell.h"
#import "QJXTabBarController.h"

@interface QJXCollectionViewCell()
@property (nonatomic,weak) UIImageView *imageV;


@end

@implementation QJXCollectionViewCell
- (UIButton *)btn{
    if (_btn == nil) {
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [btn setImage:[UIImage imageNamed:@"guideStart"] forState:(UIControlStateNormal)];
        [btn sizeToFit];
        btn.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.8);

        _btn = btn;
        [self addSubview:btn];
        [btn addTarget:self action:@selector(change:) forControlEvents:(UIControlEventAllTouchEvents)];
    }
    return _btn;
}

- (void)change:(UIButton *)btn{
    QJXTabBarController *tabBar = [[QJXTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBar;
}

- (UIImageView *)imageV{
    if (_imageV == nil) {
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.frame = self.bounds;
//        imageV.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:imageV];
        _imageV = imageV;
    }
    return _imageV;
}

- (void)setImage:(UIImage *)image{
    _image = image;
    self.imageV.image = image;
}
@end
