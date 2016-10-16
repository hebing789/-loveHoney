//
//  DDProductViewCell.m
//  loveHoney
//
//  Created by deepindo on 2016/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DDProductViewCell.h"
#import "DDProductsModel.h"

@interface DDProductViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *marketPriceLabel;

@property (weak, nonatomic) IBOutlet UILabel *specificsLabel;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;


@end

@implementation DDProductViewCell


-(void)setModel:(DDProductsModel *)model
{
    _model = model;
    
    self.priceLabel.text = model.price;
    self.marketPriceLabel.text = model.market_price;
    self.specificsLabel.text = model.specifics;
    self.nameLabel.text = model.name;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.img]];

}


@end
