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
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"v2_goback"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(ClickBtn:)];
//    UIButton *backBtn = [[UIButton alloc]init];
//    [backBtn addTarget:self action:@selector(ClickBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [backBtn setImage:[UIImage imageNamed:@"v2_goback"] forState:UIControlStateNormal];
//    UIBarButtonItem *btnLeftItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
//    self.navigationItem.leftBarButtonItem = btnLeftItem;
//    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"v2_shop_empty"]];
 
    [self.view addSubview:imageView];
    
    UILabel *lable = [[UILabel alloc]init];
    lable.text = @"亲,购物车空空的耶~赶紧挑好吃的吧";
    lable.textColor = [UIColor grayColor];
    lable.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:lable];
    
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:@"去逛逛" forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn.png"]  forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:17]];
    //给button添加一个监听事件
    [btn addTarget:self action:@selector(ClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
//设置imageView的约束
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
    
        
        
        make.top.mas_equalTo(imageView.superview.mas_top).offset(screemH * 1/4);
        
        make.left.mas_equalTo(self.view.mas_left).offset(screemW * 1/2 - screemW * 1/8);
        
        make.height.mas_equalTo(screemW * 1/4);
        
        make.width.mas_equalTo(screemW * 1/4);
        
    }];
    
//设置lable的约束
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(imageView.mas_bottom).offset(screemW * 1/10);
        
        make.centerX.mas_equalTo(imageView.mas_centerX);
        
        
    }];


//设置btn的约束
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(lable.mas_bottom).offset(screemW * 1/10);
        
         make.centerX.mas_equalTo(imageView.mas_centerX);
        
        
         make.height.mas_equalTo(screemW * 1/12);
         make.width.mas_equalTo(screemW * 1/3);
        
    }];









}

//按钮点击事件
- (void)ClickBtn:(UIButton *)btn
{

    NSLog(@"点击逛逛按钮");
    [self dismissViewControllerAnimated:YES completion:^{
        
        if (_callback) {
            _callback();
        }
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
