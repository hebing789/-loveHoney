//
//  DDBaseNavController.m
//  loveHoney
//
//  Created by deepindo on 2016/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DDBaseNavController.h"

@interface DDBaseNavController ()

@end

@implementation DDBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //子控制器的数量
    NSInteger count = viewController.childViewControllers.count;
    
    //判断子控制器的数量
    if (count > 0) {
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" imageName:@"v2_goback" target:self action:@selector(back)];
        
        
        viewController.hidesBottomBarWhenPushed = YES;
        
    
    }
    
    [super pushViewController:viewController animated:animated];

}

-(void)back{

    NSLog(@"返回");

}


@end
