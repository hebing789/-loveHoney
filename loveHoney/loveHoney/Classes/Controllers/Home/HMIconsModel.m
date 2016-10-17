//
//  HMIconsModel.m
//  loveHoney
//
//  Created by 黄凯 on 16/10/17.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMIconsModel.h"

@implementation HMIconsModel

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


+(void)iconsModelWithSuccess:(void (^)(NSArray<HMIconsModel *> *))successBlock error:(void (^)())errorBlock{
    
    [DSHTTPClient postUrlString:@"http://iosapi.itcast.cn/loveBeen/focus.json.php" withParam:@{@"call":@1} withSuccessBlock:^(NSDictionary *data) {
        NSLog(@"%@",data);
        
        NSDictionary *dataDict = data[@"data"];
        
        NSArray* ary = dataDict[@"icons"];
        
        NSMutableArray* temData = [NSMutableArray new];
        [ary enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            HMIconsModel* model = [HMIconsModel modelWithDict:obj];
            [temData addObject:model];
            
            
            
        }];
        
        
        if (successBlock) {
            successBlock(temData);
        }
        
    } withFailedBlock:^(NSError *error) {
        
    } withErrorBlock:^(NSString *message) {
        
    }];
    
}


@end
