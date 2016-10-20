//
//  HMPay1TableViewCell.m
//  loveHoney
//
//  Created by gaojie on 16/10/17.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMPay1TableViewCell.h"

@interface HMPay1TableViewCell()


@property (weak, nonatomic) IBOutlet UIButton *payBtn;
@property(nonatomic,weak)UIButton *lastBtn;

@property(nonatomic,assign)NSInteger num;

@property(nonatomic,strong)NSMutableArray *butnArray;

@end

@implementation HMPay1TableViewCell

-(NSMutableArray *)butnArray{

    if (_butnArray == nil) {
        _butnArray = [[NSMutableArray alloc]init];
    }
    return _butnArray;

}
-(void)setTitle:(NSString *)title{
    self.payLable.text = title;
    _title =title;
    
}

-(void)setImg:(NSString *)img{
    
    _img =img;
    _iconImg.image = [UIImage imageNamed:img];
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    

    [self.butnArray addObject: self.payBtn];
    NSLog(@"%@",self.butnArray);
    NSLog(@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈发生");
}

- (IBAction)ClickPayBtn:(UIButton *)sender {
    
    
    if (_callback) {
        _callback(sender);
    }
    
    
    
}
- (void)ClickBtn:(UIButton *)btn{




}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
