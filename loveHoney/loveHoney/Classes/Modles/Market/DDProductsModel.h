//
//  DDProductsModel.h
//  loveHoney
//
//  Created by deepindo on 2016/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDProductsModel : NSObject

@property(nonatomic,copy)NSString *brand_name;

@property(nonatomic,assign)NSInteger cart_group_id;

@property(nonatomic,assign)NSInteger brand_id;

@property(nonatomic,assign)NSInteger category_id;

@property(nonatomic,assign)NSInteger cid;

@property(nonatomic,assign)NSInteger dealer_id;

@property(nonatomic,assign)BOOL hot_degree;

@property(nonatomic,assign)NSInteger id;

@property(nonatomic,copy)NSString *img;

//超市价格
@property(nonatomic,copy)NSString *market_price;

//价格
@property(nonatomic,copy)NSString *price;

//合作价格
@property(nonatomic,copy)NSString *partner_price;

//重量
@property(nonatomic,copy)NSString *specifics;

@property(nonatomic,copy)NSString *name;

@property(nonatomic,assign)NSInteger sort;

@property(nonatomic,copy)NSString *pm_desc;

@property(nonatomic,copy)NSString *pre_img;

@property(nonatomic,copy)NSString *pre_imgs;


/**
 *  快速构造方法--对象方法
 *
 *  @param dict 传入的字典数据
 *
 *  @return 返回的当前对象
 */
-(instancetype)initWithDict:(NSDictionary *)dict;


/**
 *  快速创建对象的类方法
 *
 *  @param dict 传入的字典数据
 *
 *  @return 返回类
 */
+(instancetype)productsWithDict:(NSDictionary *)dict;


@end
