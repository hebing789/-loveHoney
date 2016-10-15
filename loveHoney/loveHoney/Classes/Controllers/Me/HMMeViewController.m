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
    
    NSLog(@"设置页面");
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
