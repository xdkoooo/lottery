//
//  XDKAwardViewController.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/22.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKAwardViewController.h"

@interface XDKAwardViewController ()

@end

@implementation XDKAwardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpGroup0];
}

-(void)setUpGroup0
{
    XDKSettingItem *item1 = [XDKSettingSwitchItem settingItemWithImage:nil title:@"双色球"];
    item1.subTitle = @"二、四、日开奖";
    
    XDKSettingItem *item2 = [XDKSettingSwitchItem settingItemWithImage:nil title:@"大乐透"];
    item2.subTitle = @"一、三、五开奖";
    
    XDKSettingItem *item3 = [XDKSettingSwitchItem settingItemWithImage:nil title:@"3D"];
    item3.subTitle = @"二、四、日开奖";
    
    XDKSettingItem *item4 = [XDKSettingSwitchItem settingItemWithImage:nil title:@"七乐彩"];
    item4.subTitle = @"二、四、日开奖";
    
    XDKSettingItem *item5 = [XDKSettingSwitchItem settingItemWithImage:nil title:@"七星彩"];
    item5.subTitle = @"二、四、日开奖";
    
    XDKSettingItem *item6 = [XDKSettingSwitchItem settingItemWithImage:nil title:@"排列3"];
    item6.subTitle = @"每天开奖";
    
    XDKSettingItem *item7 = [XDKSettingSwitchItem settingItemWithImage:nil title:@"排列5"];
    item7.subTitle = @"每天开奖";
    
    NSArray *items = @[item1,item2,item3,item4,item5,item6,item7];
    XDKGroupItem *group = [XDKGroupItem groupItemWithItems:items];
    [self.groups addObject:group];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XDKSettingCell *cell = [XDKSettingCell cellWithTableView:tableView style:UITableViewCellStyleSubtitle];
    XDKGroupItem *group = self.groups[indexPath.section];
    XDKSettingItem *item = group.items[indexPath.row];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    cell.item = item;
    
    return cell;
}


@end
