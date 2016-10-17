//
//  HMAddAddressController.h
//  loveHoney
//
//  Created by hebing on 16/10/17.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMAddresModel;
@interface HMAddAddressController : UITableViewController
@property(nonatomic,copy) void(^callbackClick)(HMAddresModel*);
@end
