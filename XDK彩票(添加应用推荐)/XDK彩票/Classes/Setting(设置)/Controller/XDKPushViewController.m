//
//  XDKPushViewController.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/22.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKPushViewController.h"
#import "XDKAwardViewController.h"
#import "XDKScoreViewController.h"

@interface XDKPushViewController ()

@end

@implementation XDKPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpGroup0];
}

-(void)setUpGroup0
{
    XDKSettingArrowItem *award = [XDKSettingArrowItem settingItemWithImage:nil title:@"开奖推送"];
    award.destVc = [XDKAwardViewController class];
    
    XDKSettingArrowItem *score = [XDKSettingArrowItem settingItemWithImage:nil title:@"比分直播推送"];
    score.destVc = [XDKScoreViewController  class];
    
    XDKSettingItem *animation = [XDKSettingArrowItem settingItemWithImage:nil title:@"中奖动画"];
    XDKSettingItem *note = [XDKSettingArrowItem settingItemWithImage:nil title:@"购彩提醒"];
    NSArray *items = @[award,score,animation,note];
    XDKGroupItem *group = [XDKGroupItem groupItemWithItems:items];
    [self.groups addObject:group];
}


@end
