//
//  QJPopVIew.m
//  彩票练习
//
//  Created by 权建星 on 16/3/5.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import "QJPopVIew.h"
#import "QJCoverView.h"

@implementation QJPopVIew

//快速创建xib
+ (instancetype)showInPoint:(CGPoint)point{
    
    QJPopVIew *popView = [[NSBundle mainBundle] loadNibNamed:@"QJPopVIew" owner:nil options:nil][0];
    popView.center = point;
    
    [[UIApplication sharedApplication].keyWindow addSubview:popView];
    
    return popView;
}
//按钮点击
- (IBAction)btnClick:(UIButton *)sender {
    //由于需要对别的类处理,所以交给控制器处理
    if ([self.delegate respondsToSelector:@selector(popViewButtonDidClick:)]) {
        [self.delegate popViewButtonDidClick:self];
    }
}

- (void)hiddenPopViewToPint:(CGPoint)point complete:(void(^)())complete{
    [UIView animateWithDuration:1 animations:^{
        self.center = point;
        self.transform = CGAffineTransformScale(self.transform, 0.001, 0.001);
    } completion:^(BOOL finished) {
//        for (UIView *view in [UIApplication sharedApplication].keyWindow.subviews) {
//            if ([view isKindOfClass:[QJCoverView class]]) {
//                [view removeFromSuperview];
//            }
//        }
        complete();
        [self removeFromSuperview];
    }];
}

@end
