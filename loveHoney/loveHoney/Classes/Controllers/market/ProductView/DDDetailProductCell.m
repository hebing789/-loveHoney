//
//  DDDetailProductView.m
//  loveHoney
//
//  Created by deepindo on 2016/10/20.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DDDetailProductCell.h"
#import "DDProductsModel.h"

@interface DDDetailProductCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *marketPrice;
@property (weak, nonatomic) IBOutlet UILabel *brandName;
@property (weak, nonatomic) IBOutlet UILabel *specificsLabel;

@end

@implementation DDDetailProductCell

//+(instancetype)detailProductView{
//
//    return [[NSBundle mainBundle]loadNibNamed:@"DDDetailProductView" owner:nil options:nil].lastObject;
//        
//
//}




-(void)setModel:(DDProductsModel *)model{

    _model = model;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    self.name.text = model.name;
    self.price.text = [NSString stringWithFormat:@"$%@",model.price];
    
    //文字加横线效果
    self.marketPrice.textAlignment = NSTextAlignmentCenter;
    self.marketPrice.textColor = [UIColor grayColor]; // 横线的颜色跟随label字体颜色改变
    NSMutableAttributedString *newMarketPrice = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"$%@",model.market_price]];
    [newMarketPrice addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, newMarketPrice.length)];
    self.marketPrice.attributedText = newMarketPrice;
    
    self.brandName.text = model.brand_name;
    self.specificsLabel.text = model.specifics;
}


@end
