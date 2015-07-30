//
//  XDKScoreViewController.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/22.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKScoreViewController.h"

@interface XDKScoreViewController ()

@end

@implementation XDKScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpGroup0];
    
    [self setUpGroup1];
    
    [self setUpGroup2];
    
    [self setUpGroup2];
    
    [self setUpGroup2];
    
    [self setUpGroup2];
    
    [self setUpGroup2];
    
    [self setUpGroup2];
}

-(void)setUpGroup0
{
    XDKSettingItem *item = [XDKSettingSwitchItem settingItemWithImage:nil title:@"推送我关注的比赛"];

    NSArray *items = @[item];
    XDKGroupItem *group = [XDKGroupItem groupItemWithItems:items];
    group.footerTitle = @"开启后。。。。。。";
    [self.groups addObject:group];
}

-(void)setUpGroup1
{
    XDKSettingItem *item = [XDKSettingItem settingItemWithImage:nil title:@"起始时间"];
    item.subTitle = @"00:00";
    NSArray *items = @[item];
    XDKGroupItem *group = [XDKGroupItem groupItemWithItems:items];
    group.headerTitle = @"只在一下时间段接收比分直播推送";
    [self.groups addObject:group];
}

-(void)setUpGroup2
{
    XDKSettingItem *item = [XDKSettingItem settingItemWithImage:nil title:@"结束时间"];
    item.subTitle = @"23:59";
    item.operation = ^(NSIndexPath *indexPath){
        UITextField *textField = [[UITextField alloc] init];
        [textField becomeFirstResponder];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        [cell addSubview:textField];
    };
    
    NSArray *items = @[item];
    XDKGroupItem *group = [XDKGroupItem groupItemWithItems:items];
    [self.groups addObject:group];
}




@end
