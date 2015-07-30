//
//  XDKNewFeatureController.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/20.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKNewFeatureController.h"
#import "XDKNewFeatureCell.h"
#import "XDKNewFeatureCell.h"

#define XDKNewFeatureCount 4

@interface XDKNewFeatureController ()
@property (nonatomic,weak)UIImageView * guide;
@property (nonatomic,weak)UIImageView * guideLargeText;
@property (nonatomic,weak)UIImageView * guideSmallText;

/** lastOffsetX */
@property (nonatomic,assign) CGFloat  lastOffsetX;
@end

@implementation XDKNewFeatureController


-(instancetype)init
{
    // 流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    
    return [super initWithCollectionViewLayout:layout];
}

-(void)viewDidLoad
{
    [self.collectionView registerClass:[XDKNewFeatureCell class] forCellWithReuseIdentifier:ID];
    
    [self setUpCollectionViewProperties];
    
    [self setUpChildViewLayout];
}

static NSString *ID = @"lottery";

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XDKNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground",indexPath.item + 1];
    
    cell.image = [UIImage imageNamed:imageName];
    
    [cell cellHideStartBtn:indexPath totalCount:XDKNewFeatureCount];

    return cell;
}

-(void)setUpCollectionViewProperties
{
    self.collectionView.backgroundColor = [UIColor grayColor];
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.bounces = NO;
}

-(void)setUpChildViewLayout
{
    UIImageView *guide = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    [self.collectionView addSubview:guide];
    guide.x += 50;
    _guide = guide;
    
    UIImageView *guideLargeText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    [self.collectionView addSubview:guideLargeText];
    guideLargeText.center = CGPointMake(self.view.width * 0.5, self.view.height * 0.7);
    _guideLargeText = guideLargeText;
    
    UIImageView *guideSmallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    [self.collectionView addSubview:guideSmallText];
    guideSmallText.center = CGPointMake(self.view.width * 0.5, self.view.height * 0.8);
    _guideSmallText = guideSmallText;
    
    UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    [self.collectionView addSubview:guideLine];
    guideLine.x -= 150;
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat delta = offsetX - _lastOffsetX;
//    NSLog(@"%f",delta);
    _guide.x += 2 *delta;
    _guideLargeText.x += 2 *delta;
    _guideSmallText.x += 2 *delta;
    [UIView animateWithDuration:0.5 animations:^{
        _guide.x -= delta;
        _guideLargeText.x -= delta;
        _guideSmallText.x -= delta;
    }];
    
    _lastOffsetX = offsetX;
    
    int page = offsetX / scrollView.width + 1;
    // 切换子控件
    NSString *guideName = [NSString stringWithFormat:@"guide%d",page];
    _guide.image = [UIImage imageNamed:guideName];
    
    NSString *guideLargeText = [NSString stringWithFormat:@"guideLargeText%d",page];
    _guideLargeText.image = [UIImage imageNamed:guideLargeText];
    
    NSString *guideSmallText = [NSString stringWithFormat:@"guideSmallText%d",page];
    _guideSmallText.image = [UIImage imageNamed:guideSmallText];
}

-(void)dealloc
{
    NSLog(@"%s",__func__);
}
@end
















