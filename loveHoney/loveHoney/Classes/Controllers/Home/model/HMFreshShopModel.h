//
//  HMFreshShopModel.h
//  loveHoney
//
//  Created by hebing on 16/10/19.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMFreshShopModel : NSObject

@property(nonatomic,copy) NSString*name;

//买一送一
@property(nonatomic,copy) NSString*pm_desc;


//价格
@property(nonatomic,copy) NSString*specifics;


@property(nonatomic,copy) NSString*img;

@property(nonatomic,copy) NSString*market_price;

@property(nonatomic,strong)NSNumber*partner_price;

@property(nonatomic,strong)NSNumber*tag_ids;

@property(nonatomic,strong)NSNumber*sort;




/**
 *  对象初始化方法,对象方法
 *
 *  @param dict 传入字典数据
 *
 *  @return 返回当前类的对象
 */
- (instancetype)initWithDict:(NSDictionary *)dict;

/**
 *  对象初始化方法,类方法
 *
 *  @param dict 传入字典数据
 *
 *  @return 返回当前类
 */
+(instancetype) modelWithDict:(NSDictionary *)dict;


- (void)setValue:(id)value forUndefinedKey:(NSString *)key;

+(void)modelWithSucess:(void(^)(NSMutableArray* ary))sucessBlock andError:(void(^)())errorBlock;


@end
