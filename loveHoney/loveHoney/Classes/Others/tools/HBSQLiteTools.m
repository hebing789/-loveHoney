//
//  HBSQLiteTools.m
//  loveHoney
//
//  Created by hebing on 16/10/20.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HBSQLiteTools.h"

@interface HBSQLiteTools()

@property(nonatomic,strong)FMDatabaseQueue* queue;

@end

@implementation HBSQLiteTools


+(instancetype)sharedTools{
    
    static  id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
        
        
           });
    
    return instance;
    
}

-(instancetype)init{
    if (self=[super init]) {
        //需要给数据文件指定路径  -> 通常放在沙盒路径, 不能够放到temp路径, 这个路径不会被备份
        self.queue = [[FMDatabaseQueue alloc]initWithPath:pathShopping];
        NSLog(@"shop>>>:%@",pathShopping);
        
//        [self creatTable];
        
    }
    return self;
    
}

-(void)creatTable{
//    NSString* sql = 
    
//    @"CREATE TABLE IF NOT EXISTS \"shopping\" (
//    \"price\" ,
//    \"name\"
//    )";
    

    
    
}

@end
