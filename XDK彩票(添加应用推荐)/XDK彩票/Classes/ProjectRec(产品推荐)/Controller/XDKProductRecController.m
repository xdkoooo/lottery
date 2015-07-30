//
//  XDKProductRecController.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/30.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKProductRecController.h"
#import "XDKProductCell.h"

@interface XDKProductRecController ()<UITableViewDataSource>

@end

@implementation XDKProductRecController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 72;
    
    [self loadStatus];
}

-(void)loadStatus
{
//    NSJSONSerialization
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSLog(@"%s",__func__);
    return 10;
}

- (XDKProductCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XDKProductCell *cell = [XDKProductCell cellWithTableView:tableView];
    
    return cell;
}

@end
