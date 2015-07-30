//
//  XDKSettingCell.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/22.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKSettingCell.h"
#import "XDKSettingItem.h"
#import "XDKSettingSwitchItem.h"
#import "XDKSettingArrowItem.h"

@implementation XDKSettingCell


+(XDKSettingCell *)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style
{
    static NSString * ID = @"lottery";
    XDKSettingCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[XDKSettingCell alloc]initWithStyle:style reuseIdentifier:ID];
    }
    return cell;
}

-(void)setItem:(XDKSettingItem *)item
{
    _item = item;
    
    [self setUpData];
    
    [self setUpAccessoryView];
}

-(void)setUpData
{
    self.textLabel.text = _item.title;
    self.imageView.image = _item.image;
    self.detailTextLabel.text = _item.subTitle;
}

-(void)setUpAccessoryView
{
    if ([_item isKindOfClass:[XDKSettingArrowItem class]]) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
        self.accessoryView = imageView;
    }else if ([_item isKindOfClass:[XDKSettingSwitchItem class]]){
        UISwitch *rightSwitch = [[UISwitch alloc] init];
        self.accessoryView = rightSwitch;
    }else{
        self.accessoryView = nil;
    }
}



@end

