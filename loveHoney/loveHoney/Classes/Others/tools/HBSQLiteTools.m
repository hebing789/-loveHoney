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
        
        [self creatTable];
        
    }
    return self;
    
}

//- (void)createTables {
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"tables.sql" ofType:nil];
//    NSError *error = nil;
//    // 加载所有的建表语句
//    NSString *sql = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
//    if (error) {
//        NSLog(@"加载数据库建表语句错误--%@", error);
//    }
//    
//    // 创建表
//    [self.queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
//        [db executeStatements:sql];
//    }];
//}

-(void)creatTable{
    
            NSString* sql = @"CREATE TABLE IF NOT EXISTS shopping ( price, name)";

    //事物写法不会
//            // 创建表
//            [self.queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
//                [db executeStatements:sql];
//            }];
    
    
    
    [_queue inDatabase:^(FMDatabase *db) {
        
      BOOL result =  [db executeStatements:sql];
        
        if (result) {
            NSLog(@"创建成功");
        }else{
            
            NSLog(@"创建失败");
        }
        
        
        
    }];

}

//-(void)insetWithName:(NSString*)name andWithPrice:(CGFloat)price{
//    
//    NSString* sql =@"INSERT ";
//     [self.queue inDatabase:^(FMDatabase *db) {
//         
//         
//         
//         
//         
//         
//     }];
//    
//    
//    
//}


@end
