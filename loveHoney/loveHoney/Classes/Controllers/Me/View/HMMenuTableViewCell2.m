//
//  HMMenuTableViewCell2.m
//  loveHoney
//
//  Created by hebing on 16/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMMenuTableViewCell2.h"
#import "HMVerticalTitleButton.h"
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
    
    
}

- (IBAction)toFree:(id)sender {
    
    
}

- (IBAction)toMyMessage:(id)sender {
    
    
}

@end
