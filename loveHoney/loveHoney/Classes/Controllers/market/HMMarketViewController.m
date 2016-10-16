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

static NSString *productKindViewCellId = @"productKindViewCellId";

@interface HMMarketViewController ()

@property(nonatomic,weak)DDProductKindView *productKindView;

@property(nonatomic,weak)DDProductSelectVC *productSelectVC;

@end

@interface HMMarketViewController ()

@end

@implementation HMMarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLeftKindSelectView];
    
    [self setupRightProductSelectViewController];

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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DDKindViewCell *cell = [tableView dequeueReusableCellWithIdentifier:productKindViewCellId forIndexPath:indexPath];
    
//    cell.backgroundColor = [UIColor lightGrayColor];
    
    return cell;
}

@end
