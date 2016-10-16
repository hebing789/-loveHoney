//
//  DDKindViewCell.m
//  loveHoney
//
//  Created by deepindo on 2016/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DDKindViewCell.h"
#import "DDCategoriesModel.h"

@interface DDKindViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

@end


@implementation DDKindViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    self.selectedBackgroundView = view;
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 5, self.bounds.size.height - 6)];
    lineView.backgroundColor = [UIColor orangeColor];
    [view addSubview:lineView];
    
}

-(void)setModel:(DDCategoriesModel *)model
{
    _model = model;
    
    self.categoryLabel.text = model.name;

}

//-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
//    [super setSelected:selected animated:animated];
//    
//}

@end
