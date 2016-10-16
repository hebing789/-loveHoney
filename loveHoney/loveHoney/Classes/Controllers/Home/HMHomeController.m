//
//  HMHomeController.m
//  loveHoney
//
//  Created by hebing on 16/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMHomeController.h"
#import "HMUpCell.h"

@interface HMHomeController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak)UITableView *tableView;

@end

@implementation HMHomeController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor blueColor];
    
    [self.tableView registerClass:[HMUpCell class] forCellReuseIdentifier:@"upcell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self setupTableView];
}

- (void)setupTableView{
    
    UITableView *tableView = [[UITableView alloc] init];
    self.tableView = tableView;
    self.view = tableView;
    
    
    [self setupScroll];
    
}



- (void)setupScroll{
    //轮播器模块
    
    UIView *HDView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 250)];
    self.tableView.tableHeaderView = HDView;
    
    
    
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150);
    
    NSString *img1 = @"http://i3.download.fd.pchome.net/t_960x600/g1/M00/07/09/oYYBAFMv8q2IQHunACi90oB0OHIAABbUQAAXO4AKL3q706.jpg";
    NSString *img2 = @"http://images.weiphone.net/attachments/photo/Day_120308/118871_91f6133116504086ed1b82e0eb951.jpg";
    NSString *img3 = @"http://benyouhuifile.it168.com/forum/macos/attachments/month_1104/110425215921926a173e0f728e.jpg";
    NSString *img4 = @"http://benyouhuifile.it168.com/forum/macos/attachments/month_1104/1104241737046031b3a754f783.jpg";
    NSString *img5 = @"http://2b.zol-img.com.cn/product/68/951/cerUrKWCmHCnU.jpg";
    
    NSMutableArray *imageURLStrings = [NSMutableArray array];
    [imageURLStrings addObject:img1];
    [imageURLStrings addObject:img2];
    [imageURLStrings addObject:img3];
    [imageURLStrings addObject:img4];
    [imageURLStrings addObject:img5];
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage:[UIImage imageNamed:@"grey1"]];
    cycleScrollView.imageURLStringsGroup = imageURLStrings;
    
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"v2_home_cycle_dot_selected"];
    cycleScrollView.pageDotImage = [UIImage imageNamed:@"v2_home_cycle_dot_normal"];
    
    
    [HDView addSubview:cycleScrollView];
    
    
    UIView *BtnView = [[UIView alloc] initWithFrame:CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, 100)];
    BtnView.backgroundColor = [UIColor redColor];
    [HDView addSubview:BtnView];
    
    for (int i; i<4; i++) {
        CGFloat btnW = [UIScreen mainScreen].bounds.size.width / 4;
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i*btnW, 0, btnW, BtnView.size.height)];
        btn.backgroundColor = [UIColor cyanColor];
        [BtnView addSubview:btn];
    }
    
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
    if (indexPath.section == 0) {
          HMUpCell *cell = [tableView dequeueReusableCellWithIdentifier:@"upcell" forIndexPath:indexPath];
            return cell;
    }
    if (indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        return cell;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0){
        return 200;
    }
    return 100;
}


@end
