//
//  HMMeTableViewCell1.m
//  loveHoney
//
//  Created by hebing on 16/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMMeTableViewCell1.h"

@interface HMMeTableViewCell1()

@property (weak, nonatomic) IBOutlet UIImageView *iconImagVIew;

@property (weak, nonatomic) IBOutlet UILabel *messageLable;

@end

@implementation HMMeTableViewCell1

- (void)awakeFromNib {
    [super awakeFromNib];

}

-(void)setDataAry:(NSDictionary *)dataAry{
    _dataAry =dataAry;
    
    NSString* text=dataAry[@"message"];

    
    self.messageLable.text=text;
    
    self.iconImagVIew.image=[UIImage imageNamed:dataAry[@"icon"]];
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
