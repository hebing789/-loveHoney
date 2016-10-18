//
//  HMSearchController.m
//  loveHoney
//
//  Created by hebing on 16/10/18.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMSearchController.h"

@interface HMSearchController ()

@end

@implementation HMSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//搜索
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


@end
