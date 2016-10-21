//
//  DDDetailProductViewControlle.m
//  loveHoney
//
//  Created by deepindo on 2016/10/20.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DDDetailViewControll.h"
#import "DDDetailProductCell.h"
#import "DDProductToolBar.h"

static NSString *reuseId = @"detailProduct";

@interface DDDetailViewControll ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,weak)UITableView *tableView;

@end

@implementation DDDetailViewControll

-(void)viewDidLoad{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self setupTableView];
    

}

-(void)setupTableView{

    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screemW, self.view.bounds.size.height)];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight =  2500;
    UINib *nib = [UINib nibWithNibName:@"DDDetailProductCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:reuseId];
    
    DDProductToolBar *productToolBar = [DDProductToolBar productToolBar];
    productToolBar.frame = CGRectMake(0, screemH-50, screemW, 50);
    [self.view addSubview:productToolBar];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DDDetailProductCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId forIndexPath:indexPath];
    
    cell.model = self.model;
    return  cell;

}

@end
