//
//  HMDingCell.h
//  loveHoney
//
//  Created by 李亚 on 16/10/20.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMDingModel.h"
@interface HMDingCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *icon1;
@property (weak, nonatomic) IBOutlet UIImageView *icon2;
@property (weak, nonatomic) IBOutlet UIImageView *icon3;
@property (weak, nonatomic) IBOutlet UIImageView *icon4;
@property (weak, nonatomic) IBOutlet UILabel *shangPin;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;

@property (nonatomic,strong)HMDingModel *model;

@end
