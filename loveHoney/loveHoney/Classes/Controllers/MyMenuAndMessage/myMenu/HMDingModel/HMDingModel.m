//
//  HMDingModel.m
//  loveHoney
//
//  Created by 李亚 on 16/10/20.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMDingModel.h"
#import "DSHTTPClient.h"
@implementation HMDingModel

+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    HMDingModel *model = [[HMDingModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

+ (void)modelWithSuccess:(void(^)(NSArray *))successBlock error:(void(^)())errorBlock
{
    NSDictionary *parmas = @{@"call":@13};
    
    [DSHTTPClient postUrlString:@"MyOrders.json.php" withParam:parmas withSuccessBlock:^(NSDictionary *responseObject) {
        
        NSLog(@"!!!!!!!!!!!!!!!!!!!!!!!!");
        NSLog(@"%@",responseObject);
        NSLog(@"!!!!!!!!!!!!!!!!!!!!!!!!");
        
        NSMutableArray *nmArray = [[NSMutableArray alloc]init];
        
        NSArray<NSDictionary *> *array = responseObject[@"data"];
        
        [array enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            HMDingModel *model = [HMDingModel modelWithDict:obj];
            
            [nmArray addObject:model];
            
        }];
        
        if (successBlock) {
            successBlock(nmArray.copy);
        }
        
        
    } withFailedBlock:^(NSError *error) {
        
        NSLog(@"%@",error);
        
    } withErrorBlock:^(NSString *message) {
        
        NSLog(@"%@",message);
    }];
}
@end
