//
//  HMDingModel.h
//  loveHoney
//
//  Created by 李亚 on 16/10/20.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMDingModel : NSObject

@property (nonatomic,copy)NSString *lastUpdateTime;

@property (nonatomic,copy)NSString *order_amount;

@property (nonatomic,copy)NSString *buy_num;

@property (nonatomic,strong)NSArray *order_goods;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

+ (void)modelWithSuccess:(void(^)(NSArray *))successBlock error:(void(^)())errorBlock;

@end
