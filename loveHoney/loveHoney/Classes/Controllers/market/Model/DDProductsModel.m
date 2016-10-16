//
//  DDProductsModel.m
//  loveHoney
//
//  Created by deepindo on 2016/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DDProductsModel.h"

@implementation DDProductsModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self)
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


+(instancetype)productsWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.ids = value;
    }
}
@end
