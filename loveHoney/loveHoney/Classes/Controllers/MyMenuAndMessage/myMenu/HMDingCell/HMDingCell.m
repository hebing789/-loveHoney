//
//  HMDingCell.m
//  loveHoney
//
//  Created by 李亚 on 16/10/20.
//  Copyright © 2016年 hebing. All rights reserved.
//
//@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
//@property (weak, nonatomic) IBOutlet UIImageView *icon1;
//@property (weak, nonatomic) IBOutlet UIImageView *icon2;
//@property (weak, nonatomic) IBOutlet UIImageView *icon3;
//@property (weak, nonatomic) IBOutlet UIImageView *icon4;
//@property (weak, nonatomic) IBOutlet UILabel *shangPin;
//@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
#import "HMDingCell.h"

@implementation HMDingCell

-(void)setModel:(HMDingModel *)model
{
    _model =model;
    
    self.timeLabel.text = model.lastUpdateTime;
    
    self.shangPin.text = [NSString stringWithFormat:@"共%@件商品",model.buy_num];
    
    self.moneyLabel.text = [NSString stringWithFormat:@"$%@",model.order_amount];
    
//    [model.photo enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSString *imgSrc = obj[@"name"];
//        NSURL *url = [NSURL URLWithString:imgSrc];
//        [self.icon1 sd_setImageWithURL:url];
//    }];
    
    NSURL *url = [NSURL URLWithString:@"http://img01.bqstatic.com/upload/goods/1000011290/1000011290_27698.jpg"];
    [self.icon1 sd_setImageWithURL:url];
    [self.icon2 sd_setImageWithURL:url];
    [self.icon3 sd_setImageWithURL:url];
    [self.icon4 sd_setImageWithURL:url];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
