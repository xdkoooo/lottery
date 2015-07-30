//
//  XDKDiscoveryViewController.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/19.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKDiscoveryViewController.h"

@implementation XDKDiscoveryViewController

-(void)viewDidLoad
{
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.transform = CGAffineTransformMakeTranslation(XDKKeyWindow.width, 0);
    [UIView animateWithDuration:0.5 animations:^{
        cell.transform = CGAffineTransformIdentity;
    }];
}


@end
