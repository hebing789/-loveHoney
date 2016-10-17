//
//  HMModel.h
//  loveHoney
//
//  Created by 李亚 on 16/10/17.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMModel : NSObject

@property (nonatomic,copy)NSString *title;

@property (nonatomic,copy)NSString *content;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

+ (void)modelWithSuccess:(void(^)(NSArray *))successBlock error:(void(^)())errorBlock;

@end
