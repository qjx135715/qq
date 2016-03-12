//
//  QJXMylotterViewController.m
//  彩票
//
//  Created by 权建星 on 16/3/4.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import "QJXMylotterViewController.h"
#import "QJXSettingViewController.h"

@interface QJXMylotterViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation QJXMylotterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //取出当前按钮中的背景图片
    UIImage *image = self.loginBtn.currentBackgroundImage;
    //将图片拉伸
    UIImage *newImage = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height *0.5];
    //再设置回按钮
    [self.loginBtn setBackgroundImage:newImage forState:(UIControlStateNormal)];
    
    //添加一个按钮到导航条左侧
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:(UIControlStateNormal)];
    [btn setTitle:@"客服" forState:(UIControlStateNormal)];
    //还需要按钮自适应尺寸
    [btn sizeToFit];
    
    //添加导航条属性
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Mylottery_config"] style:0 target:self action:@selector(change)];
}

- (void)change{
    QJXSettingViewController *setting = [[QJXSettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
