//
//  XDKLotteryHallViewController.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/19.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKLotteryHallViewController.h"
#import "XDKCover.h"
#import "XDKPopMenu.h"

@interface XDKLotteryHallViewController() <XDKPopMenuDelegate>

@end

@implementation XDKLotteryHallViewController

-(void)viewDidLoad
{
    UIImage *image = [UIImage imageRmoveRenderWithNamed:@"CS50_activity_image"];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image  style:UIBarButtonItemStyleDone target:self action:@selector(activity)];
    
}


-(void)activity
{
    [XDKCover show];
    
    XDKPopMenu *menu = [XDKPopMenu showInPoint:self.view.center];
    
    menu.delegate = self;
}

#pragma mark -<XDKPopMenuDelegate>
-(void)popMenuDidClickCloseBtn:(XDKPopMenu *)popMenu
{
    // 移除menu
    [popMenu hideToPoint:CGPointMake(44, 44) completion:^{
        // 移除蒙板
        [XDKCover hide];
    }];
}

@end
