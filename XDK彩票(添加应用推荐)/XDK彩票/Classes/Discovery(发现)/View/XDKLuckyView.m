//
//  XDKLuckyView.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/22.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKLuckyView.h"

@implementation XDKLuckyView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"luck_entry_background"];
    
    [image drawInRect:rect];
}




@end
