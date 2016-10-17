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
@property(nonatomic,weak)UIButton* lastBtn;

//由于要传值,storyBoard需要连线, 这个位置需要设置属性
@property(nonatomic,weak)UITextField* textFiled0;
@property(nonatomic,weak)UITextField* textFiled2;
@property(nonatomic,weak)UITextField* textFiled3;
@property(nonatomic,weak)UITextField* textFiled4;
@property(nonatomic,weak)UITextField* textFiled5;


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
    
    self.navigationItem.title = @"修改地址";
    
    UIBarButtonItem* saveItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(save)];
    saveItem.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = saveItem;
    
}

-(void)save{
    self.model.accept_name = self.textFiled0.text;
    //字符串转成nsnuber;
    self.model.telphone = [NSNumber numberWithInteger:[self.textFiled2.text integerValue]];
    self.model.province_name = self.textFiled3.text;
    self.model.addr_for_dealer = self.textFiled4.text;
    self.model.address = self.textFiled5.text;
    
    if (_callbackClick) {
        _callbackClick(NO);
        
    }
 
    [self.navigationController popViewControllerAnimated:YES];
    
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
        UITextField* textFiled = [[UITextField alloc]init];

//        lab.x = 150;
//        lab.y = 0;
      
        if(indexPath.row ==0){
            cell.textLabel.text = @"联系人";
            textFiled.text = self.model.accept_name;
            self.textFiled0 = textFiled;
            
        }else if (indexPath.row ==1){
           
            
            UIButton* btn1 = [[UIButton alloc]init];
            [btn1 addTarget:self action:@selector(changeGendenle:) forControlEvents:UIControlEventTouchUpInside];
            [btn1 setImage:[UIImage imageNamed:@"order_grayMark"] forState:UIControlStateNormal];
            [btn1 setImage:[UIImage imageNamed:@"order_yellowMark"] forState:UIControlStateSelected];
            [btn1 sizeToFit];
//            btn1.frame = CGRectMake(120, 0, btn1.frame.size.width, btn1.frame.size.height);
            btn1.center = CGPointMake(120, cell.contentView.frame.size.height/2);
            [cell.contentView addSubview:btn1];
            
            UILabel* lab = [[UILabel alloc]init];
            lab.text = @"先生";
            [lab sizeToFit];
//            lab.frame = CGRectMake(140, 0, lab.frame.size.width, cell.contentView.frame.size.height);
            lab.center =  CGPointMake(CGRectGetMaxX(btn1.frame)+20, cell.contentView.frame.size.height/2);
            lab.textColor= [UIColor darkGrayColor];
            
            [cell.contentView addSubview:lab];
            
            UIButton* btn2 = [[UIButton alloc]init];
            [btn2 addTarget:self action:@selector(changeGendenle:) forControlEvents:UIControlEventTouchUpInside];
            [btn2 setImage:[UIImage imageNamed:@"order_grayMark"] forState:UIControlStateNormal];
            [btn2 setImage:[UIImage imageNamed:@"order_yellowMark"] forState:UIControlStateSelected];
            [btn2 sizeToFit];
//            btn2.frame = CGRectMake(120, 0, btn2.frame.size.width, btn2.frame.size.height);
            btn2.center = CGPointMake(CGRectGetMaxX(lab.frame)+20, cell.contentView.frame.size.height/2);
            [cell.contentView addSubview:btn2];
            
            
            
            UILabel* labLady = [[UILabel alloc]init];
            labLady.text = @"女士";
            [labLady sizeToFit];
            labLady.frame = CGRectMake(CGRectGetMaxX(btn2.frame)+10, 0, labLady.frame.size.width, cell.contentView.frame.size.height);
            labLady.textColor= [UIColor darkGrayColor];
            
            [cell.contentView addSubview:labLady];
            
            if([self.model.gender intValue] == 1){
                btn1.selected = YES;
                self.lastBtn = btn1;
            }else{
                btn2.selected = YES;
                self.lastBtn = btn2;
            }
            
            
            
        }else if (indexPath.row ==2){
            
             self.textFiled2 = textFiled;
            cell.textLabel.text = @"手机号码";
            
              textFiled.text= [NSString stringWithFormat:@"%@",self.model.telphone];
            
        }else if (indexPath.row ==3){
             self.textFiled3 = textFiled;
            cell.textLabel.text = @"所在城市";
             textFiled.text = self.model.province_name;
            
        }else if (indexPath.row ==4){
            self.textFiled4 = textFiled;
            cell.textLabel.text = @"所在地区";
            textFiled.text = self.model.addr_for_dealer;
            
        }else if (indexPath.row ==5){
            
            self.textFiled5 = textFiled;
            cell.textLabel.text = @"详细地址";
            textFiled.text = self.model.address;
        }
        
         if (indexPath.row !=1){
             [textFiled sizeToFit];
             textFiled.frame = CGRectMake(120, 0, textFiled.frame.size.width, cell.contentView.frame.size.height);
             
             textFiled.textColor= [UIColor darkGrayColor];
             
             [cell.contentView addSubview:textFiled];

         }
        
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

-(void)changeGendenle:(UIButton*)btn{
    
    self.lastBtn.selected = NO;
    [btn setSelected:YES];
    
    self.lastBtn = btn;
    
    
    
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
        
        
        if (_callbackClick) {
            _callbackClick(YES);
            
        }
        
        [self.navigationController popViewControllerAnimated:YES];
        

   
     
        
        
        
    }
    
    
}


@end
