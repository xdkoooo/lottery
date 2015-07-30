//
//  XDKNewFeatureCell.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/20.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKNewFeatureCell.h"
#import "XDKTabBarController.h"

@interface XDKNewFeatureCell()

@property (nonatomic,weak)UIImageView * imageView;
@property (nonatomic,weak)UIButton * startBtn;
@end

@implementation XDKNewFeatureCell

-(UIButton *)startBtn
{
    if (_startBtn == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        
        // 自适应自身尺寸
        [btn sizeToFit];
        // 先设置尺寸，在固定中心点
        btn.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.9);
        
//        CGSize size = btn.currentBackgroundImage.size;
        
        [self.contentView addSubview:btn];
        
        
        [btn addTarget:self action:@selector(startBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _startBtn = btn;
    }
    return _startBtn;
}

-(UIImageView *)imageView
{
    if (_imageView == nil) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:imageView];
        _imageView = imageView;
    }
    return _imageView;
}

-(void)setImage:(UIImage *)image
{
    _image = image;
    self.imageView.image = image;
}

-(void)cellHideStartBtn:(NSIndexPath *)indexPath totalCount:(int)count
{
    NSUInteger index = indexPath.item;
    if (index == count - 1) {
        self.startBtn.hidden = NO;
    }else{
        self.startBtn.hidden = YES;
    }
}

-(void)startBtnClick:(UIButton *)btn
{
    XDKKeyWindow.rootViewController = [[XDKTabBarController alloc] init];
}



@end
