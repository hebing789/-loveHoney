//
//  HMNetworkTools.m
//  1.OC网络单例对象的封装
//
//  Created by apple on 16/9/23.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "HMNetworkTools.h"


@protocol HTTPProxy <NSObject>

//可选的协议方法
//为了让系统能够给一个只能提示 调用的时候不报错误 就是为了欺骗编译器
@optional
- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                                       URLString:(NSString *)URLString
                                      parameters:(id)parameters
                                  uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgress
                                downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress
                                         success:(void (^)(NSURLSessionDataTask *, id))success
                                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;
@end

//私有的分类
@interface HMNetworkTools ()<HTTPProxy>

@end

@implementation HMNetworkTools

//单例对象
+ (instancetype)sharedTools {
    static HMNetworkTools *tools = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[self alloc] init];
        //添加支持text/html的解析
        tools.responseSerializer.acceptableContentTypes = [tools.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    });
    
    return tools;
}


- (void)request:(HTTPMethod)method urlString:(NSString *)urlString parameters:(id)parameters finished:(void (^)(id, NSError *))finished {
    //判断method 做出相应的网络请求
    //将成功  和 失败的 block 提前定义 当做函数的参数传递
    //定义成功block
    void(^successCallback)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) = ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //成功的回调
        finished(responseObject,nil);
    };
    
    void(^failureCallBack)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finished(nil,error);
    };
    
    NSString *methodName = (method == GET) ? @"GET" : @"POST";
    //消息机制 该方法本类中没有实现 转发给父类
    //如何调用父类的私有的方法  利用了OC的动态的特性
    //发送了一个消息
    //知道父类中有什么样私有方法 如果子类中也需要 可以使用这种方式来调用
    [[self dataTaskWithHTTPMethod:methodName URLString:urlString parameters:parameters uploadProgress:nil downloadProgress:nil success:successCallback failure:failureCallBack] resume];
    
    /*
    NSURLSessionDataTask *dataTask = [self dataTaskWithHTTPMethod:@"GET"
                                                        URLString:URLString
                                                       parameters:parameters
                                                   uploadProgress:nil
                                                 downloadProgress:downloadProgress
                                                          success:success
                                                          failure:failure];
    
    [dataTask resume];
     */
    /*
    NSURLSessionDataTask *dataTask = [self dataTaskWithHTTPMethod:@"POST" URLString:URLString parameters:parameters uploadProgress:uploadProgress downloadProgress:nil success:success failure:failure];
    
    [dataTask resume];
     */
    
}

//核心方法的封装 就是为了摆脱对框架的强依赖  --> 解耦
//封装到这里就已经基本上OK

/*
- (void)request:(HTTPMethod)method urlString:(NSString *)urlString parameters:(id)parameters finished:(void (^)(id, NSError *))finished {
    //判断method 做出相应的网络请求
    //将成功  和 失败的 block 提前定义 当做函数的参数传递
    //定义成功block
    void(^successCallback)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) = ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //成功的回调
        finished(responseObject,nil);
    };
    
    void(^failureCallBack)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finished(nil,error);
    };
    
    if (method == GET) {
        //get请求
        [self GET:urlString parameters:parameters progress:nil success:successCallback failure:failureCallBack];
    } else {
        //post 请求
        [self POST:urlString parameters:parameters progress:nil success:successCallback failure:failureCallBack];
    }
}
 */

@end
