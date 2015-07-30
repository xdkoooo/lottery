//
//  XDKSettingViewController.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/22.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//


#import "XDKSettingViewController.h"
#import "XDKPushViewController.h"
#import "XDKProductRecController.h"
@interface XDKSettingViewController ()

@end

@implementation XDKSettingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"常见问题";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"常见问题" style:UIBarButtonItemStyleDone target:self action:@selector(problem)];
    [self setUpGroup0];
    [self setUpGroup1];
    [self setUpGroup2];
    
}

-(void)problem
{
    NSLog(@"%s",__func__);
}

-(void)setUpGroup0
{
    XDKSettingItem *RedeemCode = [XDKSettingArrowItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    
    // 解决block内循环引用问题
//    __weak XDKSettingViewController * weakSelf = self;
    __weak typeof(self) weakSelf = self;
    RedeemCode.operation = ^(NSIndexPath *indexPath){
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor purpleColor];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    
    NSArray *items = @[RedeemCode];
    XDKGroupItem *group = [XDKGroupItem groupItemWithItems:items];
    [self.groups addObject:group];
}

-(void)setUpGroup1
{
    XDKSettingArrowItem *MorePush = [XDKSettingArrowItem settingItemWithImage:[UIImage imageNamed:@"MorePush"] title:@"推送和提醒"];
    MorePush.destVc = [XDKPushViewController class];
    
    XDKSettingItem *More_homeshake = [XDKSettingSwitchItem settingItemWithImage:[UIImage imageNamed:@"more_homeshake"] title:@"使用摇一摇机选"];
    XDKSettingItem *Sound_Effect = [XDKSettingSwitchItem settingItemWithImage:[UIImage imageNamed:@"sound_Effect"] title:@"声音效果"];
    XDKSettingItem *More_LotteryRecommend = [XDKSettingSwitchItem settingItemWithImage:[UIImage imageNamed:@"More_LotteryRecommend"] title:@"购彩小助手"];
    
    NSArray *items = @[MorePush,More_homeshake,Sound_Effect,More_LotteryRecommend];
    XDKGroupItem *group = [XDKGroupItem groupItemWithItems:items];
    [self.groups addObject:group];
}

-(void)setUpGroup2
{
    XDKSettingItem *RedeemCode = [XDKSettingArrowItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"检查新版本"];
    RedeemCode.operation = ^(NSIndexPath *indexPath){
        [MBProgressHUD showSuccess:@"没有最新版本"];
    };
    
    
    XDKSettingItem *MoreShare = [XDKSettingArrowItem settingItemWithImage:[UIImage imageNamed:@"MoreShare"] title:@"分享"];
    XDKSettingArrowItem *MoreNetease = [XDKSettingArrowItem settingItemWithImage:[UIImage imageNamed:@"MoreNetease"] title:@"产品推荐"];
    MoreNetease.destVc = [XDKProductRecController class];
    XDKSettingItem *MoreAbout = [XDKSettingArrowItem settingItemWithImage:[UIImage imageNamed:@"MoreAbout"] title:@"关于"];
    NSArray *items = @[RedeemCode,MoreShare,MoreNetease,MoreAbout];
    XDKGroupItem *group = [XDKGroupItem groupItemWithItems:items];
    [self.groups addObject:group];
}

@end
