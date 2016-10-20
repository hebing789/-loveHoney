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

@property (weak, nonatomic) IBOutlet UIButton *minusBtn;

@property(nonatomic,assign)NSInteger currentCount;

@end

@implementation DDProductViewCell


-(void)setModel:(DDProductsModel *)model
{
    _model = model;
    
    self.priceLabel.text = [NSString stringWithFormat:@"$%@",model.price];
    self.marketPriceLabel.text = [NSString stringWithFormat:@"$%@",model.market_price];
    self.specificsLabel.text = model.specifics;
    self.nameLabel.text = model.name;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.img]];

}

- (IBAction)plusBtnDidClick:(id)sender {
    self.minusBtn.hidden = NO;
    self.buyCountLabel.hidden = NO;
    self.currentCount ++;
    self.buyCountLabel.text = [NSString stringWithFormat:@"%ld",self.currentCount];
    
    if (self.clickBlock) {
        self.clickBlock(self.iconView, 1);
    }
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:kPlusProduct object:nil userInfo:nil];
}

- (IBAction)minusBtnDidClick:(id)sender {
    self.currentCount --;
    self.buyCountLabel.text = [NSString stringWithFormat:@"%ld",self.currentCount];
    self.minusBtn.hidden = self.currentCount == 0 ? YES : NO;
    self.buyCountLabel.hidden = self.currentCount == 0 ? YES : NO;
    
    if (self.clickBlock) {
        self.clickBlock(nil, -1);
    }
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:kMinusProduct object:nil userInfo:nil];
}

@end
