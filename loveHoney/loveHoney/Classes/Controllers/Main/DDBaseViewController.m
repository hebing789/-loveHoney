//
//  DDBaseViewController.m
//  loveHoney
//
//  Created by deepindo on 2016/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DDBaseViewController.h"
#import "DDTitleView.h"
#import <Masonry.h>

@interface DDBaseViewController ()

@end

@implementation DDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self setupNavBar];
    
}

-(void)setupNavBar{
    //背景色
    self.navigationController.navigationBar.barTintColor = kThemeColor;
    //左右item
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"扫一扫" imageName:@"icon_black_scancode" target:self action:@selector(scanBtnDidClick)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"搜索" imageName:@"icon_search" target:self action:@selector(searchBtnDidClick)];
    
    //titleView
    DDTitleView *customTitleView = [DDTitleView ddTitleView];
    self.navigationItem.titleView = customTitleView;
//    //deliveryLabel
//    UILabel *deliveryLabel = [[UILabel alloc]init];
//    [deliveryLabel setText:@"配送至"];
//    [deliveryLabel setFont: [UIFont systemFontOfSize:9]];
//    [deliveryLabel setTextColor:[UIColor darkGrayColor]];
//    deliveryLabel.layer.borderWidth = 2;
//    deliveryLabel.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor darkGrayColor]);
//    [titleView addSubview:deliveryLabel];
//    //adressLabel
//    UILabel *addressLabel = [[UILabel alloc]init];
//    [addressLabel setText:@"人民大会堂"];
//    [addressLabel setFont: [UIFont systemFontOfSize:14]];
//    [addressLabel setTextColor:[UIColor darkGrayColor]];
//    [titleView addSubview:addressLabel];
//    //arrowIcon
//    UIImageView *iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"allowBlack"]];
//    [titleView addSubview:iconView];
//    //约束
    

}

-(void)scanBtnDidClick{

    NSLog(@"点击扫描按钮了");

}

-(void)searchBtnDidClick{

    NSLog(@"点击搜索按钮了");

}

@end
