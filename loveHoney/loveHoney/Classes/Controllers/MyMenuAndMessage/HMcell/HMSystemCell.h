//
//  HMSystemCell.h
//  loveHoney
//
//  Created by 李亚 on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMModel.h"
@interface HMSystemCell : UITableViewCell

@property (nonatomic,strong)HMModel *model;

@property (nonatomic,strong)UILabel *leftLable;

@property (nonatomic,strong)UIButton *rightBtn;

@end
