//
//  AppDelegate.m
//  loveHoney
//
//  Created by hebing on 16/10/14.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "AppDelegate.h"
#import "HBTableBarController.h"
#import "WecomeAnimation.h"
#import "HMWebViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];

    [self setNetWork];
//    //先加载数据,加载成功后就,切换控制器
   
    
   


        return YES;
  }
-(void)setNetWork{
    
    AFNetworkReachabilityManager *reach = [AFNetworkReachabilityManager sharedManager];
    
    //当网络类型改变的时候,block就会被调用
    [reach setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
                
                case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                
                [self addAdsVideo:^{
                    
                    
                }];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self setwindowRootViewController];
                });
                
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                [self addAdsVideo:^{
                    
                    
                }];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self setwindowRootViewController];
                });
                
            }
                break;
           
            default:
            {
                
                [SVProgressHUD showErrorWithStatus:@"网络不好,正在加载"];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    [SVProgressHUD dismiss];
                    
                });
                
               [self setwindowRootViewController];
 
            }
                break;
        }
    }];
    
    //开启监控
    [reach startMonitoring];
    
    
}

-(void)setwindowRootViewController{

        
        //            获取当前版本号:
        NSDictionary* dic=[NSBundle mainBundle].infoDictionary;
        NSString* currentVersion=dic[@"CFBundleShortVersionString"];
        
        NSString* old=[[NSUserDefaults standardUserDefaults] objectForKey:@"version"];
        if ([old isEqualToString:currentVersion]) {
            HBTableBarController* tabbar=[[HBTableBarController alloc]init];
            
            self.window.rootViewController=tabbar;
            
        }else{
            WecomeAnimation* welcome=[[WecomeAnimation alloc]init];
            
            self.window.rootViewController=welcome;
            
            //保存上次成功的版本号
            [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"version"];
            [[NSUserDefaults standardUserDefaults]synchronize];
        }
        
        [self.window makeKeyAndVisible];
        [UIApplication sharedApplication].statusBarHidden=NO;
        [UIApplication sharedApplication].statusBarStyle= UIStatusBarStyleLightContent ;
        
        
    

}

-(void)addAdsVideo:(void(^)())back{
    //法1,没有实现
//    HMWebViewController* web = [[HMWebViewController alloc]init];
//    self.window.rootViewController = web;
//    [self.window makeKeyAndVisible];
    
    [self ads:^(NSDictionary *data) {
        
        NSDictionary* dic1 = data[@"data"];
        
//        web.urlString= dic1[@"img_big_name"];
  
        
        UIImageView* imgView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        
        
        [imgView sd_setImageWithURL:[NSURL URLWithString:dic1[@"img_big_name"]]];
        
        
        
        [self.window addSubview:imgView];
        
        [self.window makeKeyAndVisible];
        
        
        [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionLayoutSubviews animations:^{
            
            imgView.transform = CGAffineTransformMakeScale(2, 2);
            imgView.alpha = 0;
        } completion:^(BOOL finished) {
            [imgView removeFromSuperview];
            
        }];

        if (back) {
            back();
     
        }
        
        
    }];
    
    
}

// 程序启动广告
//图片广告
- (void)ads:(void(^)(NSDictionary*))dataBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    [param setValue:@"7" forKey:@"call"];
    
    
    [DSHTTPClient postUrlString:@"ad.json.php" withParam:param withSuccessBlock:^(id data) {
        
//        NSLog(@"%@",data);
        if (dataBlock) {
            dataBlock(data);
        }
        
    } withFailedBlock:^(NSError *error) {
        NSLog(@"%@",error);
    } withErrorBlock:^(NSString *message) {
        NSLog(@"%@",message);
    }];
    
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
