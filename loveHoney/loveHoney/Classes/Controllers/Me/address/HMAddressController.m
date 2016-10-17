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
//@property(nonatomic,weak)UITableView*tableView;
@property(nonatomic,weak)UIView * addAdress;

@end

@implementation HMAddressController

//-(void)loadView{
//    
////    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
////    UITableView* tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
////    self.tableView = tableView;
////    [self.view addSubview:tableView];
//    
//}

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
    
     self.tableView.tableFooterView =[UIView new];
    self.tableView.tableHeaderView.height =20;
    self.tableView.sectionHeaderHeight = 20;
    [self.tableView registerClass:[HMAdrressCell class] forCellReuseIdentifier:cellId];
    [self.tableView setAllowsSelection:NO];
    


}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    UIView * addAdress = [[UIView alloc]initWithFrame:CGRectMake(screemW*0.2, screemH - 40, screemW*0.6, 40)];
    addAdress.backgroundColor = [UIColor yellowColor];
    addAdress.layer.cornerRadius = 10;
    addAdress.layer.masksToBounds = YES;
    //注意frame设置不要错误
//    UILabel* lab=[[UILabel alloc]initWithFrame:addAdress.bounds];
//    lab.text = @"+新增地址";
//    lab.textColor = [UIColor blackColor];
//    lab.textAlignment = NSTextAlignmentCenter;
//     [addAdress addSubview:lab];
    UIButton* btn = [[UIButton alloc]initWithFrame:addAdress.bounds];
    [btn setTitle:@"新增地址" forState:UIControlStateNormal];
    btn.titleLabel.textAlignment  = NSTextAlignmentCenter;
//    btn.titleLabel.textColor = [UIColor blackColor];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(addAdressInfor) forControlEvents:UIControlEventTouchUpInside];
    [addAdress addSubview:btn];
    
   
    self.addAdress = addAdress;
    //可以实现效果,但是创建后不会销毁
    [[UIApplication sharedApplication].keyWindow addSubview:addAdress];
    

}

-(void)addAdressInfor{
    
    HMEditAdrController* edit =[[HMEditAdrController alloc]init];
    
    
    [self.navigationController pushViewController:edit animated:YES];
    
    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:YES];
    [self.addAdress removeFromSuperview];
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
        [edit setCallbackClick:^(BOOL isDelete) {
            if (isDelete == YES) {
                [self.dataAry removeObject:model];
            }
            
            [self.tableView reloadData];
          
        }];
        
        [self.navigationController pushViewController:edit animated:YES];
        
        
    }];
    
   
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPat{
    
    return 80;
}

@end
