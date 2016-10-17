//
//  HMSystemCell.m
//  loveHoney
//
//  Created by 李亚 on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMSystemCell2.h"

@interface HMSystemCell2 ()



@end

@implementation HMSystemCell2

-(UILabel *)lable
{
    if (!_lable) {
        _lable = [[UILabel alloc]init];
    }
    return _lable;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI
{

    [self.contentView addSubview:self.lable];
    
    [_lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.bottom.equalTo(self).offset(-10);
    }];
}


- (void)setModel:(HMModel *)model
{
    _model = model;
   
    self.lable.text = model.content;
    
    self.lable.textColor = [UIColor grayColor];
    
    self.lable.font = [UIFont systemFontOfSize:13];
    
    self.lable.numberOfLines = 0;
    
    
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
