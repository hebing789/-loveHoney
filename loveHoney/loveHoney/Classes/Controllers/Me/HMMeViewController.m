//
//  HMMeViewController.m
//  loveHoney
//
//  Created by hebing on 16/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMMeViewController.h"
#import "HMMeTableViewCell1.h"
#import "HMMenuTableViewCell2.h"

#import "HMSettingController.h"

#import "HMAddressController.h"
#import "HMStoreController.h"
#import "HMSharedController.h"
#import "HMCustomerController.h"
#import "HMHelpController.h"


static NSString* cellMenu=@"HMMeNuViewControllerCell1";
static NSString* cellMe=@"HMMeViewControllerCell2";
@interface HMMeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)NSArray* dataAry;


@end

@implementation HMMeViewController
-(NSArray*)dataAry{
    if (_dataAry==nil) {
        
        
        _dataAry=@[
                   
                   //1
                   @[
                       //2行
                   @[@{@"icon":@"v2_my_address_icon",
                   
                     @"message":@"我的收货地址"}],
                        @[@{@"icon":@"icon_mystore",
                                                
                    @"message":@"我的店铺"}],
                   ],
                   
                   
                   //2
                   
                  @[
                       //1行
                       @[@{@"icon":@"v2_my_share_icon",
                     
                     @"message":@"把爱鲜蜂分享给朋友"}]
                     ],
                   
                   @[
                       //2行
                   @[@{@"icon":@"v2_my_serviceonline_icon",
                     
                     @"message":@"客服帮忙"}],
                   
                   
                   
                   //3组
                   @[@{@"icon":@"v2_my_feedback_icon",
                     
                     @"message":@"意见反馈"}]
                   ]
                   
                     ];

       
    }
    return _dataAry;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setHeadUI];
    
    
    
    
}



-(void)setHeadUI{
    //背景图片
    UIImageView* headBackImgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"v2_my_avatar_bg" ]];
    headBackImgView.userInteractionEnabled =YES;
    headBackImgView.frame=CGRectMake(0, 0, screemW, 140);
    [self.view addSubview:headBackImgView];
    
    //设置
    UIButton * setBut=[[UIButton alloc]init];
    
    [setBut setImage:[UIImage imageNamed:@"v2_my_settings_icon"] forState:UIControlStateNormal];
    [setBut sizeToFit];
     [headBackImgView addSubview:setBut];
    [setBut addTarget:self action:@selector(toSetting) forControlEvents:UIControlEventTouchUpInside];
    [setBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(headBackImgView.mas_right).offset(-5);
        make.top.equalTo(headBackImgView.mas_top).offset(20);
    }];
    
    
    
    //头像
    UIImageView* iconImgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"v2_my_avatar" ]];
    
    iconImgView.center= CGPointMake(screemW/2, iconImgView.frame.size.width/2+20);
    [headBackImgView addSubview:iconImgView];
    
    //手机号码;
    
    UILabel* phoneLable=[[UILabel alloc]init];
    
    phoneLable.text=@"18653235135";
    phoneLable.textColor=[UIColor whiteColor];
    [phoneLable sizeToFit];
    
    phoneLable.center = CGPointMake(screemW/2, CGRectGetMaxY(iconImgView.frame)+phoneLable.frame.size.height/2+5);
    
    [headBackImgView addSubview:phoneLable];
    
    UITableView* tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(headBackImgView.frame)-32, screemW, screemH - CGRectGetMaxY(headBackImgView.frame)) style:UITableViewStyleGrouped];
    
    self.tableView = tableView;
    

    tableView.sectionHeaderHeight=5;
    tableView.sectionFooterHeight=0;
    
    UINib * nibMenu=[UINib nibWithNibName:@"HMMenuTableViewCell2" bundle:nil];
    UINib * nibMe=[UINib nibWithNibName:@"HMMeTableViewCell1" bundle:nil];
    
    [self.tableView registerNib:nibMenu forCellReuseIdentifier:cellMenu];
    [self.tableView registerNib:nibMe forCellReuseIdentifier:cellMe];
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cell1];
    
