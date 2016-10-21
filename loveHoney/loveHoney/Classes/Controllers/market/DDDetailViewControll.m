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

@interface DDDetailViewControll ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property(nonatomic,weak)UITableView *tableView;

@end

@implementation DDDetailViewControll

-(void)viewDidLoad{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self setupTableView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"分享" imageName:nil target:self action:@selector(shareThePage)];
    
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

-(void)shareThePage{
    NSLog(@"分享");
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"分享到" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *wechatFriend = [UIAlertAction actionWithTitle:@"微信好友" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"微信好友");
    }];
    UIAlertAction *wechatMoment = [UIAlertAction actionWithTitle:@"微信朋友圈" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"微信朋友圈");
    }];
    UIAlertAction *sinaWeibo = [UIAlertAction actionWithTitle:@"新浪微博" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"新浪微博");
    }];
    UIAlertAction *qqZone = [UIAlertAction actionWithTitle:@"QQ空间" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"QQ空间");
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    
    
    [alertController addAction:wechatFriend];
    [alertController addAction:wechatMoment];
    [alertController addAction:sinaWeibo];
    [alertController addAction:qqZone];
    [alertController addAction:cancel];
    
    [self presentViewController:alertController animated:YES completion:nil];

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
