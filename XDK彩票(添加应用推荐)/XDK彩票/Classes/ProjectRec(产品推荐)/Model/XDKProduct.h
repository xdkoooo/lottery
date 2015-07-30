//
//  XDKProduct.h
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/30.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XDKProduct : NSObject
/** title */
@property (nonatomic,copy)NSString * title;
/** stitle */
@property (nonatomic,copy)NSString * stitle;
/** id */
@property (nonatomic,copy)NSString * ID;
/** url */
@property (nonatomic,copy)NSString * url;
/** icon */
@property (nonatomic,copy)NSString * icon;
/** customUrl */
@property (nonatomic,copy)NSString * customUrl;

/** everDown */
@property (nonatomic,assign,getter=isEverDown)BOOL everDown;

+(XDKProduct *)productWithDict:(NSDictionary *)dict;
@end
