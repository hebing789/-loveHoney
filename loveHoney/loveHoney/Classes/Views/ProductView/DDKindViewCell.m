//
//  DDKindViewCell.m
//  loveHoney
//
//  Created by deepindo on 2016/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DDKindViewCell.h"
#import "DDCategoriesModel.h"

@interface DDKindViewCell ()

@property (weak, nonatomic) IBOutlet UIView *markView;

@property (weak, nonatomic) IBOutlet UILabel *kindLabel;

@end


@implementation DDKindViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    
}

-(void)setModel:(DDCategoriesModel *)model
{
    _model = model;
    
    self.kindLabel.text = model.name;
    self.selectedBackgroundView = self.markView;
    
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
    
}

@end
