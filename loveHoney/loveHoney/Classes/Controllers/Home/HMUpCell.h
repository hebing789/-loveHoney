//
//  HMUpCell.h
//  loveHoney
//
//  Created by 黄凯 on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMActivitiesModel.h"
@interface HMUpCell : UITableViewCell
@property(nonatomic,weak)HMActivitiesModel *model;
@property(nonatomic,weak)UIImageView *imgView;

@end
