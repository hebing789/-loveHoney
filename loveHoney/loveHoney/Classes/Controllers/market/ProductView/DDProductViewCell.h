//
//  DDProductViewCell.h
//  loveHoney
//
//  Created by deepindo on 2016/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDProductsModel;


@interface DDProductViewCell : UITableViewCell

@property(nonatomic,strong)DDProductsModel *model;

@property(nonatomic,copy)void(^clickBlock)(UIImageView *, NSInteger);

@end
