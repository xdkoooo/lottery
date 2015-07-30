//
//  XDKBuyLotteryViewController.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/20.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKBuyLotteryViewController.h"
#import "XDKTitleButton.h"

@interface XDKBuyLotteryViewController ()

@end

@implementation XDKBuyLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *titleBtn = [XDKTitleButton buttonWithType:UIButtonTypeCustom];
    [titleBtn setTitle:@"全部彩种" forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
//    [titleBtn sizeToFit];
    self.navigationItem.titleView = titleBtn;
    
}

@end
