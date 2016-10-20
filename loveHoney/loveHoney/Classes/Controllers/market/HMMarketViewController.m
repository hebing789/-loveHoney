//
//  HMMarketViewController.m
//  loveHoney
//
//  Created by hebing on 16/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMMarketViewController.h"
#import "DDProductKindView.h"
#import "DDProductSelectVC.h"
#import "DDKindViewCell.h"
#import "DDCategoriesModel.h"

static NSString *productKindViewCellId = @"productKindViewCellId";

@interface HMMarketViewController ()

@property(nonatomic,weak)DDProductKindView *productKindView;

@property(nonatomic,weak)DDProductSelectVC *productSelectVC;

@property(nonatomic,strong)NSArray *categoriesList;

@end

@interface HMMarketViewController ()

@end

@implementation HMMarketViewController


-(void)setCategoriesList:(NSArray *)categoriesList
{
    _categoriesList = categoriesList;
    
    [self.productKindView reloadData];
    
    NSIndexPath *initIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.productKindView selectRowAtIndexPath:initIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLeftKindSelectView];
    
    [self setupRightProductSelectViewController];

    [self loadNetworkData];

}


-(void)loadNetworkData{
    
    [SVProgressHUD showInfoWithStatus:@"正在加载数据"];

    [DDCategoriesModel loadSuperMarketDataWithFinished:^(NSArray<DDCategoriesModel *> *categoriesList, NSError *error) {
        //有问题
        if (error != nil){
            //显示提醒,网络不好, 重新尝试
            [UIView animateWithDuration:0.5 animations:^{
                [SVProgressHUD showErrorWithStatus:@"网络不好, 请重新尝试"];
            }];
            
            return;
        }
        [SVProgressHUD dismiss];
        
        //没有问题的---传值--刷新界面
        self.categoriesList = categoriesList;
        self.productSelectVC.categoriesList = categoriesList;
    }];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    SVProgressHUD 

}

-(void)setupLeftKindSelectView{

    DDProductKindView *productKindView = [[DDProductKindView alloc]initWithFrame:CGRectMake(0, 0, screemW * 0.2, self.view.bounds.size.height)];
    productKindView.backgroundColor = [UIColor whiteColor];
    productKindView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.productKindView = productKindView;
    [self.view addSubview:productKindView];
    
    productKindView.dataSource = self;
    productKindView.delegate = self;
    self.productKindView.showsVerticalScrollIndicator = NO;
    
    UINib *nib = [UINib nibWithNibName:@"DDKindViewCell" bundle:nil];
    [productKindView registerNib:nib forCellReuseIdentifier:productKindViewCellId];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(kindBtnDidSelected:) name:@"productBrowser" object:nil];

}


-(void)kindBtnDidSelected:(NSNotification *)notification{

    NSIndexPath *indexPath = notification.userInfo[@"indexPath"];
    
    NSIndexPath *initIndexPath = [NSIndexPath indexPathForRow:indexPath.section inSection:0];
    [self.productKindView selectRowAtIndexPath:initIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];


}

-(void)setupRightProductSelectViewController{

    //控制器没法实例化的时候设置frame
    DDProductSelectVC *productSelectVC = [[DDProductSelectVC alloc]init];
    self.productSelectVC = productSelectVC;
    [self addChildViewController:productSelectVC];
    [self.view addSubview:productSelectVC.view];

}

//数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.categoriesList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DDKindViewCell *cell = [tableView dequeueReusableCellWithIdentifier:productKindViewCellId forIndexPath:indexPath];
    
    DDCategoriesModel *model = self.categoriesList[indexPath.item];
    
    cell.model = model;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selectKind" object:nil userInfo:@{@"indextPath" : indexPath}];

}

-(void)dealloc{


    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

@end
