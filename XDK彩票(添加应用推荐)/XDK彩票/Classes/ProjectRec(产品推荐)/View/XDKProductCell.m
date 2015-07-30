//
//  XDKProductCell.m
//  XDK彩票
//
//  Created by 徐宽阔 on 15/7/30.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XDKProductCell.h"
#import "XDKProduct.h"

@interface XDKProductCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *title_label;
@property (weak, nonatomic) IBOutlet UILabel *stitle_lable;
@property (weak, nonatomic) IBOutlet UIButton *downLoadBtn;

@end

@implementation XDKProductCell

- (void)awakeFromNib {
}

- (IBAction)downLoadBtnClick:(id)sender {
}

-(void)setProduct:(XDKProduct *)product
{
    _product = product;
    
    self.iconImage.image = [UIImage imageNamed:product.icon];
    self.title_label.text = product.title;
    self.stitle_lable.text = product.stitle;
}


+(instancetype)cellWithTableView:(UITableView *)tableView
{
    XDKProductCell *cell  = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XDKProductCell class]) owner:nil options:nil] lastObject];
    return cell;
}


@end
