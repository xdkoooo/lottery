//
//  XDKMyLotteryViewController.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/19.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKMyLotteryViewController.h"
#import "XDKSettingViewController.h"

@interface XDKMyLotteryViewController()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation XDKMyLotteryViewController

-(void)viewDidLoad
{
    [_loginBtn setBackgroundImage:[UIImage imageStrechedWithNamed:@"RedButton"] forState:UIControlStateNormal];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setTitle:@"客服" forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    [leftBtn sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageRmoveRenderWithNamed:@"Mylottery_config"] style:UIBarButtonItemStylePlain target:self action:@selector(config)];
}

-(void)config
{
    XDKSettingViewController *setting = [[XDKSettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
}
@end
