//
//  HBTableBarController.m
//  彩票实战
//
//  Created by hebing on 16/8/11.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HBTableBarController.h"
#import "HMHomeController.h"
#import "HMMarketViewController.h"
#import "HMShoppingViewController.h"
#import "HMMeViewController.h"
#import "hideBottomBarNavagationControl.h"

@interface HBTableBarController ()

@property(nonatomic,weak)UIButton* but;

@end

@implementation HBTableBarController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(instancetype)init{
    if (self=[super init]) {
        
        [self setMyBarControl];
        //如何关掉tabbar的渲染颜色
        //这句话直接没颜色,连字都显示不出来
        //        self.tabBar.tintColor=[UIColor clearColor];
        
    }
    
    return self;
}

-(void)setMyBarControl{
    
    UIViewController* home = [HMHomeController new];
    [self setTabbarItemWith:home andWith:@"v2_home" andWithTitle:@"首页"];
   

    UIViewController* market = [HMMarketViewController new];
     hideBottomBarNavagationControl* nvMarket = [[hideBottomBarNavagationControl alloc]initWithRootViewController:market];
    [self setTabbarItemWith:nvMarket andWith:@"freshReservation" andWithTitle:@"首页"];
    
    UIViewController* shopping = [HMShoppingViewController new];
        hideBottomBarNavagationControl* nvShopping = [[hideBottomBarNavagationControl alloc]initWithRootViewController:shopping];
    [self setTabbarItemWith:shopping andWith:@"shopCart" andWithTitle:@"首页"];
    
    UIViewController* me = [HMMeViewController new];
    [self setTabbarItemWith:me andWith:@"v2_my" andWithTitle:@"首页"];
    
    self.viewControllers=@[home,nvMarket,nvShopping,me];
    
    //    [self setTabbar];
    NSMutableDictionary *atts=[NSMutableDictionary dictionary];
    atts[NSFontAttributeName]=[UIFont systemFontOfSize:12];
    atts[NSForegroundColorAttributeName]=[UIColor grayColor];
    
    NSMutableDictionary *selectedAtts=[NSMutableDictionary dictionary];
    selectedAtts[NSFontAttributeName]=atts[NSFontAttributeName];
    selectedAtts[NSForegroundColorAttributeName]=[UIColor darkGrayColor];
    // 在这里 只要更改，所有的文字都改
    
    UITabBarItem *item=[UITabBarItem appearance];
    [item setTitleTextAttributes:atts forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAtts forState:UIControlStateSelected];
    
    UINavigationBar* navagationBar=[UINavigationBar appearance];
    [navagationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize: 16],NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    
    
}

-(void)setTabbarItemWith:(UIViewController*) vc andWith:(NSString*)imagName andWithTitle:(NSString*)title{
    
    vc.tabBarItem.image=[[UIImage imageNamed:imagName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage= [[UIImage imageNamed:[NSString stringWithFormat:@"%@_r",imagName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
    vc.tabBarItem.title=@"首页";
    
}




@end
