//
//  HMCustomerController.m
//  loveHoney
//
//  Created by hebing on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMCustomerController.h"

static NSString*cellId = @"HMCustomerControllerCell";
@interface HMCustomerController ()

@end

@implementation HMCustomerController

- (void)viewDidLoad {
    [super viewDidLoad];
 
//    self.tableView.sectionHeaderHeight= 20;

    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    
}


#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    if (indexPath.row ==0) {
        cell.textLabel.text = @"客服电话: 400-8484-482";
        
        
    }else{
        
        cell.textLabel.text = @"常见问题";
        
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
  
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        
        //先跳出弹窗,然后再跳转页面;
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"400-8484-842" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* action1 = [UIAlertAction actionWithTitle:@"拨打" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            //2种都能实现
             [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://15692107411"]];
            
//            NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"15692107411"];
//            UIWebView * callWebview = [[UIWebView alloc] init];
//            [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
//            [self.view addSubview:callWebview];
          
        }];
        
        [alert addAction:action1];
        
        UIAlertAction* action5 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alert addAction:action5];
        
        
        
        [self presentViewController:alert animated:YES completion:^{
            
        }];
        
        
    }else{
        
        HMWebViewController* web = [[HMWebViewController alloc]init];
        
        web.navigationItem.title = @"客服帮助";
        [self.navigationController pushViewController:web animated:YES];
        
        
        
        
            }
    

    
    

    
}



@end
