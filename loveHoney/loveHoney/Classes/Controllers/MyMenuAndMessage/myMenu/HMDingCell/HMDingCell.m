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
