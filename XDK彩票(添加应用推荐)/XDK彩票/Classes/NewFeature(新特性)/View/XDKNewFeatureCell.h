//
//  XDKNewFeatureCell.h
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/20.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XDKNewFeatureCell : UICollectionViewCell
/** image */
@property (nonatomic,strong) UIImage *image;


-(void)cellHideStartBtn:(NSIndexPath *)indexPath totalCount:(int)count;
@end
