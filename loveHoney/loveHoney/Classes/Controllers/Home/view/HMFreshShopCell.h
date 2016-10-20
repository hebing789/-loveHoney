//
//  HMFreshShopCell.h
//  loveHoney
//
//  Created by hebing on 16/10/19.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMFreshShopModel;
@interface HMFreshShopCell : UICollectionViewCell
@property(nonatomic,strong)HMFreshShopModel* model;
@property(nonatomic,copy) void(^callback)(UIImageView *);
@end
