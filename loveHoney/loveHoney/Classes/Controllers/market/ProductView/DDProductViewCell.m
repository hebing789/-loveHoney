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
    
    NSLog(@"添加");
    self.minusBtn.hidden = NO;
    self.buyCountLabel.hidden = NO;
    self.currentCount ++;
    self.buyCountLabel.text = [NSString stringWithFormat:@"%ld",self.currentCount];
    
}

- (IBAction)minusBtnDidClick:(id)sender {
    NSLog(@"移除");
    self.currentCount --;
    self.buyCountLabel.text = [NSString stringWithFormat:@"%ld",self.currentCount];
    if (self.currentCount == 0) {
        self.minusBtn.hidden = YES;
        self.buyCountLabel.hidden = YES;
    }
}


@end
