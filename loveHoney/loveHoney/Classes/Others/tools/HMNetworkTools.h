//
//  HMNetworkTools.h
//  1.OC网络单例对象的封装
//
//  Created by apple on 16/9/23.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef enum : NSUInteger {
    GET,
    POST,
} HTTPMethod;

@interface HMNetworkTools : AFHTTPSessionManager
//声明全局的访问点
+ (instancetype) sharedTools;


//封装网络请求的核心方法 以后应用程序中是所有的网络请求都是通过这个方法来发起的
//网络请求
//1. 请求方式 2.urlString 3.参数 4.block 返回的结果 和 错误信息
- (void) request:(HTTPMethod)method urlString:(NSString *)urlString  parameters:(id)parameters finished:(void(^)(id ,NSError *))finished;


@end
