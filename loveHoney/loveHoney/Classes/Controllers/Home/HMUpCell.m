//
//  HMUpCell.m
//  loveHoney
//
//  Created by 黄凯 on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMUpCell.h"

@implementation HMUpCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
     return self;
}


- (void)setupUI{
    UIImageView *imgView = [UIImageView new];
   
    imgView.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:imgView];
    
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.contentView).offset(5);
        make.bottom.equalTo(self.contentView).offset(0);
    }];
}

@end
