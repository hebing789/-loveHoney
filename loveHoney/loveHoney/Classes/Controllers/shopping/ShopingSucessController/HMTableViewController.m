//
//  HMTableViewController.m
//  loveHoney
//
//  Created by gaojie on 16/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMTableViewController.h"
#import "HMTableViewCell.h"
#import "HMShoping1TableViewCell.h"
#import "HMShoping2TableViewCell.h"
#import "HMTableShoping3ViewCell.h"
#import "HMShoping4TableViewCell.h"
#import "HMPayTableViewController.h"
#define KeyWindow     [UIApplication sharedApplication].keyWindow
@interface HMTableViewController ()
@property(nonatomic,weak)UIButton *button;
@property(nonatomic,weak)UILabel *lab;
@end

@implementation HMTableViewController
- (void)viewWillAppear:(BOOL)animated{

    UIButton *selectBtn = [[UIButton alloc]init];
    self.button = selectBtn;
    [selectBtn setEnabled:YES];
    [selectBtn setTitle:@"选好了" forState:UIControlStateNormal];
    [self.tableView.tableFooterView bringSubviewToFront:selectBtn];
    [selectBtn setBackgroundImage:[UIImage imageNamed:@"v2_coupon_verify_normal"] forState:UIControlStateNormal];
    [selectBtn setBackgroundImage:[UIImage imageNamed:@"v2_coupon_verify_selected"] forState:UIControlStateSelected];
    [selectBtn addTarget:self action:@selector(clickSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
    //     [self.tableView.tableFooterView addSubview:selectBtn];
    //    self.tableView.tableFooterView.userInteractionEnabled = YES;
    [KeyWindow  addSubview:selectBtn];
    
    
    UILabel *lable = [[UILabel alloc]init];
    [KeyWindow addSubview:lable];
    self.lab = lable;
    //    lable.layer.borderWidth = 1;
    //    lable.layer.backgroundColor = (__bridge CGColorRef _Nullable)([UIColor blueColor]);
    lable.text = @"$9.9";
    lable.textColor = [UIColor redColor];
    [lable  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        
        make.bottom.mas_equalTo(KeyWindow.mas_bottom).offset(-20);
        
        make.left.mas_equalTo(KeyWindow.mas_left).offset(5);
        make.right.mas_equalTo(selectBtn.mas_left );
        make.height.mas_equalTo(50);
        
        //make.width.mas_equalTo(screemW * 1/4);
        
    }];
    
    
    //    UIView* view = [[UIView alloc]init];
    //    view.frame = CGRectMake(0, 0, screemW, screemH);
    //
    //    view.alpha = 0.8;
    //    [self.view addSubview:view];
    //    [self.view bringSubviewToFront:view];
    //    [view addSubview:selectBtn];
    
    
    [selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        
        make.bottom.mas_equalTo(KeyWindow.mas_bottom).offset(-20);
        
        make.right.mas_equalTo(KeyWindow.mas_left).offset(screemW);
        
        make.height.mas_equalTo(50);
        
        make.width.mas_equalTo(80);
        
    }];



}

- (void)viewDidLoad {
    [super viewDidLoad];
    
       self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"v2_goback"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(ClickBtn:)];
    //self.view.backgroundColor = [UIColor grayColor];
    
    UINib* nib1= [UINib nibWithNibName:@"HMTableViewCell" bundle:nil];
    UINib* nib2= [UINib nibWithNibName:@"HMShoping1TableViewCell" bundle:nil];
    UINib* nib3= [UINib nibWithNibName:@"HMShoping2TableViewCell" bundle:nil];
    UINib* nib4= [UINib nibWithNibName:@"HMTableShoping3ViewCell" bundle:nil];
    UINib* nib5= [UINib nibWithNibName:@"HMShoping4TableViewCell" bundle:nil];
    [self.tableView registerNib:nib1 forCellReuseIdentifier:@"cell0"];
    [self.tableView registerNib:nib2 forCellReuseIdentifier:@"cell1"];
    [self.tableView registerNib:nib3 forCellReuseIdentifier:@"cell2"];
    [self.tableView registerNib:nib4 forCellReuseIdentifier:@"cell3"];
    [self.tableView registerNib:nib5 forCellReuseIdentifier:@"cell4"];
   
    UIView* footView=[[UIView alloc]init];
    self.tableView.tableFooterView = footView;
    footView.backgroundColor = [UIColor whiteColor];
