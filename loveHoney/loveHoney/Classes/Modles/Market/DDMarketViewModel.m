//
//  DDMarketViewModel.m
//  loveHoney
//
//  Created by deepindo on 2016/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DDMarketViewModel.h"
#import "DDCategoriesModel.h"
#import "DDProductsModel.h"



@implementation DDMarketViewModel

+(void)loadSuperMarketDataWithFinished:(void(^)(NSDictionary *, NSError *))finishBlock {

    //定义参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setValue:@"5" forKey:@"call"];
    
    
    //请求数据
    [DSHTTPClient postUrlString:@"supermarket.json.php" withParam:parameter withSuccessBlock:^(id responseObject) {
        //1.取出底层字典数据
        NSDictionary *dataDict = responseObject[@"data"];
        
        //2.取到分组数据
        NSDictionary *categoriesList = dataDict[@"categories"];
        NSMutableArray *categoriesArray = [NSMutableArray array];
        for (NSDictionary *dict in categoriesList) {
            [categoriesArray addObject:[DDCategoriesModel categoriesWithDict:dict]];
        }
        NSLog(@"%@",categoriesArray);
        
        //3.取到商品数据
        NSDictionary *productsDict = dataDict[@"products"];
        NSDictionary *idDict = productsDict[@"id"];
        NSMutableArray *nmArray1 = [NSMutableArray array];
        
        for (NSDictionary *dict in idDict) {
            [nmArray1 addObject:[DDProductsModel productsWithDict:dict]];
        }
        
        finishBlock(dataDict, nil);
        
    } withFailedBlock:^(NSError *error) {
        NSLog(@"%@",error);
        
        
        finishBlock(nil, error);
        
    } withErrorBlock:^(NSString *message) {
        NSLog(@"%@",message);
    }];
    
}

@end
