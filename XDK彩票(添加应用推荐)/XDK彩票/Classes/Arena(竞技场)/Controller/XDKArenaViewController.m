//
//  XDKArenaViewController.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/19.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKArenaViewController.h"

@implementation XDKArenaViewController

-(void)loadView
{
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:XDKKeyWindow.bounds];
    imageV.image = [UIImage imageNamed:@"NLArenaBackground"];
    self.view = imageV;
}

-(void)viewDidLoad
{
    UISegmentedControl *titleCtrl = [[UISegmentedControl alloc] initWithItems:@[@"足球",@"篮球"]];
    [titleCtrl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [titleCtrl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [titleCtrl setTintColor:[UIColor colorWithRed:0 green:142 / 255.0 blue:143 / 255.0 alpha:1]];
    
    [titleCtrl setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateSelected];
    titleCtrl.selectedSegmentIndex = 0;
    self.navigationItem.titleView = titleCtrl;
}
@end
