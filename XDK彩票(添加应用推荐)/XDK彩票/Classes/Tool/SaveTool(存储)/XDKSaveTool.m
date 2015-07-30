//
//  XDKSaveTool.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/22.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKSaveTool.h"


@implementation XDKSaveTool
+ (id)objectForKey:(NSString *)defaultName
{
    return [[NSUserDefaults  standardUserDefaults] objectForKey:defaultName];
}

+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
}
@end
