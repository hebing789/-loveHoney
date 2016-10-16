//
//  HMEditAdrController.m
//  loveHoney
//
//  Created by hebing on 16/10/17.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMEditAdrController.h"
#import "HMAddresModel.h"
static NSString* cellId = @"HMEditAdrControllerCell1";
@interface HMEditAdrController ()

@end

@implementation HMEditAdrController

-(instancetype)init{
    
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.sectionHeaderHeight=0;
    self.tableView.sectionFooterHeight=10;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section==0) {
        return 6;
    }
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    if (indexPath.section==0) {
        UILabel* lab = [[UILabel alloc]init];
//        lab.x = 150;
//        lab.y = 0;
      
        if(indexPath.row ==0){
            cell.textLabel.text = @"联系人";
            lab.text = self.model.accept_name;
            
        }else if (indexPath.row ==1){
            cell.textLabel.text = @"删除当前地址";
            lab.text= [NSString stringWithFormat:@"%@",self.model.gender];
            
        }else if (indexPath.row ==2){
            cell.textLabel.text = @"手机号码";
            
              lab.text= [NSString stringWithFormat:@"%@",self.model.telphone];
            
        }else if (indexPath.row ==3){
            cell.textLabel.text = @"所在城市";
             lab.text = self.model.province_name;
            
        }else if (indexPath.row ==4){
            cell.textLabel.text = @"所在地区";
            lab.text = self.model.addr_for_dealer;
            
        }else if (indexPath.row ==5){
            cell.textLabel.text = @"详细地址";
            lab.text = self.model.address;
        }
        [lab sizeToFit];
        lab.frame = CGRectMake(200, 0, lab.frame.size.width, cell.contentView.frame.size.height);
        
        lab.textColor= [UIColor darkGrayColor];
        
          [cell.contentView addSubview:lab];

         cell.textLabel.textColor = [UIColor darkGrayColor];

    }else{
        
        
        cell.textLabel.text = @"删除当前地址";
        cell.textLabel.font = [UIFont systemFontOfSize:14];
//        cell.textLabel.textColor = [UIColor darkGrayColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.center=cell.center;
        

        
    }
    
  
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //文字为对应航间距
    if (indexPath.section==0) {
        if(indexPath.row ==0){
//            cell.textLabel.text = @"联系人";
            
        }else if (indexPath.row ==1){
            //            cell.textLabel.text = @"删除当前地址";
            
        }else if (indexPath.row ==2){
//            cell.textLabel.text = @"手机号码";
            
        }else if (indexPath.row ==3){
//            cell.textLabel.text = @"所在城市";
            
        }else if (indexPath.row ==4){
//            cell.textLabel.text = @"所在地区";
            
        }else if (indexPath.row ==5){
//            cell.textLabel.text = @"详细地址";
        }

        
        
    }else{
        
        
//        cell.textLabel.text = @"删除当前地址";
     
        
        
        
    }
    
    
}


@end
