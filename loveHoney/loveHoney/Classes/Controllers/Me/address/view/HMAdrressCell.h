//
//  HMAdrressCell.h
//  loveHoney
//
//  Created by hebing on 16/10/17.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMAddresModel.h"
@interface HMAdrressCell : UITableViewCell
@property(nonatomic,strong)HMAddresModel* model;
@property(nonatomic,copy) void(^callbackClick)(HMAddresModel*);
@end
