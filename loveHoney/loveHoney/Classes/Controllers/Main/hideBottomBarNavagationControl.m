//
//  hideBottomBarNavagationControl.m
//  彩票实战
//
//  Created by hebing on 16/8/14.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "hideBottomBarNavagationControl.h"

@implementation hideBottomBarNavagationControl
-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    //法2
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //取消透明效果
    self.navigationBar.translucent=NO;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}



-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    
//    viewController.hidesBottomBarWhenPushed=YES;
//    UITabBar*tarbar=(UITabBar*)self.tabBarController.view.subviews.lastObject;
    viewController.hidesBottomBarWhenPushed=YES;
//     self.tabBarController.view.subviews.lastObject.hidden=YES;//影藏了出现不了
    
//    NSLog(@"%lu",viewController.view.subviews.count);
//    NSLog(@"%@",viewController.view.subviews);
//    NSLog(@"%@",viewController.view.subviews.lastObject);
    [super pushViewController:viewController animated:YES];
    
    
}
@end
