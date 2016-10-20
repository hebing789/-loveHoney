//
//  HMYouHuiQuanController.m
//  loveHoney
//
//  Created by hebing on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMYouHuiQuanController.h"
#import "HMYouModel.h"
#import "HMYouCell.h"
@interface HMYouHuiQuanController ()

@property (nonatomic,strong)NSArray *modelArray;

@end

static NSString *reuseId = @"youCell";

@implementation HMYouHuiQuanController

- (void)setModelArray:(NSArray *)modelArray
{
    _modelArray = modelArray;
    
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width
                                                                           , 44)];
    searchBar.placeholder = @"搜索";
    
    searchBar.backgroundColor = [UIColor whiteColor];
    // 添加 searchbar 到 headerview
    self.tableView.tableHeaderView = searchBar;
    
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    
    [self.tableView registerClass:[HMYouCell class] forCellReuseIdentifier:reuseId];
    
    UIButton *btn = [[UIButton alloc]init];
    
    [btn setTitle:@"使用规则" forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [btn sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    [HMYouModel modelWithSuccess:^(NSArray *nmArray) {
        
        self.modelArray = nmArray;
        
        //        NSLog(@"%@",nmArray);
    } error:^{
        
    }];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.modelArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HMYouCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId forIndexPath:indexPath];
    
    if (indexPath.row ==0 ) {
        
        cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1"]];
    }
    else if(indexPath.row ==1)
    {
        
        cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2"]];
    }
    else if(indexPath.row ==2)
    {
        
        cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"3"]];
    }
    else
    {
        
        cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"4"]];
    }
    cell.model = self.modelArray[indexPath.row];
    
    [cell.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(cell).offset(10);
        
        make.left.equalTo(cell).offset(10);
        
        make.bottom.equalTo(cell).offset(-10);
        
        make.right.equalTo(cell).offset(-10);
        
    }];
    
    cell.userInteractionEnabled = NO;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}



@end
