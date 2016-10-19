//
//  HMPayTableViewController.m
//  loveHoney
//
//  Created by gaojie on 16/10/17.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMPayTableViewController.h"
#import "HMPayTableViewCell.h"
#import "HMPay1TableViewCell.h"
#import "HMPay2TableViewCell.h"
#import "HMPay3TableViewCell.h"
#import "HMPay4TableViewCell.h"
#import "HMPay5TableViewCell.h"


#define KeyWindow  [UIApplication sharedApplication].keyWindow
@interface HMPayTableViewController ()
@property(nonatomic,weak)UIButton *button;
@property(nonatomic,weak)UILabel *lab;
@property(nonatomic,strong)NSMutableArray* dataAryTitle;

@property(nonatomic,strong)NSMutableArray* dataAryImg;

@property(nonatomic,weak)UIButton *lastBtn;
@end

@implementation HMPayTableViewController

-(instancetype)init{
    
    return [super initWithStyle:UITableViewStyleGrouped];
}
- (void)viewWillAppear:(BOOL)animated{
    
    UIButton *sureBtn = [[UIButton alloc]init];
    self.button = sureBtn;
    [sureBtn setEnabled:YES];
    [sureBtn setTitle:@"确认付款" forState:UIControlStateNormal];
    [self.tableView.tableFooterView bringSubviewToFront:sureBtn];
    [sureBtn setBackgroundImage:[UIImage imageNamed:@"v2_coupon_verify_normal"] forState:UIControlStateNormal];
    [sureBtn setBackgroundImage:[UIImage imageNamed:@"v2_coupon_verify_selected"] forState:UIControlStateSelected];
    [sureBtn addTarget:self action:@selector(clickSureBtn:) forControlEvents:UIControlEventTouchUpInside];
    //     [self.tableView.tableFooterView addSubview:selectBtn];
    //    self.tableView.tableFooterView.userInteractionEnabled = YES;
    KeyWindow.backgroundColor = [UIColor whiteColor];
    [KeyWindow  addSubview:sureBtn];
    
    
    UILabel *lable = [[UILabel alloc]init];
    [KeyWindow addSubview:lable];
    self.lab = lable;
    //    lable.layer.borderWidth = 1;
    //    lable.layer.backgroundColor = (__bridge CGColorRef _Nullable)([UIColor blueColor]);
    lable.text = @"实付金额$9.9";
    lable.textColor = [UIColor redColor];
    [lable  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        
        make.bottom.mas_equalTo(KeyWindow.mas_bottom).offset(-20);
        
        make.left.mas_equalTo(KeyWindow.mas_left).offset(5);
        make.right.mas_equalTo(sureBtn.mas_left );
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
    
    
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        
        make.bottom.mas_equalTo(KeyWindow.mas_bottom).offset(-20);
        
        make.right.mas_equalTo(KeyWindow.mas_left).offset(screemW);
        
        make.height.mas_equalTo(50);
        
        make.width.mas_equalTo(80);
        
    }];
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *nib1 = [UINib nibWithNibName:@"HMPayTableViewCell" bundle:nil];
    [self.tableView registerNib:nib1 forCellReuseIdentifier:@"paycell0"];
    UINib *nib2 = [UINib nibWithNibName:@"HMPay1TableViewCell" bundle:nil];
    [self.tableView registerNib:nib2 forCellReuseIdentifier:@"paycell1"];
    UINib *nib3 = [UINib nibWithNibName:@"HMPay2TableViewCell" bundle:nil];
    [self.tableView registerNib:nib3 forCellReuseIdentifier:@"paycell2"];
    UINib *nib4 = [UINib nibWithNibName:@"HMPay3TableViewCell" bundle:nil];
    [self.tableView registerNib:nib4 forCellReuseIdentifier:@"paycell3"];
    UINib *nib5 = [UINib nibWithNibName:@"HMPay4TableViewCell" bundle:nil];
    [self.tableView registerNib:nib5 forCellReuseIdentifier:@"paycell4"];
    UINib *nib6 = [UINib nibWithNibName:@"HMPay5TableViewCell" bundle:nil];
    [self.tableView registerNib:nib6 forCellReuseIdentifier:@"paycell5"];
   
    //设置组View的背景颜色
    
    UIView* footView=[[UIView alloc]init];
    self.tableView.tableFooterView = footView;
    //footView.backgroundColor = [UIColor whiteColor];
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 0;
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    if(section == 0){
        return 1;
    }
    if(section == 1){
        return 4;
    }
    if(section == 2){
        return 2;
    }
    return 1;
}

-(NSMutableArray *)dataAryImg{
    
    if (_dataAryImg==nil) {
        _dataAryImg = [NSMutableArray arrayWithObjects:@"v2_weixin",@"icon_qq",@"zhifubao",@"v2_dao", nil];
    }
    return _dataAryImg;
}

-(NSMutableArray *)dataAryTitle{
    
    if (_dataAryTitle ==nil) {
        _dataAryTitle = [NSMutableArray arrayWithObjects:@"微信支付",@"QQ钱包",@"支付宝支付",@"货到付款", nil];
    }
 
    return _dataAryTitle;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if(indexPath.section == 0){
        HMPayTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"paycell0" forIndexPath:indexPath];
        cell = cell1;
    
    }
    if (indexPath.section == 1) {
         HMPay1TableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"paycell1" forIndexPath:indexPath];
        
        cell2.title= self.dataAryTitle[indexPath.row];
        cell2.img = self.dataAryImg[indexPath.row];
        
        [cell2 setCallback:^(UIButton *btn) {
            self.lastBtn.selected =NO;
            
            btn.selected = YES;
            
            self.lastBtn = btn;
            
        }];
        
        cell = cell2;
    }
//    if (indexPath.section == 2) {
//        HMPay2TableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:@"paycell2" forIndexPath:indexPath];
//        cell = cell3;
//    }
    if (indexPath.section == 2) {
        HMPay3TableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:@"paycell3" forIndexPath:indexPath];
        cell = cell3;

    }
    if (indexPath.section == 3) {
        HMPay4TableViewCell *cell4 = [tableView dequeueReusableCellWithIdentifier:@"paycell4" forIndexPath:indexPath];
        cell = cell4;
        
    }
    if (indexPath.section == 4) {
        HMPay5TableViewCell *cell5 = [tableView dequeueReusableCellWithIdentifier:@"paycell5" forIndexPath:indexPath];
        cell = cell5;
        
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 2) {
        return 80;
    }

    if (indexPath.section == 4) {
        return 100;
    }
    return 50;


}
//设置头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    if(section == 1){

      return @"选择返款方式";
    }
    if(section == 2){
    
    return @"精选商品";
    
    }
    if(section == 4){
    
        return @"费用明细";
        
    }else{
    
    return @"";
        
    }
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//
//    UIView *view = [[UIView alloc]init];
//
//    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//    lable.text = @"国际品牌";
//    [view addSubview:lable];
//    return view;
//
//}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//点击确认按钮确认支付
- (void)clickSureBtn:(UIButton *)btn{

    NSLog(@"点击确认按钮");

}
- (void)viewWillDisappear:(BOOL)animated
{

    [self.button removeFromSuperview];
    
    [self.lab removeFromSuperview];


}
@end
