//
//  XDKRootTool.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/22.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKRootTool.h"
#import "XDKTabBarController.h"
#import "XDKSaveTool.h"
#import "XDKNewFeatureController.h"

#define XDKVersionKey @"version"

@implementation XDKRootTool

+ (UIViewController *)chooseRootController
{
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    NSString *lastVersion = [XDKSaveTool objectForKey:XDKVersionKey];
    
    UIViewController *rootVc;
    if ([currentVersion isEqualToString:lastVersion]) { // 没有新特性
        rootVc = [[XDKTabBarController alloc] init];
    }else{ // 新特性
        rootVc = [[XDKNewFeatureController alloc] init];
        [XDKSaveTool setObject:currentVersion forKey:XDKVersionKey];
    }
    return rootVc;
}
@end
