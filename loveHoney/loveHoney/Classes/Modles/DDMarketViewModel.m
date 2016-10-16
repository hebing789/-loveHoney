//
//  DDMarketViewModel.m
//  loveHoney
//
//  Created by deepindo on 2016/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DDMarketViewModel.h"

@implementation DDMarketViewModel

-(void)loadSuperMarketData{

    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setValue:@"5" forKey:@"call"];
    
    
    [DSHTTPClient postUrlString:@"supermarket.json.php" withParam:parameter withSuccessBlock:^(id data) {
        NSLog(@"%@", data);
    } withFailedBlock:^(NSError *error) {
        NSLog(@"%@",error);
    } withErrorBlock:^(NSString *message) {
        NSLog(@"%@",message);
    }];
    
}

@end
