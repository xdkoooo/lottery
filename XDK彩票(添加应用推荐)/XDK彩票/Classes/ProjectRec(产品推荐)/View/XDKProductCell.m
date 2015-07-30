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
{
    // 判断打开手机的软件还是在线下载
    BOOL _canOpen;
}
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *title_label;
@property (weak, nonatomic) IBOutlet UILabel *stitle_lable;
@property (weak, nonatomic) IBOutlet UIButton *downLoadBtn;

@end

@implementation XDKProductCell

- (void)awakeFromNib {
}

- (IBAction)downLoadBtnClick:(id)sender {
    if (_canOpen) {
        [[UIApplication sharedApplication] openURL:[self generatingUrlWithString:_product.customUrl]];
    }else{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_product.url]];
        NSLog(@"%@",_product.url);
    }
}

-(NSURL *)generatingUrlWithString:(NSString *)urlStr
{
    NSString *str = [NSString stringWithFormat:@"%@://",urlStr];
    return [NSURL URLWithString:str];
}

-(void)setProduct:(XDKProduct *)product
{
    _product = product;
    
    self.iconImage.image = [UIImage imageNamed:product.icon];
    self.title_label.text = product.title;
    self.stitle_lable.text = product.stitle;
    
    _canOpen = product.isEverDown;
    
    if (product.isEverDown) {
        [self.downLoadBtn setImage:[UIImage imageRmoveRenderWithNamed:@"appadcell_openbutton"] forState:UIControlStateNormal];
    }else{
        [self.downLoadBtn setImage:[UIImage imageRmoveRenderWithNamed:@"appadcell_downloadbutton"] forState:UIControlStateNormal];
    }
}


+(instancetype)cellWithTableView:(UITableView *)tableView
{
    XDKProductCell *cell  = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XDKProductCell class]) owner:nil options:nil] lastObject];
    return cell;
}


@end
