//
//  DDcategoriesModel.m
//  loveHoney
//
//  Created by deepindo on 2016/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DDCategoriesModel.h"

@implementation DDCategoriesModel


-(instancetype)initWithDict:(NSDictionary *)dict
{
    //实例化对象
    self = [super init];
    
    //判断对象
    if (self)
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    //返回数据
    return self;
}


+(instancetype)categoriesWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}


//设置没有定义的Key,避免报错
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    //调用空方法,什么都不做即可
}



@end
