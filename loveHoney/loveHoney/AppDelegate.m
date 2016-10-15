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
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    //获取当前版本号:
    
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
    WecomeAnimation* welcome=[[WecomeAnimation alloc]init];
    
    self.window.rootViewController=welcome;
    //    // UIStatusBarStyleDefault                                     = 0, // Dark content, for use on light backgrounds
    //    UIStatusBarStyleLightContent     NS_ENUM_AVAILABLE_IOS(7_0) = 1, // Light content, for use on dark backgrounds
    //
    //    UIStatusBarStyleBlackTranslucent NS_ENUM_DEPRECATED_IOS(2_0, 7_0, "Use UIStatusBarStyleLightContent") = 1,
    //    UIStatusBarStyleBlackOpaque      NS_ENUM_DEPRECATED_IOS(2_0, 7_0, "Use UIStatusBarStyleLightContent") = 2,
    
    
    //    /    这句话影藏tabar没效果,可能是自定义的原因;
    //    [UIApplication sharedApplication].keyWindow.rootViewCtroller.hidesBottomBarWhenPushed=YES;
    
    
    //启动时屏幕右边向上设置,
    //    [UIApplication sharedApplication].statusBarOrientation=UIInterfaceOrientationLandscapeRight;
    
    
//    HBTableBarController* tabbar=[[HBTableBarController alloc]init];
//    
//    self.window.rootViewController=tabbar;

    [self.window makeKeyAndVisible];
    [UIApplication sharedApplication].statusBarHidden=NO;
    [UIApplication sharedApplication].statusBarStyle= UIStatusBarStyleLightContent ;
    

    

    return YES;
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
