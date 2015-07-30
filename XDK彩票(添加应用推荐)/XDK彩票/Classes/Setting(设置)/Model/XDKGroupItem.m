//
//  XDKGroupItem.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/22.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKGroupItem.h"

@implementation XDKGroupItem

+(instancetype)groupItemWithItems:(NSArray *)items
{
    XDKGroupItem *item = [[self alloc] init];
    item.items = items;
    return item;
}
@end
