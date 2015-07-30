//
//  XDKPopMenu.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/19.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKPopMenu.h"

@interface XDKPopMenu()
@property (nonatomic,weak)XDKPopMenu * menu;
@end

@implementation XDKPopMenu

+(instancetype)showInPoint:(CGPoint)center
{
    XDKPopMenu *menu = [[[NSBundle mainBundle] loadNibNamed:@"XDKPopMenu" owner:nil options:nil] lastObject];
    menu.center = center;
    [XDKKeyWindow addSubview:menu];

    return menu;
}
- (IBAction)closeBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(popMenuDidClickCloseBtn:)]) {
        [self.delegate popMenuDidClickCloseBtn:self];
    }
}


-(void)hideToPoint:(CGPoint)point completion:(void(^)())completion
{
   [UIView animateWithDuration:1 animations:^{
       self.center = point;
       self.transform = CGAffineTransformMakeScale(0.01, 0.01);
   }completion:^(BOOL finished) {
       [self removeFromSuperview];
       if (completion) {
           completion();
       }
   }];
}
@end
