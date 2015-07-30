//
//  XDKProduct.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/30.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKProduct.h"

@implementation XDKProduct



+(XDKProduct *)productWithDict:(NSDictionary *)dict
{
    XDKProduct *product = [[XDKProduct alloc] init];
    product.title = dict[@"title"];
    product.stitle = dict[@"stitle"];
    product.ID = dict[@"id"];
    product.url = dict[@"url"];
    product.icon = dict[@"icon"];
    product.customUrl = dict[@"customurl"];
    return product;
}

// 判断手机里有没有这个软件
-(void)setCustomUrl:(NSString *)customUrl
{
    _customUrl = [customUrl copy];
    if ([[UIApplication sharedApplication] canOpenURL:[self generatingUrlWithString:customUrl]])
    {
        _everDown = YES;
    }
}

-(NSURL *)generatingUrlWithString:(NSString *)urlStr
{
    NSString *str = [NSString stringWithFormat:@"%@://",urlStr];
    return [NSURL URLWithString:str];
}

@end
