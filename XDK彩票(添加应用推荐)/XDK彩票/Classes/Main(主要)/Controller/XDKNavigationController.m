//
//  XDKNavigationController.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/19.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKNavigationController.h"
#import <objc/runtime.h>

@interface XDKNavigationController() <UINavigationControllerDelegate,UIGestureRecognizerDelegate>
/** popDelegate */
@property (nonatomic,strong) id popDelegate ;
@end

@implementation XDKNavigationController

// 类的初始化，调用一次
+ (void)initialize
{
    if (self == [XDKNavigationController class]) {
        UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil ];
        
        [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        dic[NSForegroundColorAttributeName] = [UIColor whiteColor];
        dic[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];
        [bar setTitleTextAttributes:dic];
        
        // 不改变返回按钮，修改文字位置
        [bar setTintColor:[UIColor whiteColor]];
        
        UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
        // setBackButton
        [item setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -64) forBarMetrics:UIBarMetricsDefault];
    }


}

-(void)viewDidLoad
{
    
//    NSLog(@"%@",self.interactivePopGestureRecognizer);
    /**
     *  <UIScreenEdgePanGestureRecognizer: 0x7f918d22c100; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7f918d221a90>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7f918d223440>)>>
     */
   
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([UIGestureRecognizer class], &count);
    for (int i =0;i < count;i++ ) {
        Ivar ivar = ivars[i];
        NSString *name = @(ivar_getName(ivar));
//        NSLog(@"%@",name);
    }
    
    UIScreenEdgePanGestureRecognizer *gesture = self.interactivePopGestureRecognizer;
    
    NSArray *gestures = [gesture valueForKey:@"_targets"];
    
//    NSLog(@"gestures-----%@",gestures);
    id gestureRecognizer = gestures[0];
//    NSLog(@"gestures-----%@",gestureRecognizer);
    id target = [gestureRecognizer valueForKey:@"_target"];
    
    // 禁用系统自带效果
    self.interactivePopGestureRecognizer.enabled = NO;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
    
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return (self.childViewControllers.count != 1);
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count != 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        [viewController.view layoutIfNeeded];
    }
    [super pushViewController:viewController animated:YES];
    
}



@end
