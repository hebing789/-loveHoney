//
//  HMYouModel.h
//  loveHoney
//
//  Created by 李亚 on 16/10/17.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMYouModel : NSObject

@property (nonatomic,copy)NSString *name;

@property (nonatomic,copy)NSString *start_time;

@property (nonatomic,copy)NSString *end_time;

@property (nonatomic,copy)NSString *description;

@property (nonatomic,copy)NSString *value;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

+ (void)modelWithSuccess:(void(^)(NSArray *))successBlock error:(void(^)())errorBlock;
@end
