//
//  HMFreshShopCell.m
//  loveHoney
//
//  Created by hebing on 16/10/19.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMFreshShopCell.h"
#import "HMFreshShopModel.h"
@interface HMFreshShopCell()

@property (weak, nonatomic) IBOutlet UIImageView *foodImgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;

@property (weak, nonatomic) IBOutlet UIImageView *btnJinxuan;
@property (weak, nonatomic) IBOutlet UIButton *btnMaiYI;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;

@end

@implementation HMFreshShopCell
- (IBAction)addFoodToShopping:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KAddShoppingNotName object:self.model userInfo:nil];
    
    
    
}

-(void)setModel:(HMFreshShopModel *)model{
    _model = model;
    
    [self.foodImgView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    
    self.nameLab.text =model.name;
    
    self.priceLable.text = model.specifics;
    
    //这个会存在重用问题,刷新后不和原理一样了
    if(model.pm_desc.length == 0){
        self.btnMaiYI.hidden = YES;
        
    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
  
    
    
}

@end
