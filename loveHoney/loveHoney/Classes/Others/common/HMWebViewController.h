//
//  HMWebViewController.h
//  loveHoney
//
//  Created by hebing on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDProductsModel;

@interface HMWebViewController : UIViewController

@property(nonatomic,copy) NSString* urlString;

@property(nonatomic,copy) NSString* imgUrlString;

@property(nonatomic,strong)DDProductsModel *model;

@end
