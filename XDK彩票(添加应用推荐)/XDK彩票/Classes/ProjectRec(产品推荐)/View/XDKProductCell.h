//
//  XDKProductCell.h
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/30.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XDKProduct;
@interface XDKProductCell : UITableViewCell
/** xdkproduct */
@property (nonatomic,strong) XDKProduct  *product;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
