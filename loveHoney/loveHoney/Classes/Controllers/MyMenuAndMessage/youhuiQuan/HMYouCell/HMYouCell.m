//
//  HMYouCell.m
//  loveHoney
//
//  Created by 李亚 on 16/10/19.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMYouCell.h"

@implementation HMYouCell


- (void)setModel:(HMYouModel *)model
{
    _model = model;
    
    
    self.moneyLable.text = [NSString stringWithFormat:@"$%@",model.value];
    
    self.timeLable.text = [NSString stringWithFormat:@"有效期%@至%@",model.start_time,model.end_time];
    
    
    self.bottomLable.text = model.description;
    
    
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
