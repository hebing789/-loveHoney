//
//  HMAddresModel.h
//  loveHoney
//
//  Created by hebing on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMAddresModel : NSObject<NSCoding>

///联系人
@property(nonatomic,copy) NSString*accept_name;

///所在地区
@property(nonatomic,copy) NSString*addr_for_dealer;

///所在城市
@property(nonatomic,copy) NSString*province_name;

///详细地址
@property(nonatomic,copy) NSString* address;

///所在城市
@property(nonatomic,copy) NSString*city_name;

///性别
@property(nonatomic,strong)NSNumber* gender;

///手机号
@property(nonatomic,strong) NSNumber*  telphone;


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
