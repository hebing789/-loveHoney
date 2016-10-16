//
//  DDProductSelectView.m
//  loveHoney
//
//  Created by deepindo on 2016/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DDProductSelectVC.h"
#import "DDProductViewCell.h"
#import "DDProductsModel.h"

static NSString *productSelectCellId = @"productSelectCellId";

@interface DDProductSelectVC ()



@property(nonatomic,weak)UITableView *tableView;

@end

@implementation DDProductSelectVC

-(void)setProductsList:(NSArray<DDProductsModel *> *)productsList
{
    _productsList = productsList;
    
    [self.tableView reloadData];

}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.view = [[UIView alloc]initWithFrame:CGRectMake(screemW *0.2, 64, screemW * 0.8, screemH)];

    [self setupTableView];
    
//    [self loadMarketProductsList];
}

-(void)setupTableView{

    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    self.tableView.showsVerticalScrollIndicator = NO;

    [tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    
    UINib *nib = [UINib nibWithNibName:@"DDProductViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:productSelectCellId];

}


- (void)loadMarketProductsList{
    //设置参数
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setValue:@"5" forKey:@"call"];
    
    //请示网络数据
    [DSHTTPClient postUrlString:@"supermarket.json.php" withParam:param withSuccessBlock:^(id responseObject) {
        NSDictionary *data = responseObject[@"data"];
        NSDictionary *productsList = data[@"products"];
        
        NSMutableArray *nmArray = [NSMutableArray array];
        
        for (NSDictionary *dict in productsList) {
            [nmArray addObject:[DDProductsModel productsWithDict:dict]];
        }
        NSLog(@"%@",nmArray);
        self.productsList = [NSArray arrayWithArray:nmArray];
        
    } withFailedBlock:^(NSError *error) {
        NSLog(@"%@",error);
    } withErrorBlock:^(NSString *message) {
        NSLog(@"%@",message);
    }];
    
}




//数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 20;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DDProductViewCell *cell = [tableView dequeueReusableCellWithIdentifier:productSelectCellId forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 30;

}

@end
