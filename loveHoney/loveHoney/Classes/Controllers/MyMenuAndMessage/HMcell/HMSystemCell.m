//
//  HMSystemCell.m
//  loveHoney
//
//  Created by 李亚 on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMSystemCell.h"

@interface HMSystemCell ()


@end

@implementation HMSystemCell

-(UILabel *)leftLable
{
    if (!_leftLable) {
        _leftLable = [[UILabel alloc]init];
    }
    return _leftLable;
}

-(UIButton *)rightBtn
{
    if (!_rightBtn) {
        _rightBtn = [[UIButton alloc]init];
    }
    return _rightBtn;
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
    [self.contentView addSubview:self.leftLable];
    
    [self.contentView addSubview:self.rightBtn];
    
    
    [_leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        
        make.left.equalTo(self).offset(10);
        
        make.height.mas_equalTo(30);

    }];
    
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        
        make.right.equalTo(self).offset(-10);
        
        make.height.mas_equalTo(30);
        
        make.height.mas_equalTo(30);
        
    }];

}


- (void)setModel:(HMModel *)model
{
    _model = model;
    
    self.leftLable.text = model.title;
    
    [self.rightBtn setTitle:@"显示全部" forState:UIControlStateNormal];
    
    [self.rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    
    
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
