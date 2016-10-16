//
//  HMWebViewController.m
//  loveHoney
//
//  Created by hebing on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMWebViewController.h"

@interface HMWebViewController ()

@end

@implementation HMWebViewController

-(void)loadView{
    if (self.urlString) {
        UIWebView *webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
        [webView loadRequest:request];
        
        self.view = webView;
    }else if (self.imgUrlString){
        
        
        
    }else{
        [super loadView];
    }
  
}

-(void)setImgUrlString:(NSString *)imgUrlString{
    
    _imgUrlString = imgUrlString;
    UIImageView* imgView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    
    [imgView sd_setImageWithURL:[NSURL URLWithString:imgUrlString]];
    
    
    
    [self.view addSubview:imgView];
        [self.view layoutIfNeeded];
    

    
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionLayoutSubviews animations:^{
        
        imgView.transform = CGAffineTransformMakeScale(2, 2);
        imgView.alpha = 0;
    } completion:^(BOOL finished) {
        [imgView removeFromSuperview];
        
    }];
    

    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
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
