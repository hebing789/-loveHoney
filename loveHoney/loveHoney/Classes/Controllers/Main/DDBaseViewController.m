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
#import "DDQRCodeViewController.h"
#import "HMAddressController.h"
#import "HMSearchController.h"

@interface DDBaseViewController ()<DDQRCodeViewControllerDelegate>



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
//    UIView *customTitleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    self.navigationItem.titleView = customTitleView;
    
    
    //添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumpToAdressView)];
    [customTitleView addGestureRecognizer:tap];
    
//    //deliveryLabel
//    UILabel *deliveryLabel = [[UILabel alloc]init];
//    [deliveryLabel setText:@"配送至"];
//    [deliveryLabel setFont: [UIFont systemFontOfSize:10]];
//    [deliveryLabel setTextColor:[UIColor blackColor]];
//    deliveryLabel.layer.borderWidth = 0.5;
//    deliveryLabel.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor blackColor]);
//    [customTitleView addSubview:deliveryLabel];
//    //adressLabel
//    UILabel *addressLabel = [[UILabel alloc]init];
//    [addressLabel setText:@"人民大会堂"];
//    [addressLabel setFont: [UIFont systemFontOfSize:14]];
//    [addressLabel setTextColor:[UIColor blackColor]];
//    [customTitleView addSubview:addressLabel];
//    //arrowIcon
//    UIImageView *iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"allowBlack"]];
//    [customTitleView addSubview:iconView];
//    
//    //约束
//    [deliveryLabel makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.equalTo(customTitleView);
//        make.centerY.equalTo(customTitleView);
//    }];
//    [addressLabel makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.equalTo(deliveryLabel.trailing).offset(@5);
//        make.centerY.equalTo(customTitleView);
//        make.top.equalTo(customTitleView);
//    }];
//    [iconView makeConstraints:^(MASConstraintMaker *make) {
//        make.height.width.equalTo(@10);
//        make.leading.equalTo(addressLabel.trailing).offset(@5);
//        make.centerY.equalTo(addressLabel);
//    }];
    
}


-(void)jumpToAdressView{

//    NSLog(@"跳到地址视图");
    HMAddressController* add =[[HMAddressController alloc]init];
    
    add.navigationItem.title = @"我的收货地址";
    
    [self.navigationController pushViewController:add animated:YES];
    

}


-(void)scanBtnDidClick{

    DDQRCodeViewController *qrVc = [[DDQRCodeViewController alloc] init];
    qrVc.delegate = self;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:qrVc];
    
    // 设置扫描完成后的回调
    __weak typeof (self) wSelf = self;
    [qrVc setCompletionWithBlock:^(NSString *resultAsString) {
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];

    [self presentViewController:nav animated:YES completion:nil];

}

#pragma mark - 代理方法
- (void)reader:(DDQRCodeViewController *)reader didScanResult:(NSString *)result
{
    if ([result containsString:@"http"] || [result containsString:@"://"]) {
        UIWebView *webView = [[UIWebView alloc]init];
        
        NSURL *url = [NSURL URLWithString:result];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [webView loadRequest:request];
    }
    else{
        [self dismissViewControllerAnimated:YES completion:^{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"QRCodeController" message:result delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }];
    }
    
}

-(void)searchBtnDidClick{

//    NSLog(@"点击搜索按钮了");
    
    
    HMSearchController* search = [[HMSearchController alloc]init];
    
    [self.navigationController pushViewController:search animated:YES];
//    [self presentViewController:search animated:YES completion:nil];


}

@end