//    tableView.backgroundColor=[UIColor redColor];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.tableFooterView=[UIView new];
    [self.view addSubview:tableView];
    
    [self.view bringSubviewToFront:headBackImgView];

    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
//    return 4;
    return self.dataAry.count+1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    
//        if (section == 0 ||section == 2) {
//            return 1;
//        }else{
//            return 2;
//        }
    if(section ==0){
        return 1;
    }
    NSArray* temAry=self.dataAry[section -1 ];
    return temAry.count;
    

}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell;
    if (indexPath.section ==0) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellMenu forIndexPath:indexPath];
    }else{
        HMMeTableViewCell1*cell = [tableView dequeueReusableCellWithIdentifier:cellMe forIndexPath:indexPath];
        
        
          NSArray* temAry=self.dataAry[indexPath.section -1 ];
        
       NSArray* temAry2= temAry[indexPath.item];

        cell.dataAry=temAry2.firstObject;
        
        return cell;
    }
    
    
    
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 80;
    }
    
    return 50;
}


-(void)toSetting{
    
//    NSLog(@"设置页面");
    
    HMSettingController* set = [[HMSettingController alloc]init];
    
    set.navigationItem.title = @"设置";
    
    [self.navigationController pushViewController:set animated:YES];
    
    
    
    
}

//跳转页面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0 ){
        return;
    }
    
    if (indexPath.section ==1) {
        if (indexPath.row==0) {
            HMAddressController* addres = [[HMAddressController alloc]init];
            addres.navigationItem.title = @"我的收货地址";
            [self.navigationController pushViewController:addres animated:YES];
            
            
        }else{
            
            HMStoreController* store = [[HMStoreController alloc]init];
            store.navigationItem.title = @"我的店铺";
            [self.navigationController pushViewController:store animated:YES];
            

            
        }
        
        
    }
    if (indexPath.section ==2) {
        
        //先跳出弹窗,然后再跳转页面;
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"分享到" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction* action1 = [UIAlertAction actionWithTitle:@"微信好友" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            HMSharedController* shared = [[HMSharedController alloc]init];
            shared.navigationItem.title = @"微信登录";
            [self.navigationController pushViewController:shared animated:YES];
        }];
        
        [alert addAction:action1];
        
        
        
        UIAlertAction* action2 = [UIAlertAction actionWithTitle:@"微信朋友圈" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            HMSharedController* shared = [[HMSharedController alloc]init];
            shared.navigationItem.title = @"微信朋友圈";
            [self.navigationController pushViewController:shared animated:YES];
        }];
        
        [alert addAction:action2];
        
        
        
        UIAlertAction* action3 = [UIAlertAction actionWithTitle:@"新浪微博" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            HMSharedController* shared = [[HMSharedController alloc]init];
            shared.navigationItem.title = @"微博登录";
            [self.navigationController pushViewController:shared animated:YES];
        }];
        
        [alert addAction:action3];
        
        
        UIAlertAction* action4 = [UIAlertAction actionWithTitle:@"QQ空间" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            HMSharedController* shared = [[HMSharedController alloc]init];
            shared.navigationItem.title = @"QQ空间";
            [self.navigationController pushViewController:shared animated:YES];
        }];
        
        [alert addAction:action4];
        
        UIAlertAction* action5 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
           
        }];
        
        [alert addAction:action5];

        
        
        [self presentViewController:alert animated:YES completion:^{
            
        }];
        
        
    }
    if (indexPath.section ==3) {
        if (indexPath.row==0) {
            
            HMCustomerController* customer = [[HMCustomerController alloc]init];
            
            customer.navigationItem.title = @"客服帮助";
            
            [self.navigationController pushViewController:customer animated:YES];
            
            
            
        }else{
            
            HMHelpController* help = [[HMHelpController alloc]init];
            
            help.navigationItem.title = @"意见反馈";
            
            [self.navigationController pushViewController:help animated:YES];

        }

        
        
    }
    
    
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
        self.navigationController.navigationBar.hidden = NO;
    [super viewWillDisappear:YES];
}

@end
