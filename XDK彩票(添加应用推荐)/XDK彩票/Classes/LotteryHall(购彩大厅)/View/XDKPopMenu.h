//
//  XDKPopMenu.h
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/19.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XDKPopMenu;

@protocol XDKPopMenuDelegate <NSObject>

@optional

-(void)popMenuDidClickCloseBtn:(XDKPopMenu *)popMenu;

@end

@interface XDKPopMenu : UIView

+(instancetype)showInPoint:(CGPoint)center;

-(void)hideToPoint:(CGPoint)point completion:(void(^)())completion;

@property (nonatomic,weak)id<XDKPopMenuDelegate> delegate;

@end
