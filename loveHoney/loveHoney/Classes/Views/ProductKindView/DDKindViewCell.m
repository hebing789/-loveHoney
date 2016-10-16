//
//  DDKindViewCell.m
//  loveHoney
//
//  Created by deepindo on 2016/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DDKindViewCell.h"

@interface DDKindViewCell ()

@property (weak, nonatomic) IBOutlet UIView *markView;

@property (weak, nonatomic) IBOutlet UILabel *kindLabel;

@end


@implementation DDKindViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
