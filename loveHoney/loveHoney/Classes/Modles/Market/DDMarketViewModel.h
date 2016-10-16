//
//  DDMarketViewModel.h
//  loveHoney
//
//  Created by deepindo on 2016/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DDCategoriesModel;
@class DDProductsModel;

@interface DDMarketViewModel : NSObject

//分类
@property(nonatomic,strong)NSArray<DDCategoriesModel *> *categories;

//商品
@property(nonatomic,strong)NSArray<DDProductsModel *> *products;

+(void)loadSuperMarketDataWithFinished:(void(^)(NSDictionary *, NSError *))finishBlock;

@end


