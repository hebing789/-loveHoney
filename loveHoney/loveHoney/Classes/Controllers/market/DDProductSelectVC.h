//
//  DDProductSelectView.h
//  loveHoney
//
//  Created by deepindo on 2016/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDProductSelectVC : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray<DDProductsModel *> *productsList;

@end
