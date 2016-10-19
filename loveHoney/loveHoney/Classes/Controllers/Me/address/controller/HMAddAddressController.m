//
//  HMAddAddressController.m
//  loveHoney
//
//  Created by hebing on 16/10/17.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMAddAddressController.h"
#import "HMAddresModel.h"
static NSString* cellId = @"HMAddAddressControllerCell1";
@interface HMAddAddressController ()
@property(nonatomic,weak)UIButton* lastBtn;

//由于要传值,storyBoard需要连线, 这个位置需要设置属性
@property(nonatomic,weak)UITextField* textFiled0;
@property(nonatomic,weak)UITextField* textFiled2;
@property(nonatomic,weak)UITextField* textFiled3;
@property(nonatomic,weak)UITextField* textFiled4;
@property(nonatomic,weak)UITextField* textFiled5;

@property(nonatomic,strong)HMAddresModel* model;
@end

@implementation HMAddAddressController
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

////没效果
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:YES];
//        [self.textFiled0 becomeFirstResponder];
//}

-(void)save{
    
    
    
    

    
    self.model = [HMAddresModel new];
    self.model.accept_name = self.textFiled0.text;
    //字符串转成nsnuber;
    self.model.telphone = [NSNumber numberWithInteger:[self.textFiled2.text integerValue]];
    self.model.province_name = self.textFiled3.text;
    self.model.addr_for_dealer = self.textFiled4.text;
    self.model.address = self.textFiled5.text;
    
    if (self.model.accept_name.length ==0 ) {
        
            [SVProgressHUD setBackgroundColor:[UIColor darkGrayColor]];
        [SVProgressHUD showImage:[[UIImage imageNamed:@"v2_orderSuccess"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] status:@"我们需要你的大名"];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [SVProgressHUD dismiss];
            
            
        });
        
        return;
    }
    
    //默认有一个数字是0
    //法1
//    if ([NSString stringWithFormat:@"%ld",(long)[self.model.telphone integerValue]].length==0||[NSString stringWithFormat:@"%ld",(long)[self.model.telphone integerValue]].length==1) {
    //法2
        if ([[NSString stringWithFormat:@"%ld",(long)[self.model.telphone integerValue]] isEqualToString:@"0"]) {
        
        [SVProgressHUD showImage:[[UIImage imageNamed:@"v2_orderSuccess"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] status:@"我们需要你的手机号"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [SVProgressHUD dismiss];
            
            
        });
        return;
    }
   
    if (self.model.address.length ==0 ) {
        
        [SVProgressHUD setBackgroundColor:[UIColor darkGrayColor]];
        [SVProgressHUD showImage:[[UIImage imageNamed:@"v2_orderSuccess"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] status:@"我们需要你的详细地址"];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [SVProgressHUD dismiss];
            
            
        });
        
        return;
    }
    if (_callbackClick) {
        _callbackClick(self.model);
        
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
 
        return 6;
  
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    if (indexPath.section==0) {
        UITextField* textFiled = [[UITextField alloc]init];
        
        //        lab.x = 150;
        //        lab.y = 0;
        
        
        if(indexPath.row ==0){
            cell.textLabel.text = @"联系人";
            textFiled.placeholder = @"收货人姓名";
            self.textFiled0 = textFiled;
//            //会有一个白一下的效果
//                [self.textFiled0 becomeFirstResponder];
            
            
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
            textFiled.keyboardType = UIKeyboardTypePhonePad;
            textFiled.placeholder=@"鲜蜂侠联系你的电话";
        
        }else if (indexPath.row ==3){
            self.textFiled3 = textFiled;
            cell.textLabel.text = @"所在城市";
            textFiled.placeholder = @"请选择城市";
            
        }else if (indexPath.row ==4){
            self.textFiled4 = textFiled;
            cell.textLabel.text = @"所在地区";
            textFiled.placeholder = @"请选择你的住宅,大厦或学校";
            
        }else if (indexPath.row ==5){
            
            self.textFiled5 = textFiled;
            cell.textLabel.text = @"详细地址";
            textFiled.placeholder = @"请输入楼号门牌号等详细信息";
        }
        
        if (indexPath.row !=1){
            [textFiled sizeToFit];
            textFiled.frame = CGRectMake(120, 0, textFiled.frame.size.width, cell.contentView.frame.size.height);
           
            textFiled.textColor= [UIColor darkGrayColor];
            
            [cell.contentView addSubview:textFiled];
            //这样写的没效果
//            textFiled.layer.borderWidth =1;
//            textFiled.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor darkGrayColor]);
//            //这句话有效果,由于字体个数变动,不设置这个否则太丑
//            [textFiled setBorderStyle:UITextBorderStyleRoundedRect];
//            
        }
        
        cell.textLabel.textColor = [UIColor darkGrayColor];
        
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
        
        
        
    }
    
    
}


@end
