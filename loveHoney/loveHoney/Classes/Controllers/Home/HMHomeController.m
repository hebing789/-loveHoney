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
#import "HMActivitiesModel.h"
#import "HMFreshShopModel.h"
#import "HMWebViewController.h"

@interface HMHomeController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak)SDCycleScrollView*cycleScrollView;

@property (nonatomic,weak)UITableView *tableView;

//图片轮播数据
@property (nonatomic,strong) NSArray *focusArr;

//btn数据
@property (nonatomic,strong)NSMutableArray *iconsArr;
///btn下面的数据//年货图片数据
@property (nonatomic,strong)NSArray *cellModelArr;

//collctionvew的数据
@property(nonatomic,strong)NSMutableArray* dataAry;

@property (nonatomic,weak)UIView*HDView;

@property(nonatomic,strong)NSArray* btnDataAry;

@end

@implementation HMHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self setupScrollAndBtn];
    
    [self getFocusVideoAry];
    
    [self getBtnData];
    
    [self getShoppingAry];
    
//      [self getDATA];
    


    
 
    
    NSArray* idleImages= @[
                           [UIImage imageNamed:@"v2_pullRefresh1"],
                           [UIImage imageNamed:@"v2_pullRefresh2"]
    
                           ];
    
    NSArray* pullingImages= @[
                              [UIImage imageNamed:@"v2_pullRefresh1"],
                              [UIImage imageNamed:@"v2_pullRefresh2"]
                           ];
    
    NSArray* refreshingImages= @[
                                 [UIImage imageNamed:@"v2_pullRefresh1"],
                                 [UIImage imageNamed:@"v2_pullRefresh2"]
                           ];
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(getFreshData)];
    // 设置普通状态的动画图片
    [header setImages:idleImages forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [header setImages:pullingImages forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
    // 设置header
    self.tableView.mj_header = header;
  
////    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
////
////    // 隐藏状态
//    header.stateLabel.hidden = YES;
    // 马上进入刷新状态
    [self.tableView.header beginRefreshing];
    
    // 设置文字
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松手开始刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"正在刷新" forState:MJRefreshStateRefreshing];
    
    // 设置字体
    header.stateLabel.font = [UIFont systemFontOfSize:15];
    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
    
    // 设置颜色
    header.stateLabel.textColor = [UIColor darkGrayColor];
    header.lastUpdatedTimeLabel.textColor = [UIColor blueColor];
}


-(void)getFreshData{
    
    [self getFocusVideoAry];
    
    [self getBtnData];
    
    [self getShoppingAry];
    

    
    
    
}

//年货图片数据刷新
-(void)setCellModelArr:(NSArray *)cellModelArr{
    
    _cellModelArr =cellModelArr;
    [self.tableView reloadData];
    [self.tableView.header endRefreshing];

}

//年货图片数据tableView
-(void)getShoppingAry{
    
    [HMActivitiesModel activitiesModelWithSuccess:^(NSArray<HMActivitiesModel *> *arr) {
    
    self.cellModelArr = arr;
        
        [self.tableView.header endRefreshing];

    
    
    
} error:^{
    
}];
    
}

//轮播数据
-(void)getFocusVideoAry{
    
    [HMFocusModel focusModelWithSuccess:^(NSArray<HMFocusModel *> *arr) {
        self.focusArr = arr;
        NSMutableArray* temData = [NSMutableArray new];
        [arr enumerateObjectsUsingBlock:^(HMFocusModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [temData addObject:obj.img];
            
        }];
        //图片轮播网络数据加载
        self.cycleScrollView.imageURLStringsGroup = temData;
        
    } error:^{
        
    }];
}

-(void)getBtnData{
    
    
    [HMIconsModel iconsModelWithSuccess:^(NSArray<HMIconsModel *> *arr) {
        
        [arr enumerateObjectsUsingBlock:^(HMIconsModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            self.btnDataAry =arr;
            UIButton* btn = self.iconsArr[idx];
            btn.tag = idx;
            [btn addTarget:self action:@selector(toBtnWebController:) forControlEvents:UIControlEventTouchUpInside];
            //btn添加网络图片
            UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:obj.img]]];
            [btn setImage:img forState:UIControlStateNormal];
            //这个不行
//            [btn.imageView sd_setImageWithURL:[NSURL URLWithString:obj.img]];
            
        }];
        
    } error:^{
        
    }];
    
}

