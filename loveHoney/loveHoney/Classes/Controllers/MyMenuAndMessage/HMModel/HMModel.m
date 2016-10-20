//
//  HMModel.m
//  loveHoney
//
//  Created by 李亚 on 16/10/17.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMModel.h"
#import "DSHTTPClient.h"
@implementation HMModel

+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    HMModel *model = [[HMModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

+ (void)modelWithSuccess:(void(^)(NSArray *))successBlock error:(void(^)())errorBlock
{
    NSDictionary *parmas = @{@"call":@10};
    
    [DSHTTPClient postUrlString:@"SystemMessage.json.php" withParam:parmas withSuccessBlock:^(NSDictionary *responseObject) {
        
//        NSLog(@"%@",responseObject);
        
        NSMutableArray *nmArray = [[NSMutableArray alloc]init];
        
        NSArray<NSDictionary *> *array = responseObject[@"data"];
        
        [array enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            HMModel *model = [HMModel modelWithDict:obj];
            
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
