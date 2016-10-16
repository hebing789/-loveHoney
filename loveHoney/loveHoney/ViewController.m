//
//  ViewController.m
//  爱鲜蜂API
//
//  Created by Ricky on 16/5/23.
//  Copyright © 2016年 Ricky. All rights reserved.
//
#import "DSHTTPClient.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self supermarket];
    
//    [self focus];

//    [self firstSell];
//    
//    [self search];
}


//超市
- (void)supermarket{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    // type = 0/1
    [param setValue:@"5" forKey:@"call"];
    
    
    [DSHTTPClient postUrlString:@"supermarket.json.php" withParam:param withSuccessBlock:^(id data) {
        NSLog(@"%@",data);
    } withFailedBlock:^(NSError *error) {
        NSLog(@"%@",error);
    } withErrorBlock:^(NSString *message) {
        NSLog(@"%@",message);
    }];

    
    
}
// 首页焦点
- (void)focus{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    // type = 0/1
    [param setValue:@"1" forKey:@"call"];
    
    
    [DSHTTPClient postUrlString:@"focus.json.php" withParam:param withSuccessBlock:^(id data) {
        NSLog(@"%@",data);
    } withFailedBlock:^(NSError *error) {
        NSLog(@"%@",error);
    } withErrorBlock:^(NSString *message) {
        NSLog(@"%@",message);
    }];
    
    
    
}

// 首页新鲜热卖
- (void)firstSell{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    [param setValue:@"2" forKey:@"call"];
    
    // http://iosapi.itcast.cn/loveBeen/focus.json.php
    
    [DSHTTPClient postUrlString:@"firstSell.json.php" withParam:param withSuccessBlock:^(id data) {
        NSLog(@"%@",data);
    } withFailedBlock:^(NSError *error) {
        NSLog(@"%@",error);
    } withErrorBlock:^(NSString *message) {
        NSLog(@"%@",message);
    }];
    
    
}

// 首页新鲜热卖
- (void)search{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    [param setValue:@"6" forKey:@"call"];
    
    
    [DSHTTPClient postUrlString:@"search.json.php" withParam:param withSuccessBlock:^(id data) {
        NSLog(@"%@",data);
    } withFailedBlock:^(NSError *error) {
        NSLog(@"%@",error);
    } withErrorBlock:^(NSString *message) {
        NSLog(@"%@",message);
    }];
    

}


// 程序启动广告
- (void)ads{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    [param setValue:@"7" forKey:@"call"];
    
    
    [DSHTTPClient postUrlString:@"ad.json.php" withParam:param withSuccessBlock:^(id data) {
        NSLog(@"%@",data);
    } withFailedBlock:^(NSError *error) {
        NSLog(@"%@",error);
    } withErrorBlock:^(NSString *message) {
        NSLog(@"%@",message);
    }];
    
    
}

// 程序启动广告
- (void)system{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    [param setValue:@"10" forKey:@"call"];
    
    
    [DSHTTPClient postUrlString:@"SystemMessage.json.php" withParam:param withSuccessBlock:^(id data) {
        NSLog(@"%@",data);
    } withFailedBlock:^(NSError *error) {
        NSLog(@"%@",error);
    } withErrorBlock:^(NSString *message) {
        NSLog(@"%@",message);
    }];
    
    
}

@end
