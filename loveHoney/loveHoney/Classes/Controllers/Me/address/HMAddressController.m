//
//  HMAddressController.m
//  loveHoney
//
//  Created by hebing on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMAddressController.h"
#import "HMAddresModel.h"
#import "HMAdrressCell.h"

#import "HMEditAdrController.h"
static NSString* cellId= @"HMAddressControllerCell";
@interface HMAddressController ()



@end

@implementation HMAddressController

-(void)setDataAry:(NSMutableArray *)dataAry{
    
    _dataAry = dataAry;
      [self. tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [HMAddresModel modelWithSucess:^(NSMutableArray *ary) {
        
        self.dataAry = ary;
    } andError:^{
        
        [SVProgressHUD showErrorWithStatus:@"网络链接错误"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    }];
    
    self.tableView.tableHeaderView.height =20;
    self.tableView.sectionHeaderHeight = 20;
    [self.tableView registerClass:[HMAdrressCell class] forCellReuseIdentifier:cellId];
    [self.tableView setAllowsSelection:NO];

}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.dataAry.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HMAdrressCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
     cell.model=self.dataAry[indexPath.row];
    
    [cell setCallbackClick:^(HMAddresModel *model) {
        HMEditAdrController* edit =[[HMEditAdrController alloc]init];
        
        edit.model=model;
        
        [self.navigationController pushViewController:edit animated:YES];
        
        
    }];
    
   
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPat{
    
    return 80;
}

@end
