//
//  HMMenuTableViewCell2.m
//  loveHoney
//
//  Created by hebing on 16/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMMenuTableViewCell2.h"
#import "HMVerticalTitleButton.h"
#import "HMMyMeNuController.h"
#import "HMMyMessageController.h"
#import "HMYouHuiQuanController.h"


@interface HMMenuTableViewCell2 ()
@property (weak, nonatomic) IBOutlet HMVerticalTitleButton *myMenu;

@property (weak, nonatomic) IBOutlet HMVerticalTitleButton *youHuiQuan;

@property (weak, nonatomic) IBOutlet HMVerticalTitleButton *myMessage;

@end

@implementation HMMenuTableViewCell2

- (void)awakeFromNib {
    [super awakeFromNib];
//    //这样设置也会重影
//    _myMenu.titleLabel.textAlignment = NSTextAlignmentCenter;
//    _youHuiQuan.titleLabel.textAlignment = NSTextAlignmentCenter;
//    _myMessage.titleLabel.textAlignment = NSTextAlignmentCenter;
    
//    self.contentView.backgroundColor= [UIColor blueColor];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}
- (IBAction)toMyMenu:(id)sender {
    NSLog(@"我的订单");
    
    HMMyMeNuController* myMenuContr=[HMMyMeNuController new];
//    DDBaseNavController* nvmyMenuContr= [[DDBaseNavController alloc]initWithRootViewController:myMenuContr];
    //无效果
   
    
    [[self viewController].navigationController pushViewController:myMenuContr animated:YES];
    
    
}

- (IBAction)toFree:(id)sender {
    
    NSLog(@"优惠券");
    HMYouHuiQuanController* youhui = [[HMYouHuiQuanController alloc]init];
    [[self viewController].navigationController pushViewController:youhui animated:YES];
    

    
}

- (IBAction)toMyMessage:(id)sender {
    NSLog(@"我的消息");
    HMMyMessageController* messageControl= [[HMMyMessageController alloc]init];
      [[self viewController].navigationController pushViewController:messageControl animated:YES];
}


- (UIViewController *)viewController
{
    //获取当前view的superView对应的控制器
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
    
}


@end
