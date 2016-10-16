//
//  HMDownCell.m
//  loveHoney
//
//  Created by 黄凯 on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMDownCell.h"

@implementation HMDownCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    UICollectionView *collectionV = [[UICollectionView alloc] init];
    
}






- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
