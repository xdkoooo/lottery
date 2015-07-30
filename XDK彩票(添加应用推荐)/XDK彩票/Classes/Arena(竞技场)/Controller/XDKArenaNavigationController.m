//
//  XDKArenaNavigationController.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/20.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKArenaNavigationController.h"

@interface XDKArenaNavigationController ()

@end

@implementation XDKArenaNavigationController

+(void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    [bar setBackgroundImage:[UIImage imageStrechedWithNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
