//
//  DDBaseViewController.m
//  loveHoney
//
//  Created by deepindo on 2016/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DDBaseViewController.h"

@interface DDBaseViewController ()

@end

@implementation DDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.navigationController.navigationBar.barTintColor = kThemeColor;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" imageName:@"icon_black_scancode" target:self action:@selector(scanBtnDidClick)];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" imageName:@"icon_search" target:self action:@selector(searchBtnDidClick)];
    
}

-(void)scanBtnDidClick{

    NSLog(@"点击扫描按钮了");

}

-(void)searchBtnDidClick{

    NSLog(@"点击搜索按钮了");

}

@end
