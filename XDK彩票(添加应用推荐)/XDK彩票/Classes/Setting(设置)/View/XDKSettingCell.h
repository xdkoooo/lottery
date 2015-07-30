//
//  XDKSettingCell.h
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/22.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XDKSettingItem;
@interface XDKSettingCell : UITableViewCell
/** item */
@property (nonatomic,strong) XDKSettingItem  *item;
+(XDKSettingCell *)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style;
@end
