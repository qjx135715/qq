//
//  QJPopVIew.h
//  彩票练习
//
//  Created by 权建星 on 16/3/5.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QJPopVIew;
@protocol QJPopVIewDelegate <NSObject>

- (void)popViewButtonDidClick:(QJPopVIew *)popView;

@end

@interface QJPopVIew : UIView

+ (instancetype)showInPoint:(CGPoint)point;
- (void)hiddenPopViewToPint:(CGPoint)point complete:(void(^)())complete;

@property (nonatomic,weak) id<QJPopVIewDelegate>delegate;

@end
