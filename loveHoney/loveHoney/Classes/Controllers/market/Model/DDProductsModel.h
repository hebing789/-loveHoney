//
//  DDProductsModel.h
//  loveHoney
//
//  Created by deepindo on 2016/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDProductsModel : NSObject

//品牌名
@property(nonatomic,copy)NSString *brand_name;

//重量
@property(nonatomic,copy)NSString *specifics;

//图片地址
@property(nonatomic,copy)NSString *img;

//ids
@property(nonatomic,copy)NSString *ids;

//超市价格
@property(nonatomic,copy)NSString *market_price;

//价格
@property(nonatomic,copy)NSString *price;

//合作价格
@property(nonatomic,copy)NSString *partner_price;

//库存
@property(nonatomic,copy)NSString *store_nums;

//商品名
@property(nonatomic,copy)NSString *name;

//品牌id
@property(nonatomic,copy)NSString *brand_id;

-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)productsWithDict:(NSDictionary *)dict;

//-(void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end
