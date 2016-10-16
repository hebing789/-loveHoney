//
//  HMMyMessageController.m
//  loveHoney
//
//  Created by hebing on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMMyMessageController.h"

@interface HMMyMessageController ()

@end

@implementation HMMyMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTopView];
}

- (void)createTopView
{
    UISegmentedControl *topSegmentedControl = [[UISegmentedControl alloc]initWithFrame:CGRectMake(0 , 0, self.navigationController.navigationBar.frame.size.width * 2 /5, self.navigationController.navigationBar.frame.size.height * 3 / 5)];
    
    topSegmentedControl.center = self.navigationController.navigationBar.center;
    
    [topSegmentedControl insertSegmentWithTitle:@"系统消息" atIndex:0 animated:YES];
    [topSegmentedControl insertSegmentWithTitle:@"用户消息" atIndex:1 animated:YES];
    
    topSegmentedControl.tintColor = [UIColor colorWithRed:253 / 255.0 green:217 / 255.0 blue:39 / 255.0 alpha:1];
    //设置字体
    UIFont *font = [UIFont boldSystemFontOfSize:13.0f];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                           forKey:UITextAttributeFont];
    [topSegmentedControl setTitleTextAttributes:attributes
                                       forState:UIControlStateNormal];
    //设置字体颜色
    UIColor *greenColor = [UIColor blackColor];
    NSDictionary *colorAttr = [NSDictionary dictionaryWithObject:greenColor forKey:UITextAttributeTextColor];
    [topSegmentedControl setTitleTextAttributes:colorAttr forState:UIControlStateNormal];
    
    [self.navigationItem setTitleView: topSegmentedControl];
}


@end
