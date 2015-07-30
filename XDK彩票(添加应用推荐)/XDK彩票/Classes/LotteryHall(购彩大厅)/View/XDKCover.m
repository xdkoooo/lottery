//
//  XDKCover.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/19.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKCover.h"

@implementation XDKCover

+(void)show
{
    XDKCover *cover = [[self alloc] init];
    cover.frame = XDKKeyWindow.bounds;
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.5;
    [XDKKeyWindow addSubview:cover];
}

+(void)hide
{
    for (UIView *view in XDKKeyWindow.subviews) {
        if ([view isKindOfClass:[XDKCover class]]) {
            [view removeFromSuperview];
        }
    }
}

@end
