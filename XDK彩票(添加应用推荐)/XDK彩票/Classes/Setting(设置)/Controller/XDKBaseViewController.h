//
//  XDKBaseViewController.h
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/22.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD+XMG.h"

#import "XDKSettingItem.h"
#import "XDKGroupItem.h"
#import "XDKSettingArrowItem.h"
#import "XDKSettingCell.h"
#import "XDKSettingSwitchItem.h"


@interface XDKBaseViewController : UITableViewController
/** 总组数 */
@property (nonatomic,strong) NSMutableArray  *groups;
@end