-(void)toBtnWebController:(UIButton*)btn{
    HMWebViewController* web = [[HMWebViewController alloc]init];
    HMIconsModel* model = self.btnDataAry[btn.tag];
    
    web.urlString = model.customURL;
    
    
    [self.navigationController pushViewController:web animated:YES];
    
}

- (void)setupTableView{
    
    UITableView *tableView = [[UITableView alloc] init];
    self.tableView = tableView;
    self.view = tableView;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    [self.tableView registerClass:[HMUpCell class] forCellReuseIdentifier:@"upcell"];
    [self.tableView registerClass:[HMDownCell class] forCellReuseIdentifier:@"cell"];
    
    UIView* footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screemW, 50)];
//    footView.backgroundColor = [UIColor darkGrayColor];
    
    UIButton* btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, screemW, 50)];
    
    [btn setTitle:@"点击查看更多商品 >" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(toMarket) forControlEvents:UIControlEventTouchUpInside];
    
    [footView addSubview:btn];
    
    
//    @{NSForegroundColorAttributeName:[UIColor darkGrayColor]}
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal
     ];
    btn.titleLabel.textColor = [UIColor darkGrayColor];
    
    self.tableView.tableFooterView = footView;

}

-(void)toMarket{
    //获得当前控制器的tabController, 调用.selectedIndex = _index;
    [self.tabBarController setSelectedIndex:1];
    
}

- (void)setupScrollAndBtn{
    
    UIView *HDView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 250)];
    self.HDView = HDView;
    
    self.tableView.tableHeaderView = HDView;
    
    
    //轮播器模块
 
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150);
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage:[UIImage imageNamed:@"grey1"]];

    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"v2_home_cycle_dot_selected"];
    cycleScrollView.pageDotImage = [UIImage imageNamed:@"v2_home_cycle_dot_normal"];
    self.cycleScrollView = cycleScrollView;
    
    [self.tableView.tableHeaderView addSubview:cycleScrollView];
    //占位图
      cycleScrollView.imageURLStringsGroup = @[@"v2_common_footer",@"v2_common_footer",@"v2_common_footer",@"v2_common_footer"];;
 
 
    
    

       
       UIView *BtnView = [[UIView alloc] initWithFrame:CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, 100)];
//       BtnView.backgroundColor = [UIColor redColor];
       [HDView addSubview:BtnView];
       CGFloat btnW = [UIScreen mainScreen].bounds.size.width / 4;
       
       NSMutableArray *iconsArr = [NSMutableArray array];
    self.iconsArr = iconsArr;
    NSArray *butTitleAry = @[
                             @"抽奖",
                              @"秒杀",
                              @"抢红包",
                              @"蜂报团"
     
                             ];
    
 
       for (int i = 0; i<4; i++) {
           
           HMVerticalButton *btn = [[HMVerticalButton alloc] initWithFrame:CGRectMake(i*btnW, 0, btnW, BtnView.size.height)];
           

 
           
           [btn setImage:[UIImage imageNamed:@"v2_placeholder_square"] forState:UIControlStateNormal];
           
           
           [btn setTitle:butTitleAry[i] forState:UIControlStateNormal];
           
//           btn.backgroundColor = [UIColor cyanColor];
           [BtnView addSubview:btn];
           
           [self.iconsArr addObject:btn];
  
       }

  
    
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0)
    {
        return self.cellModelArr.count == 0? 4:self.cellModelArr.count ;
    }
        return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if (indexPath.section == 0) {
      HMUpCell*    cell1 = [tableView dequeueReusableCellWithIdentifier:@"upcell" forIndexPath:indexPath];
        cell = cell1;
        
        
      cell1.model = self.cellModelArr[indexPath.row];
        
  
            return cell;
    }
    
    
    if (indexPath.section == 1) {
       HMDownCell*  cell2= [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        
//        cell2.dataAry = self.dataAry;
        cell=cell2;
        return cell;
    }
    return cell;
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0){
        return 150;
    }
    
//    return 3*screemH;
    
    //从缓存翅中取不行
    HMDownCell* cell = [[HMDownCell alloc]init];
    return [cell getHight];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HMWebViewController* web = [[HMWebViewController alloc]init];
   HMActivitiesModel* model = self.cellModelArr[indexPath.row];
    web.urlString =model.customURL;

    
    [self.navigationController pushViewController:web animated:YES];
    
}


@end
