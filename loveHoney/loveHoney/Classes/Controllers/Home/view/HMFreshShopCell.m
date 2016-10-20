//
//  HMFreshShopCell.m
//  loveHoney
//
//  Created by hebing on 16/10/19.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMFreshShopCell.h"
#import "HMFreshShopModel.h"

#import "DDAnimationTools.h"
@interface HMFreshShopCell()

@property (weak, nonatomic) IBOutlet UIImageView *foodImgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;

@property (weak, nonatomic) IBOutlet UIImageView *btnJinxuan;
@property (weak, nonatomic) IBOutlet UIButton *btnMaiYI;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@property (weak, nonatomic) IBOutlet UIButton *reduceBtn;
@property (weak, nonatomic) IBOutlet UILabel *numLab;

@end

@implementation HMFreshShopCell
- (IBAction)addFoodToShopping:(id)sender {
    
    if(_callback){
        _callback(self.foodImgView);
    }
    
//    //两边的联动最后不发通知
////    [[NSNotificationCenter defaultCenter] postNotificationName:KAddShoppingNotName object:self.model userInfo:nil];

                   //获取当前cell 相对于self.view 当前的坐标
//                   rect.origin.y = rect.origin.y - [tableView contentOffset].y;
//                   rect.origin.x = rect.origin.x - SCREEN_WIDTH/4;
//                   CGRect imageViewRect = iconView.frame;
//                   imageViewRect.origin.y = rect.origin.y+imageViewRect.origin.y;
//                   imageViewRect.origin.x = -(rect.origin.x+imageViewRect.origin.x);
//                   
    self.numLab.hidden =NO;
    
    self.reduceBtn.hidden =NO;
    
    NSInteger num = [_numLab.text integerValue];
    num++;
    
    _numLab.text = [NSString stringWithFormat:@"%ld",(long)num];
    
//    [HBSQLiteTools sharedTools]
    
    
}

- (IBAction)reduceShopping:(id)sender {
    
    
    UIViewController *vc = [self viewController].tabBarController.viewControllers[2];
    NSInteger badgeValue = [vc.tabBarItem.badgeValue integerValue];
    badgeValue -= 1;
    NSString *str = [NSString stringWithFormat:@"%zd", badgeValue];
    if ([str isEqualToString:@"0"]) {
        str = nil;
    }
    vc.tabBarItem.badgeValue = str;
    
    NSInteger num = [_numLab.text integerValue];
    num--;
    
    _numLab.text = [NSString stringWithFormat:@"%ld",(long)num];
    
    
    UIView *view = [self viewController].tabBarController.tabBar.subviews[3];
     [DDAnimationTools shakeAnimation:view];
    
    if (num==0) {
        _numLab.hidden = YES;
        _reduceBtn.hidden =YES;
    }

    
    
    
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
- (UIViewController *)viewController
{
    //获取当前view的superView对应的控制器
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.numLab.hidden =YES;
    
    self.reduceBtn.hidden =YES;
  
    
    
}

@end
