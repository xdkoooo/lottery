//
//  XDKSettingItem.h
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/22.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XDKSettingItem : NSObject
/** image */
@property (nonatomic,strong) UIImage  *image;
/** title */
@property (nonatomic,copy)NSString * title;
/** subTitle */
@property (nonatomic,copy)NSString * subTitle;

/** block */
@property (nonatomic,strong) void(^operation)(NSIndexPath *indexPath);

+(instancetype)settingItemWithImage:(UIImage *)image title:(NSString *)title;
@end
