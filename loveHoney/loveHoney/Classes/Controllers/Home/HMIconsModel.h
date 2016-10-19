//
//  HMIconsModel.h
//  loveHoney
//
//  Created by 黄凯 on 16/10/17.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMIconsModel : NSObject

@property(nonatomic,copy) NSString*customURL;
@property(nonatomic,copy)NSString *img;

@property(nonatomic,copy)NSString *name;


- (instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype) modelWithDict:(NSDictionary *)dict;
+(void)iconsModelWithSuccess:(void(^)(NSArray<HMIconsModel *> *))successBlock error:(void(^)())errorBlock;

@end
