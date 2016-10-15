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
