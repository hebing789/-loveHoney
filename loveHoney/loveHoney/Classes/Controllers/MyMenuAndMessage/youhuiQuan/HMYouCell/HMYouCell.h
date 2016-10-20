//
//  HMYouCell.h
//  loveHoney
//
//  Created by 李亚 on 16/10/19.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMYouModel.h"
@interface HMYouCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iocnImage;
@property (weak, nonatomic) IBOutlet UILabel *moneyLable;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet UILabel *bottomLable;

@property (nonatomic,strong)HMYouModel *model;

@end
