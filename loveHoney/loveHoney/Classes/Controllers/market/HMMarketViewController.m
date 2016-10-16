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



//#import "DDMarketViewModel.h"
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

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLeftKindSelectView];
    
    [self setupRightProductSelectViewController];
    
    [self loadNetworkData];

}


-(void)loadNetworkData{

    [DDMarketViewModel loadSuperMarketDataWithFinished:^(NSDictionary *dataDict, NSError *error) {
        //有问题
        if (error != nil){
            //显示提醒,网络不好, 重新尝试
            
            return;
        }
        
        //没有问题的---传值--刷新界面
        self.categoriesList = dataDict[@"categories"];
        self.productSelectVC.productsList = dataDict[@"products"];
        
    }];


}

- (void)loadMarketCategoriesList{
    //设置参数
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setValue:@"5" forKey:@"call"];
    
    //请示网络数据
    [DSHTTPClient postUrlString:@"supermarket.json.php" withParam:param withSuccessBlock:^(id responseObject) {
        
        
        
        NSDictionary *data = responseObject[@"data"];
        NSDictionary *categoriesList = data[@"categories"];

        NSMutableArray *nmArray = [NSMutableArray array];
        
        for (NSDictionary *dict in categoriesList) {
            [nmArray addObject:[DDCategoriesModel categoriesWithDict:dict]];
        }
        NSLog(@"%@",nmArray);
        self.categoriesList = [NSArray arrayWithArray:nmArray];
        
    } withFailedBlock:^(NSError *error) {
        NSLog(@"%@",error);
    } withErrorBlock:^(NSString *message) {
        NSLog(@"%@",message);
    }];
    
}

-(void)setupLeftKindSelectView{

    DDProductKindView *productKindView = [[DDProductKindView alloc]initWithFrame:CGRectMake(0, 0, screemW * 0.2, self.view.bounds.size.height)];
    self.productKindView = productKindView;
    [self.view addSubview:productKindView];
    
    productKindView.dataSource = self;
    productKindView.delegate = self;
    self.productKindView.showsVerticalScrollIndicator = NO;
    
    UINib *nib = [UINib nibWithNibName:@"DDKindViewCell" bundle:nil];
    [productKindView registerNib:nib forCellReuseIdentifier:productKindViewCellId];

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

@end
