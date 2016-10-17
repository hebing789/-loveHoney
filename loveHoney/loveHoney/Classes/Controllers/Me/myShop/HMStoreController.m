//
//  HMShoppingController.m
//  loveHoney
//
//  Created by hebing on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMStoreController.h"

@interface HMStoreController ()

@end

@implementation HMStoreController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView* imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"v2_store_empty"]];
    imgView.center =self.view.center;
     [self.view addSubview: imgView];
    
    
    self.view.backgroundColor = [UIColor colorWithRed:239 green:239 blue:239 alpha:1];
    
    UILabel* lab = [[UILabel alloc]init];
    lab.text =@"还没有收藏的店铺哟~~~";
    //这个设置后center点为lab起点
//    lab.center = CGPointMake(self.view.center.x, CGRectGetMaxY(imgView.frame)+20);
//    //一定要有大小才能显示
    [lab sizeToFit];
    lab.frame=CGRectMake(0, CGRectGetMaxY(imgView.frame)+20, screemW, 20);
    
    lab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lab];
   
    
    // Do any additional setup after loading the view.
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
