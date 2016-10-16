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
#import "HMTabBar.h"

@interface HBTableBarController ()


//解决dismiss后调回之前present的页面问题,购物页面present问题用属性记录无法实现

@end

@implementation HBTableBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    //自定义购物车按钮 的tabBar;
    HMTabBar* tarBar= [[HMTabBar alloc]init];
    
    [tarBar setButClickCallback:^{
        HMShoppingViewController *shoppingVC = [[HMShoppingViewController alloc]init];
        DDBaseNavController *navVC = [[DDBaseNavController alloc]initWithRootViewController:shoppingVC];
        
        shoppingVC.navigationItem.title = @"购物车";
        [self presentViewController: navVC animated:YES completion:^{

        }];
        
        
    }];
    [self setValue:tarBar forKey:@"tabBar"];
    
}

-(instancetype)init{
    if (self=[super init]) {
        
        [self addChildViewControllers];
        //如何关掉tabbar的渲染颜色
        //这句话直接没颜色,连字都显示不出来
        //        self.tabBar.tintColor=[UIColor clearColor];
        
    }
    
    return self;
}


-(void)addChildViewControllers
{
    HMHomeController *homeVC = [[HMHomeController alloc]init];
    HMMarketViewController *marketVC = [[HMMarketViewController alloc]init];
//    HMShoppingViewController *shoppingVC = [[HMShoppingViewController alloc]init];
//    self.shoppingVC=shoppingVC;
    HMMeViewController *profileVC = [[HMMeViewController alloc]init];
    
    
    [self addChildViewController:homeVC andTitle:@"首页" andImageName:@"v2_home" andSelectedImageName:@"v2_home_r"andIndex:0];
    [self addChildViewController:marketVC andTitle:@"闪电超市" andImageName:@"freshReservation" andSelectedImageName:@"freshReservation_r"andIndex:1];
//    [self addChildViewController:shoppingVC andTitle:@"购物车" andImageName:@"shopCart" andSelectedImageName:@"shopCart_r"andIndex:2];
    [self addChildViewController:profileVC andTitle:@"我的" andImageName:@"v2_my" andSelectedImageName:@"v2_my_r"andIndex:2];
    
}

-(void)addChildViewController:(UIViewController *)vc andTitle:(NSString *)title andImageName:(NSString *)imageName andSelectedImageName:(NSString *)selectedImageName andIndex:(NSInteger)index
{
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.tag=index;
    UIImage *normalImage = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc.tabBarItem.image = normalImage;
    vc.tabBarItem.selectedImage = selectedImage;
    
    
    [vc.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]} forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor darkGrayColor]} forState:UIControlStateSelected];
    
    DDBaseNavController *navVC = [[DDBaseNavController alloc]initWithRootViewController:vc];
     [self addChildViewController:navVC];
////    后面要Push如果当前控制器没有导航控制器push不过去,在此可以获取navegationBar,利用生命周期写,更简单

    
    
}




-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
//    if(item.tag ==2){
//        //由于这个tabbar的点击事件无法拦截,跳转后dismiss都会直接回到购物车页面
//        
//        //需要创建一个,设置属性传过来不行
//        HMShoppingViewController *shoppingVC = [[HMShoppingViewController alloc]init];
//        DDBaseNavController *navVC = [[DDBaseNavController alloc]initWithRootViewController:shoppingVC];
//        //使用谁推过去,dismiss就显示谁的逻辑不行
////        UIViewController* lastViewController=self.childViewControllers[0];
//
////        [shoppingVC setCallback:^{
////                  [self.itemAry addObject:item];
////           
////            
//////            
//////        }];
//    
//        [self presentViewController: navVC animated:YES completion:^{
//
//            
//            
//        }];
//        
//
//        return;
//    }
//    
    NSInteger index = 0;
//    NSLog(@"%ld",(long)item.tag);
    for (UIView* subview in tabBar.subviews) {
        
        
        
        if ([subview isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            if (index == item.tag) {
                for (UIView* targertView in subview.subviews) {
                    
                    if ([targertView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                        
                        targertView.transform = CGAffineTransformMakeScale(0.5, 0.5);
                        
                        [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:5 options:UIViewAnimationOptionLayoutSubviews animations:^{
                            
                            targertView.transform = CGAffineTransformMakeScale(1, 1);
                            
                        } completion:^(BOOL finished) {
                            
                        }];
              
                    }
                    
                    
                }
                

            }
            
            index ++;
        }
        
        
    }
    
    
    
    
    
    
    
    
    
}



@end
