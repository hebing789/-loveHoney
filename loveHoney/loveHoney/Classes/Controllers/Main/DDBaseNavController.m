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
    NSInteger count = self.childViewControllers.count;
    
    //判断子控制器的数量
    if (count > 0) {
        //自定义barButton能实现效果
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" imageName:@"v2_goback" target:self action:@selector(back)];
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"v2_goback"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        
        //隐藏底部
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];

}

-(void)back{

    [self popViewControllerAnimated:YES];

}


@end
