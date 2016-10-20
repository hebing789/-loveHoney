//
//  HMYouModel.m
//  loveHoney
//
//  Created by 李亚 on 16/10/17.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMYouModel.h"

@interface HMYouModel ()

@end

@implementation HMYouModel
+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    HMYouModel *model = [[HMYouModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

+ (void)modelWithSuccess:(void(^)(NSArray *))successBlock error:(void(^)())errorBlock
{
    NSDictionary *parmas = @{@"call":@9};
    
    [DSHTTPClient postUrlString:@"MyCoupon.json.php" withParam:parmas withSuccessBlock:^(NSDictionary *responseObject) {
//        NSLog(@"<<<<<<<<<<<<<<<<<<<");
//                NSLog(@"%@",responseObject);
        
        
        NSMutableArray *nmArray = [[NSMutableArray alloc]init];
        
        NSArray<NSDictionary *> *array = responseObject[@"data"];
        
        [array enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            HMYouModel *model = [HMYouModel modelWithDict:obj];
            
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
