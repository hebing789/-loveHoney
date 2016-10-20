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

    UIImageView *cellImg = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, screemW-10   , 140)];
    self.cellImg = cellImg;
    
    self.cellImg.image = [UIImage imageNamed:@"v2_placeholder_square"];
    
//    self.imageView.image =[UIImage imageNamed:@"v2_placeholder_square"];
    ;
//    imgView.backgroundColor = [UIColor blackColor];
    
    [self.contentView addSubview:cellImg];
    
    [self setNeedsLayout];
    
//    [cellImg mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.equalTo(self.contentView).offset(5);
//        make.right.equalTo(self.contentView).offset(-5);
//        make.bottom.equalTo(self.contentView).offset(-5);
//    }];
    
    //站位图片不显示的原因??
//    cellImg.image = [UIImage imageNamed:@"v2_connnect_error"];
   
//    [cellImg sizeToFit];
    
}


- (void)setModel:(HMActivitiesModel *)model{
    
    _model = model;
//    self.cellImg.image = [UIImage imageNamed:@"v2_placeholder_square"];
    
    //没有实现占位图
   
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.cellImg sd_setImageWithURL: [NSURL URLWithString: model.img]];

            [self setNeedsLayout];
        });

    
    
    
   
    
}




@end
