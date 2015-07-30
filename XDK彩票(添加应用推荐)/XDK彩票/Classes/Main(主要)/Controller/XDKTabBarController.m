//
//  XDKTabBarController.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/19.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKTabBarController.h"
#import "XDKArenaViewController.h"
#import "XDKLotteryHallViewController.h"
#import "XDKDiscoveryViewController.h"
#import "XDKHistoryViewController.h"
#import "XDKMyLotteryViewController.h"
#import "XDKTabBar.h"
#import "XDKNavigationController.h"
#import "XDKArenaNavigationController.h"


@interface XDKTabBarController()<XDKTabBarDelegate>
/** strong */
@property (nonatomic,strong) NSMutableArray  *items;

@end

@implementation XDKTabBarController

-(NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

-(void)viewDidLoad
{
    // 添加子控件
    [self setUpChildViewControllers];
    // 自定义tabBar
    [self setUpTabBar];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if (![child isKindOfClass:[XDKTabBar class]]) {
            [child removeFromSuperview];
        }
    }
}


-(void)setUpChildViewControllers
{
    XDKLotteryHallViewController *hall = [[XDKLotteryHallViewController alloc] init];
//    hall.view.backgroundColor = [UIColor redColor];
    [self setUpOneViewController:hall image:[UIImage imageNamed:@"TabBar_LotteryHall_new"] selImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"] title:@"购彩大厅"];
    
    XDKArenaViewController *arena = [[XDKArenaViewController alloc] init];
//    arena.view.backgroundColor = [UIColor blueColor];
    [self setUpOneViewController:arena image:[UIImage imageNamed:@"TabBar_Arena_new"] selImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"] title:nil];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"XDKDiscoveryViewController" bundle:nil];
    XDKDiscoveryViewController *discovery = [storyboard instantiateInitialViewController];
//    discovery.view.backgroundColor = [UIColor grayColor];
    [self setUpOneViewController:discovery image:[UIImage imageNamed:@"TabBar_Discovery_new"] selImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"] title:@"发现"];
    
    XDKHistoryViewController *history = [[XDKHistoryViewController alloc] init];
//    history.view.backgroundColor = [UIColor purpleColor];
    [self setUpOneViewController:history image:[UIImage imageNamed:@"TabBar_History_new"] selImage:[UIImage imageNamed:@"TabBar_History_selected_new"] title:@"开奖信息"];
    
    XDKMyLotteryViewController *myLottery = [[XDKMyLotteryViewController alloc] init];
//    myLottery.view.backgroundColor = [UIColor greenColor];
    [self setUpOneViewController:myLottery image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"] title:@"我的彩票"];
}

-(void)setUpOneViewController:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title
{
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selImage;
    vc.navigationItem.title = title;
    [self.items addObject:vc.tabBarItem];

    UINavigationController *nav = [[XDKNavigationController alloc] initWithRootViewController:vc];
    
    if ([vc isKindOfClass:[XDKArenaViewController class]]) {
        nav = [[XDKArenaNavigationController alloc] initWithRootViewController:vc];
    }
    [self addChildViewController:nav];
}

-(void)setUpTabBar
{
    XDKTabBar *tabBar = [[XDKTabBar alloc] init];
    tabBar.frame = self.tabBar.bounds;
//    tabBar.items = _items;
    // 使用 keyPath 取出数组中的每一个元素的 tabBarItem 属性 ，形成一个新的集合
    tabBar.items = [self.childViewControllers valueForKeyPath:@"tabBarItem"];
    tabBar.delegate = self;
    [self.tabBar addSubview:tabBar];
}

#pragma mark -<XDKTabBarDelegate>
-(void)tabBar:(XDKTabBar *)tabBar didClickBtn:(NSInteger)index
{
    self.selectedIndex = index;
}

@end
