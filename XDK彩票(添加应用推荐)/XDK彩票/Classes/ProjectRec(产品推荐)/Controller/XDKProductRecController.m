//
//  XDKProductRecController.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/30.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKProductRecController.h"
#import "XDKProductCell.h"
#import "XDKProduct.h"

@interface XDKProductRecController ()<UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray  *products;
@end

@implementation XDKProductRecController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"应用推荐";
    
    self.tableView.rowHeight = 64;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
#warning -设置tableViewCell不允许选中
    self.tableView.allowsSelection = NO;
    [self loadStatus];
}

-(NSMutableArray *)products
{
    if (_products == nil) {
        _products = [NSMutableArray array];
    }
    return _products;
}

-(void)loadStatus
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"more_project.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    for (NSDictionary *dict in dictArray) {
        XDKProduct *product = [XDKProduct productWithDict:dict];
        [self.products addObject:product];
    }
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

//    NSLog(@"%s",__func__);
    return self.products.count;
}

- (XDKProductCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XDKProductCell *cell = [XDKProductCell cellWithTableView:tableView];
    cell.product = self.products[indexPath.row];
    // 设置选中背景为白色
    // 1.
//    UIView *bgView = [[UIView alloc] init];
//    bgView.backgroundColor = [UIColor whiteColor];
//    cell.selectedBackgroundView = bgView;
    // 2.
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__func__);
}

@end
