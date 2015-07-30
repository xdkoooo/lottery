//
//  XDKSettingItem.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/22.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKSettingItem.h"

@implementation XDKSettingItem

+(instancetype)settingItemWithImage:(UIImage *)image title:(NSString *)title
{
    XDKSettingItem *item = [[self alloc] init];
    item.image = image;
    item.title = title;
    return item;
}
@end
