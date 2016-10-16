//
//  HMMyMessageController.m
//  loveHoney
//
//  Created by hebing on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMMyMessageController.h"
#import "HMUserInformationController.h"
#import "HMSystemInformationController.h"
@interface HMMyMessageController ()
@property (nonatomic,strong)UIView *tableViewUser;
@property (nonatomic,strong)UITableView *tableViewSystem;
@end

@implementation HMMyMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *tableViewUser = [[UIView alloc]init];
    UITableView *tableViewSystem = [[UITableView alloc]init];
    self.tableViewUser = tableViewUser;
    self.tableViewSystem = tableViewSystem;
    tableViewUser.backgroundColor = [UIColor whiteColor];
//    tableViewSystem.backgroundColor = [UIColor blueColor];
    
    self.view = self.tableViewSystem;
    self.tableViewSystem.hidden = NO;
    self.tableViewUser.hidden = YES;
    
    [self createTopView];
    
    [self createTableUser];
}

- (void)createTableUser
{
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"v2_my_message_empty"]];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
    
    label.text = @"~~~并没有消息~~~";
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.textColor = [UIColor darkGrayColor];
    
    label.font = [UIFont systemFontOfSize:20];
    
    imageView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height / 2 - 65);
    
    label.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height / 2);
    
    [self.tableViewUser addSubview:imageView];
    
    [self.tableViewUser addSubview:label];
    
    
    
}

- (void)createTopView
{
    UISegmentedControl *topSegmentedControl = [[UISegmentedControl alloc]initWithFrame:CGRectMake(0 , 0, self.navigationController.navigationBar.frame.size.width * 2 /5, self.navigationController.navigationBar.frame.size.height * 3 / 5)];
    
    topSegmentedControl.center = self.navigationController.navigationBar.center;
    
    [topSegmentedControl insertSegmentWithTitle:@"系统消息" atIndex:0 animated:YES];
    [topSegmentedControl insertSegmentWithTitle:@"用户消息" atIndex:1 animated:YES];
    
    topSegmentedControl.tintColor = [UIColor colorWithRed:253 / 255.0 green:217 / 255.0 blue:39 / 255.0 alpha:1];
    //设置字体
    UIFont *font = [UIFont boldSystemFontOfSize:13.0f];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                           forKey:UITextAttributeFont];
    [topSegmentedControl setTitleTextAttributes:attributes
                                       forState:UIControlStateNormal];
    //设置字体颜色
    UIColor *greenColor = [UIColor blackColor];
    NSDictionary *colorAttr = [NSDictionary dictionaryWithObject:greenColor forKey:UITextAttributeTextColor];
    [topSegmentedControl setTitleTextAttributes:colorAttr forState:UIControlStateNormal];
    
    [topSegmentedControl addTarget:self action:@selector(changeView:) forControlEvents:UIControlEventValueChanged];
    
    topSegmentedControl.selectedSegmentIndex = 0;
    
    [self.navigationItem setTitleView: topSegmentedControl];
    
   
}

- (void)changeView:(UISegmentedControl *)seg
{
    NSInteger index = seg.selectedSegmentIndex;
    
    switch (index) {
        case 0:
            self.view = self.tableViewSystem;
            self.tableViewSystem.hidden = NO;
            self.tableViewUser.hidden = YES;
            break;
            
        case 1:
            self.view = self.tableViewUser;
            self.tableViewSystem.hidden = YES;
            self.tableViewUser.hidden = NO;
            break;
            
        default:
            break;
    }
}
@end