//    [self.tableView.tableFooterView setUserInteractionEnabled:NO];
    //self.tableView.tableFooterView.backgroundColor = [UIColor grayColor];
//    UIButton *selectBtn = [[UIButton alloc]init];
//    self.button = selectBtn;
//    [selectBtn setEnabled:YES];
//    [selectBtn setTitle:@"选好了" forState:UIControlStateNormal];
//    [self.tableView.tableFooterView bringSubviewToFront:selectBtn];
//    [selectBtn setBackgroundImage:[UIImage imageNamed:@"v2_coupon_verify_normal"] forState:UIControlStateNormal];
//   [selectBtn setBackgroundImage:[UIImage imageNamed:@"v2_coupon_verify_selected"] forState:UIControlStateSelected];
//    [selectBtn addTarget:self action:@selector(clickSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
////     [self.tableView.tableFooterView addSubview:selectBtn];
////    self.tableView.tableFooterView.userInteractionEnabled = YES;
//    [KeyWindow  addSubview:selectBtn];
//    
//
//     UILabel *lable = [[UILabel alloc]init];
//    [KeyWindow addSubview:lable];
//    self.lab = lable;
////    lable.layer.borderWidth = 1;
////    lable.layer.backgroundColor = (__bridge CGColorRef _Nullable)([UIColor blueColor]);
//    lable.text = @"$9.9";
//    lable.textColor = [UIColor redColor];
//    [lable  mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        
//        
//        make.bottom.mas_equalTo(KeyWindow.mas_bottom).offset(-20);
//        
//        make.left.mas_equalTo(KeyWindow.mas_left).offset(5);
//        make.right.mas_equalTo(selectBtn.mas_left );
//        make.height.mas_equalTo(50);
//        
//        //make.width.mas_equalTo(screemW * 1/4);
//        
//    }];
//    
//    
////    UIView* view = [[UIView alloc]init];
////    view.frame = CGRectMake(0, 0, screemW, screemH);
////    
////    view.alpha = 0.8;
////    [self.view addSubview:view];
////    [self.view bringSubviewToFront:view];
////    [view addSubview:selectBtn];
//    
//    
//    [selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        
//        
//        make.bottom.mas_equalTo(KeyWindow.mas_bottom).offset(-20);
//        
//        make.right.mas_equalTo(KeyWindow.mas_left).offset(screemW);
//        
//        make.height.mas_equalTo(50);
//        
//        make.width.mas_equalTo(80);
//        
//    }];
    
    
    
    
    
}

//选好了按钮的点击事件
- (void)clickSelectBtn:(UIButton *)btn{


    NSLog(@"点击选好了按钮点击事件");
    [self.navigationController pushViewController:[[HMPayTableViewController alloc]init] animated:YES];



}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell ;
    if (indexPath.row == 0 ) {
         HMTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell0" forIndexPath:indexPath];
        cell = cell1;

//
   }
    if (indexPath.row == 1 ) {
         HMShoping1TableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        cell = cell2;
  
        
    }
    if (indexPath.row == 2 ) {
         HMShoping2TableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
        cell = cell3;
        
    }
    if (indexPath.row == 3 ) {
        HMTableShoping3ViewCell *cell4 = [tableView dequeueReusableCellWithIdentifier:@"cell3" forIndexPath:indexPath];
        cell = cell4;
    }
    if (indexPath.row == 4 ) {
       HMShoping4TableViewCell *cell5 = [tableView dequeueReusableCellWithIdentifier:@"cell4" forIndexPath:indexPath];
        cell = cell5;

        
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row ==0) {
        return 110;
        
    }else{
    
        return 80;
    
    }
    
    
    }


- (void)viewWillDisappear:(BOOL)animated{
    
    [self.button removeFromSuperview];

    [self.lab removeFromSuperview];

}

//按钮点击事件
- (void)ClickBtn:(UIButton *)btn
{
    
    //    NSLog(@"点击逛逛按钮");
    //[self.navigationController pushViewController:[[HMTableViewController alloc]init] animated:YES];
    [self dismissViewControllerAnimated:YES completion:^{
        
       
    }];
    
}


@end
