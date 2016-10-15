//
//  DDProductSelectView.m
//  loveHoney
//
//  Created by deepindo on 2016/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DDProductSelectVC.h"

static NSString *productSelectCellId = @"productSelectCellId";

@interface DDProductSelectVC ()

@property(nonatomic,weak)UITableView *tableView;

@end

@implementation DDProductSelectVC

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.view = [[UIView alloc]initWithFrame:CGRectMake(screemW *0.25, 64, screemW * 0.75, screemH)];

    [self setupTableView];
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
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:productSelectCellId];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 20;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:productSelectCellId forIndexPath:indexPath];
    cell.textLabel.text = @"商品商品商品商品商品商品商品商品商品商品";
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 30;

}

@end
