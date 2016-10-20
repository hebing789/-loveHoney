//
//  DDScanViewController.m
//  loveHoney
//
//  Created by deepindo on 2016/10/20.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DDScanViewController.h"

@interface DDScanViewController ()

@end

@implementation DDScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor clearColor];
    UIWebView *webView = [[UIWebView alloc]init];
    self.view = webView;
    
    [self loadUrlPageWith:self.urlStr];
    
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)loadUrlPageWith:(NSString *)urlStr{
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    [(UIWebView *)self.view loadRequest:urlRequest];
}


@end
