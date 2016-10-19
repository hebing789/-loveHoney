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
#import "DDCategoriesModel.h"

static NSString *productSelectCellId = @"productSelectCellId";

@interface DDProductSelectVC ()

@property(nonatomic,weak)UITableView *tableView;

@end

@implementation DDProductSelectVC


-(void)setCategoriesList:(NSArray *)categoriesList{
    
    _categoriesList = categoriesList;
    
    [self.tableView reloadData];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.view = [[UIView alloc]initWithFrame:CGRectMake(screemW *0.2, 64, screemW * 0.8, screemH)];

    [self setupTableView];
    
}

-(void)setupTableView{

    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView = tableView;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tableView];
    
    self.tableView.showsVerticalScrollIndicator = NO;

    [tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    
    UINib *nib = [UINib nibWithNibName:@"DDProductViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:productSelectCellId];

   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollToIndex:) name:@"selectKind" object:nil];
   
}

-(void)scrollToIndex: (NSNotification *)notification{

    NSIndexPath *indexPath = notification.userInfo[@"indextPath"];
    
    NSIndexPath *productIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
    [self.tableView scrollToRowAtIndexPath:productIndexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

//数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return self.categoriesList.count;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    DDCategoriesModel *cModel = self.categoriesList[section];

    return cModel.products.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DDProductViewCell *cell = [tableView dequeueReusableCellWithIdentifier:productSelectCellId forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    DDCategoriesModel *cModel = self.categoriesList[indexPath.section];
    DDProductsModel *pModel = cModel.products[indexPath.row];

    cell.model = pModel;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 30;

}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    DDCategoriesModel *cModel = self.categoriesList[section];
    
    return cModel.name;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"组%ld, 行%ld", indexPath.section, indexPath.row);

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    NSIndexPath *indexPath = self.tableView.indexPathsForVisibleRows.firstObject;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"productBrowser" object:nil userInfo:@{@"indexPath" : indexPath}];

}

-(void)dealloc{

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
