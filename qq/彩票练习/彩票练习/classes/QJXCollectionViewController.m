//
//  QJXCollectionViewController.m
//  彩票练习
//
//  Created by 权建星 on 16/3/8.
//  Copyright © 2016年 权建星. All rights reserved.
//

#import "QJXCollectionViewController.h"
#import "QJXCollectionViewCell.h"

@interface QJXCollectionViewController ()
@property (nonatomic,weak) UIImageView *guide;
@property (nonatomic,assign) CGFloat previousX;
@end

@implementation QJXCollectionViewController

static NSString * const ID = @"Cell";

- (instancetype)init{
    //创建布局控制器
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    //设置尺寸和属性
    flow.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//    flow.minimumInteritemSpacing = 0;
    flow.minimumLineSpacing = 0;
    
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return [super initWithCollectionViewLayout:flow];
//    self.view
//    self.collectionView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册cell标识
    [self.collectionView registerClass:[QJXCollectionViewCell class] forCellWithReuseIdentifier:ID];
    //设置分页
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
    
    //添加子控件到collectView中
    [self setUp];
            NSLog(@"%p----%p",self.view,self.collectionView);
}

- (void)setUp{
    //添加一个imageView控件
    //线条
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
//    imageV.frame.origin.x -= 150;
    
    [self.collectionView addSubview:imageV];
    
    //球
    UIImageView *guide1ImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
//    guide1ImageV.x += 50;
    self.guide = guide1ImageV;
    [self.collectionView addSubview:guide1ImageV];
    
    UIImageView *largeTextImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText3"]];
    largeTextImageV.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.7);
    [self.collectionView addSubview:largeTextImageV];
    
    //guideSmallText1.
    UIImageView *smallTextImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    smallTextImageV .center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.8);
    [self.collectionView addSubview:smallTextImageV];
    
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    QJXCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    NSString *image = [NSString stringWithFormat:@"guide%ldBackground568h",indexPath.item + 1];
    cell.image = [UIImage imageNamed:image];
    //判断当前是否是最后一个,如果是,就添加按钮
    if (indexPath.item == 3) {
        cell.btn.hidden = NO;
    }else{
        cell.btn.hidden = YES;
    }
    
    
    return cell;
}

//减速结束后调用该方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //获取图片,做动画
    CGFloat offset = self.collectionView.contentOffset.x - self.previousX;
    CGRect temp1 = self.guide.frame;
    temp1.origin.x += offset * 2;
    self.guide.frame = temp1;
    [UIView animateWithDuration:1 animations:^{
//        self.guide.frame.origin.x += 375;
        CGRect temp = self.guide.frame;
        temp.origin.x -= offset;
        self.guide.frame = temp;
    }];
    self.previousX = self.collectionView.contentOffset.x;
    //计算当前页数
    int page = self.collectionView.contentOffset.x / self.collectionView.frame.size.width;
    self.guide.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%d",page + 1]];

}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
