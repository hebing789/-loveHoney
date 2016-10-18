//
//  HMFreshShopModel.m
//  loveHoney
//
//  Created by hebing on 16/10/19.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMFreshShopModel.h"

@implementation HMFreshShopModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    
    //完成初始化
    self = [super init];
    
    //判断对象是否存在
    if (self) {
        
        //使用KVC的方式设置数据
        [self setValuesForKeysWithDictionary:dict];
    }
    
    //返回当前对象
    return self;
    
}

/**
 *  对象初始化方法,类方法
 *
 *  @param dict 传入字典数据
 *
 *  @return 返回当前类的对象
 */
+ (instancetype)modelWithDict:(NSDictionary *)dict{
    
    //调用上方的方法完成初始化
    return [[self alloc]initWithDict:dict];
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}


+(void)modelWithSucess:(void (^)(NSMutableArray *))sucessBlock andError:(void (^)())errorBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    [param setValue:@"2" forKey:@"call"];
    
    // http://iosapi.itcast.cn/loveBeen/focus.json.php
    
    [DSHTTPClient postUrlString:@"firstSell.json.php" withParam:param withSuccessBlock:^(id data) {
//        NSLog(@"%@",data);
        
        NSMutableArray* ary = data[@"data"];
        NSMutableArray* finial = [NSMutableArray new];
        [ary enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            HMFreshShopModel* model = [HMFreshShopModel modelWithDict:obj];
            
            [finial addObject:model];
            if (sucessBlock) {
                sucessBlock(finial);
            }
            
            
            
        }];
    } withFailedBlock:^(NSError *error) {
        NSLog(@"%@",error);
    } withErrorBlock:^(NSString *message) {
        NSLog(@"%@",message);
    }];
    
    
    //地址数据
    
 
        
    
        
    
        
        
    
    
    
    
    
}
@end
