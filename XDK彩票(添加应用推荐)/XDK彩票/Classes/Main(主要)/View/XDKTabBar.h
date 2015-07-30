//
//  XDKTabBar.h
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/19.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XDKTabBar;
@protocol XDKTabBarDelegate <NSObject>

@optional

-(void)tabBar:(XDKTabBar *)tabBar didClickBtn:(NSInteger)index;

@end

@interface XDKTabBar : UIView
/** tabbarItems */
@property (nonatomic,strong) NSMutableArray  *items;
@property (nonatomic,weak)id<XDKTabBarDelegate> delegate;
@end
