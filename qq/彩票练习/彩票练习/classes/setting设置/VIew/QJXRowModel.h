//
//  QJXGroupModel.h
//  彩票练习
//
//  Created by 权建星 on 16/3/9.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QJXRowModel : NSObject
@property (nonatomic,strong) UIImage *iamge;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *detailTitle;
@property (nonatomic,copy) void (^myTask)(NSIndexPath *indexPath);

+ (instancetype)groupModelWithTitle:(NSString *)title AndImage:(UIImage *)image;
- (instancetype)initWithTitle:(NSString *)title AndImage:(UIImage *)image;

@end
