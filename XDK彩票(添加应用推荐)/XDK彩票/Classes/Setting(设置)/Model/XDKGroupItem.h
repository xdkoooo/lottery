//
//  XDKGroupItem.h
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/22.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XDKGroupItem : NSObject
/** items */
@property (nonatomic,strong) NSArray  *items;
/** headerTitle */
@property (nonatomic,copy)NSString * headerTitle;
/** footerTitle */
@property (nonatomic,copy)NSString * footerTitle;

+(instancetype)groupItemWithItems:(NSArray *)items;
@end
