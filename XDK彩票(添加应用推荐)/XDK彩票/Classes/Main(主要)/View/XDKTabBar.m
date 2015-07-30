//
//  XDKTabBar.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/19.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKTabBar.h"
#import "XDKTabBarButton.h"

@interface XDKTabBar()

@property (nonatomic,weak)UIButton * selectedBtn;
@end

@implementation XDKTabBar
-(void)awakeFromNib
{
    
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

-(void)setItems:(NSMutableArray *)items
{
    _items = items;
//    int count = (int)items.count;
    
    for (UITabBarItem *item in items) {
        XDKTabBarButton *btn = [XDKTabBarButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        
        btn.tag = self.subviews.count;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:btn];
        
        if (self.subviews.count == 0) {
            [self btnClick:btn];
        }
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    int count = (int)self.subviews.count;
    CGFloat btnW = self.bounds.size.width / count;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnH = self.bounds.size.height;
    for (int i = 0; i < count; i++) {
        XDKTabBarButton *btn = self.subviews[i];
        btnX = i * btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
    
}

-(void)btnClick:(UIButton *)btn
{
    _selectedBtn.selected = NO;
    btn.selected = YES;
    _selectedBtn = btn;
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didClickBtn:)]) {
        [self.delegate tabBar:self didClickBtn:btn.tag];
    }
    
}


@end
