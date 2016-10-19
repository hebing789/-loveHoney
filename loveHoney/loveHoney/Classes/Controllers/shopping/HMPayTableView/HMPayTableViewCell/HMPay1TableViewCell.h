//
//  HMPay1TableViewCell.h
//  loveHoney
//
//  Created by gaojie on 16/10/17.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMPay1TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *payLable;

@property(nonatomic,copy) NSString* title;

@property(nonatomic,copy) NSString*img;

@end
