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

//-(instancetype)initWithFrame:(CGRect)frame{
//    if (self = [super initWithFrame:frame]) {
//        
//        [self setupUI];
//    }
//    return self;
//    
//}


- (void)setupUI{
//    self.contentView.backgroundColor = [UIColor redColor];
    UIImageView *imgView = [UIImageView new];
    imgView.image = [UIImage imageNamed:@"v2_common_footer"];
//    imgView.center=self.center;
//    imgView.contentMode = UIViewContentModeScaleAspectFill;
//    [imgView sizeToFit];
    
    
    imgView.frame = CGRectMake(self.frame.size.width *0.2, 20, self.frame.size.width *0.6, 60);
//    imgView.backgroundColor = [UIColor blackColor];
    
    [self.contentView addSubview:imgView];
    
//    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.equalTo(self.contentView).offset(15);
//        make.right.equalTo(self.contentView).offset(-15);
//        make.bottom.equalTo(self.contentView).offset(0);
//    }];
}

@end
