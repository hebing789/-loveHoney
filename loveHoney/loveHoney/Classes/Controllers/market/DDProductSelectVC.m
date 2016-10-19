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
#import "DDAnimationTools.h"

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

    //点击block赋值
    cell.clickBlock = ^(UIImageView *iconView, NSInteger integer){
    
        CGRect rect = [tableView rectForRowAtIndexPath:indexPath];
        //获取当前cell 相对于self.view 当前的坐标
        rect.origin.y = rect.origin.y - [tableView contentOffset].y;
        rect.origin.x = rect.origin.x - SCREEN_WIDTH/4;
        CGRect imageViewRect = iconView.frame;
        imageViewRect.origin.y = rect.origin.y+imageViewRect.origin.y;
        imageViewRect.origin.x = -(rect.origin.x+imageViewRect.origin.x);
        
        [[DDAnimationTools sharedTool]startAnimationWithView:iconView startRect:imageViewRect endRect:CGPointMake(SCREEN_WIDTH/4*2.5, SCREEN_HEIGHT-49) finish:^(BOOL finish) {
            UIView *view = self.tabBarController.tabBar.subviews[3];
            [DDAnimationTools shakeAnimation:view];
        }];
        
        UIViewController *vc = self.tabBarController.viewControllers[2];
        NSInteger badgeValue = [vc.tabBarItem.badgeValue integerValue];
        badgeValue += integer;
        NSString *str = [NSString stringWithFormat:@"%zd", badgeValue];
        if ([str isEqualToString:@"0"]) {
            str = nil;
        }
        vc.tabBarItem.badgeValue = str;
        
    };

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
