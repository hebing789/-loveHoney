//
//  HMFocusModel.h
//  loveHoney
//
//  Created by 黄凯 on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMFocusModel : NSObject

@property(nonatomic,copy)NSString* img;

@property(nonatomic,copy)NSString* toURL;

@property(nonatomic,copy)NSString* name;
//
//@property(nonatomic,copy)NSString* img_name;

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
+(void)focusModelWithSuccess:(void(^)(NSArray<HMFocusModel *> *))successBlock error:(void(^)())errorBlock;
 
@end
