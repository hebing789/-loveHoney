//
//  HMAddresModel.m
//  loveHoney
//
//  Created by hebing on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMAddresModel.h"

@implementation HMAddresModel


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super init]) {
       self.accept_name= [aDecoder decodeObjectForKey:@"accept_name"];
         self.telphone= [aDecoder decodeObjectForKey:@"telphone"];
        self.address =  [aDecoder decodeObjectForKey:@"address"];
        self.province_name = [aDecoder decodeObjectForKey:@"province_name"];
        
        
      self.city_name =  [aDecoder decodeObjectForKey:@"city_name"];
        self.gender =  [aDecoder decodeObjectForKey:@"gender"];
       
        self.addr_for_dealer = [aDecoder decodeObjectForKey:@"addr_for_dealer"];

    }
    
    
    return self;
    
}


-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    
    [aCoder encodeObject:self.accept_name forKey:@"accept_name"];
    [aCoder encodeObject:self.telphone forKey:@"telphone"];
    [aCoder encodeObject:self.address forKey:@"address"];
    [aCoder encodeObject:self.province_name forKey:@"province_name"];
    
    [aCoder encodeObject:self.city_name forKey:@"city_name"];
    [aCoder encodeObject:self.gender forKey:@"gender"];
    [aCoder encodeObject:self.addr_for_dealer forKey:@"addr_for_dealer"];
    

    
}



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
    
    //地址数据
   
        
        NSMutableDictionary *param = [NSMutableDictionary dictionary];
        
        [param setValue:@"12" forKey:@"call"];
        
        
        [DSHTTPClient postUrlString:@"http://iosapi.itcast.cn/loveBeen/MyAdress.json.php" withParam:param withSuccessBlock:^(id data) {
            
            //                NSLog(@"%@",data);
            
            NSMutableArray* ary = data[@"data"];
            NSMutableArray* finial = [NSMutableArray new];
            [ary enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                HMAddresModel* model = [HMAddresModel modelWithDict:obj];
                
                [finial addObject:model];
                
                
                
            }];
            
            
            if (sucessBlock) {
                sucessBlock(finial);
            }
            
        } withFailedBlock:^(NSError *error) {
            NSLog(@"%@",error);
        } withErrorBlock:^(NSString *message) {
            NSLog(@"%@",message);
        }];

    


    
}
@end
