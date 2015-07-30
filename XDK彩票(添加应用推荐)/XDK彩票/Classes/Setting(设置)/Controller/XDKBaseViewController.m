//
//  XDKBaseViewController.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/22.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKBaseViewController.h"

@interface XDKBaseViewController ()

@end

@implementation XDKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(NSMutableArray *)groups
{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

-(instancetype)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    XDKGroupItem *group = self.groups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XDKSettingCell *cell = [XDKSettingCell cellWithTableView:tableView style:UITableViewCellStyleValue1];
    
    
    XDKGroupItem *group = self.groups[indexPath.section];
    XDKSettingItem *item = group.items[indexPath.row];
    
    cell.item = item;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中
    //    [self tableView:tableView didDeselectRowAtIndexPath:indexPath];
    
    XDKGroupItem *group = self.groups[indexPath.section];
    XDKSettingArrowItem *item = group.items[indexPath.row];
    
    if (item.operation) {
        item.operation(indexPath);
        return;
    }
    
    if ([item isKindOfClass:[XDKSettingArrowItem class]]) {
        if (item.destVc) {
            UIViewController *vc = [[item.destVc alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.tableView endEditing:YES];
}

-(void)dealloc
{
    NSLog(@"%s",__func__);
}

@end