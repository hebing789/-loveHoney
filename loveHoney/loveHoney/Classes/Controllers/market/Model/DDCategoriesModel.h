//
//  DDcategoriesModel.h
//  loveHoney
//
//  Created by deepindo on 2016/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DDProductsModel;

@interface DDCategoriesModel : NSObject

//id
@property(nonatomic,copy)NSString *ids;

//name
@property(nonatomic,copy)NSString *name;

//商品模型作为目录的属性
@property(nonatomic,strong)NSMutableArray<DDProductsModel *> *products;


-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)categoriesWithDict:(NSDictionary *)dict;

+(void)loadSuperMarketDataWithFinished:(void(^)(NSArray<DDCategoriesModel *> *, NSError *))finishBlock;



@end
