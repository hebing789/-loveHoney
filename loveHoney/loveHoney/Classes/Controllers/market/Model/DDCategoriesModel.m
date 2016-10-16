//
//  DDcategoriesModel.m
//  loveHoney
//
//  Created by deepindo on 2016/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DDCategoriesModel.h"
#import "DDProductsModel.h"

@implementation DDCategoriesModel

-(NSMutableArray<DDProductsModel *> *)products
{
    if (!_products) {
        _products = [NSMutableArray array];
    }
    return _products;
}


-(instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self)
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)categoriesWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

//设置没有定义的Key,避免报错
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.ids = value;
    }
}

+(void)loadSuperMarketDataWithFinished:(void (^)(NSArray<DDCategoriesModel *> *, NSError *))finishBlock{
    
    //定义参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setValue:@"5" forKey:@"call"];
    
    [UIView animateWithDuration:0.5 animations:^{
        [SVProgressHUD show];
    }];
    
    //请求数据
    [DSHTTPClient postUrlString:@"supermarket.json.php" withParam:parameter withSuccessBlock:^(id responseObject) {
        //1.取出底层字典数据
        NSDictionary *dataDict = responseObject[@"data"];
        
        //2.取到分组数据
        NSDictionary *categoriesDict = dataDict[@"categories"];
        NSMutableArray *cArray = [NSMutableArray array];
        for (NSDictionary *dict in categoriesDict) {
            DDCategoriesModel *model = [DDCategoriesModel categoriesWithDict:dict];
            [cArray addObject:model];
        }
        
        //3.取到商品数据
        //商品字典
        NSDictionary *productsDict = dataDict[@"products"];
        //遍历上面得到的分组模型数组
        for (DDCategoriesModel *model in cArray) {
#warning 这里是核心,容易出现问题的地方
            //先拿分组模型中的key--ids
            NSString *idsKey = model.ids;
            //通过key得到value,即产品数组
            NSArray *pArray = productsDict[idsKey];
            //遍历idsArray
            for (NSDictionary *dict in pArray) {
                DDProductsModel *productModel = [DDProductsModel productsWithDict:dict];
                [model.products addObject:productModel];
            }
        }
        
        finishBlock(cArray.copy, nil);
        
    } withFailedBlock:^(NSError *error) {
        NSLog(@"%@",error);
        
        finishBlock(nil, error);
        
    } withErrorBlock:^(NSString *message) {
        
        NSLog(@"%@",message);
    }];
    
}



@end
