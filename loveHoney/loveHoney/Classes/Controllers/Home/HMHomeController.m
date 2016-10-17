//
//  HMHomeController.m
//  loveHoney
//
//  Created by hebing on 16/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMHomeController.h"
#import "HMUpCell.h"
#import "HMDownCell.h"
//#import "HMVerticalTitleButton.h"
#import "HMVerticalButton.h"
#import "HMFocusModel.h"
#import "HMIconsModel.h"

@interface HMHomeController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak)SDCycleScrollView*cycleScrollView;
@property (nonatomic,weak)UITableView *tableView;
@property (nonatomic,strong) NSArray *modelArr;
@property (nonatomic,strong)NSArray *modelArray;

@property (nonatomic,weak)UIView*HDView;

@end

@implementation HMHomeController


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor=[UIColor blueColor];
    
    [self setupTableView];
    
    
}

- (void)setupTableView{
    
    UITableView *tableView = [[UITableView alloc] init];
    self.tableView = tableView;
    self.view = tableView;
    
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
//    self.tableView.backgroundColor = [UIColor redColor];
    [self.tableView registerClass:[HMUpCell class] forCellReuseIdentifier:@"upcell"];
    [self.tableView registerClass:[HMDownCell class] forCellReuseIdentifier:@"cell"];

    
    [self setupScroll];
    
}



- (void)setupScroll{
    
    UIView *HDView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 250)];
    self.HDView = HDView;
    
    self.tableView.tableHeaderView = HDView;
    
    
    //轮播器模块
    
    [HMFocusModel focusModelWithSuccess:^(NSArray<HMFocusModel *> *arr) {
        self.modelArr = arr;
        NSMutableArray* temData = [NSMutableArray new];
        
        
        CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150);
        
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage:[UIImage imageNamed:@"grey1"]];
        [arr enumerateObjectsUsingBlock:^(HMFocusModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [temData addObject:obj.img];
            
        }];
        self.cycleScrollView.imageURLStringsGroup = temData;
        
        //        self.cycleScrollView.imageURLStringsGroup = arr;
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"v2_home_cycle_dot_selected"];
        cycleScrollView.pageDotImage = [UIImage imageNamed:@"v2_home_cycle_dot_normal"];
        
        
        [self.HDView addSubview:cycleScrollView];
        
        
    } error:^{
        
    }];
    

    
    
//    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150);
//    
//    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage:[UIImage imageNamed:@"grey1"]];
//    
//    
////    self.cycleScrollView.imageURLStringsGroup = arr;
//    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
//    cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"v2_home_cycle_dot_selected"];
//    cycleScrollView.pageDotImage = [UIImage imageNamed:@"v2_home_cycle_dot_normal"];
//    
//    
//    [self.tableView.tableHeaderView addSubview:cycleScrollView];
//    NSString *img1 = @"http://i3.download.fd.pchome.net/t_960x600/g1/M00/07/09/oYYBAFMv8q2IQHunACi90oB0OHIAABbUQAAXO4AKL3q706.jpg";
//    NSString *img2 = @"http://images.weiphone.net/attachments/photo/Day_120308/118871_91f6133116504086ed1b82e0eb951.jpg";
//    NSString *img3 = @"http://benyouhuifile.it168.com/forum/macos/attachments/month_1104/110425215921926a173e0f728e.jpg";
//    NSString *img4 = @"http://benyouhuifile.it168.com/forum/macos/attachments/month_1104/1104241737046031b3a754f783.jpg";
//    NSString *img5 = @"http://2b.zol-img.com.cn/product/68/951/cerUrKWCmHCnU.jpg";
//    
//    NSMutableArray *imageURLStrings = [NSMutableArray array];
//    [imageURLStrings addObject:img1];
//    [imageURLStrings addObject:img2];
//    [imageURLStrings addObject:img3];
//    [imageURLStrings addObject:img4];
//    [imageURLStrings addObject:img5];
//      cycleScrollView.imageURLStringsGroup = imageURLStrings;
 
    
   [HMIconsModel iconsModelWithSuccess:^(NSArray<HMIconsModel *> *arr) {
       
       self.modelArray = arr;
       
       UIView *BtnView = [[UIView alloc] initWithFrame:CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, 100)];
       BtnView.backgroundColor = [UIColor redColor];
       [HDView addSubview:BtnView];
       CGFloat btnW = [UIScreen mainScreen].bounds.size.width / 4;
       
       NSArray* butTitleAry = @[
                                @"",
                                @"",
                                @"",
                                @""
                                ];
       for (int i = 0; i<4; i++) {
           
           HMVerticalButton *btn = [[HMVerticalButton alloc] initWithFrame:CGRectMake(i*btnW, 0, btnW, BtnView.size.height)];
           [btn setImage:[UIImage imageNamed:@"icon_icons_holder"] forState:UIControlStateNormal];
           
           [btn setTitle:butTitleAry[i] forState:UIControlStateNormal];
           
           btn.backgroundColor = [UIColor cyanColor];
           [BtnView addSubview:btn];
       }

       
   } error:^{
       
   }];
    
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0)
    {
        return 4;
    }
        return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if (indexPath.section == 0) {
          cell = [tableView dequeueReusableCellWithIdentifier:@"upcell" forIndexPath:indexPath];
            return cell;
    }
    if (indexPath.section == 1) {
         cell= [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        return cell;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0){
        return 100;
    }
    return 100;
}


@end
