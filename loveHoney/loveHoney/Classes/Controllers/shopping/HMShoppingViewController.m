//
//  HMShoppingViewController.m
//  loveHoney
//
//  Created by hebing on 16/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMShoppingViewController.h"

@interface HMShoppingViewController ()

@end

@implementation HMShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpUI];
    
    
}
//设置UI界面
- (void)setUpUI{

    UIImageView *imageView = [[UIImageView alloc]initWithImage:@"v2_shop_empty"];
 
    [self.view addSubview:imageView];

//设置imageView的约束
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(imageView.superview.mas_top).offset(screemH * 1/6);
        make.left.mas_equalTo(self.view.mas_left).offset(KsceeenWidth * 2/5);
        make.height.mas_equalTo(60);
        make.width.mas_equalTo(60);
        
    }];
    













}




















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
