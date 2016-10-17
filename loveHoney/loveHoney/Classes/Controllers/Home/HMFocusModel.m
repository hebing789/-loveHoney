//
//  HMFocusModel.m
//  loveHoney
//
//  Created by 黄凯 on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMFocusModel.h"
#import "DSHTTPClient.h"

@implementation HMFocusModel

+ (void)focusModelWithSuccess:(void (^)(NSArray<HMFocusModel *> *))successBlock error:(void (^)())errorBlock
{
    [DSHTTPClient postUrlString:@"http://iosapi.itcast.cn/loveBeen/focus.json.php" withParam:@{@"call":@1} withSuccessBlock:^(NSDictionary *data) {
        NSLog(@"%@",data);
        
        NSDictionary *dataDict = data[@"data"];
        
        if (successBlock) {
            successBlock(data);
        }
        
    } withFailedBlock:^(NSError *error) {
        
    } withErrorBlock:^(NSString *message) {
        
    }];
}

@end
