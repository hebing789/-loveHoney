//
//  HMPay1TableViewCell.m
//  loveHoney
//
//  Created by gaojie on 16/10/17.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMPay1TableViewCell.h"

@interface HMPay1TableViewCell()




@end

@implementation HMPay1TableViewCell

-(void)setTitle:(NSString *)title{
    self.payLable.text = title;
    _title =title;
    
}

-(void)setImg:(NSString *)img{
    
    _img =img;
    _iconImg.image = [UIImage imageNamed:img];
    
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
