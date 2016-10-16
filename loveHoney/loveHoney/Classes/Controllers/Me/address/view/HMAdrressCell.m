//
//  HMAdrressCell.m
//  loveHoney
//
//  Created by hebing on 16/10/17.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMAdrressCell.h"

@interface HMAdrressCell()
@property(nonatomic,weak)UILabel* nameLable;
@property(nonatomic,weak)UILabel* phoneLable;
@property(nonatomic,weak)UILabel* detailAdr;
//@property(nonatomic,weak)UILabel* adr;
@property(nonatomic,weak)UIButton* editBut;



@end

@implementation HMAdrressCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUI];
    }
    
    return self;
}

-(void)setModel:(HMAddresModel *)model{
    
    _model = model;
    self.nameLable.text = model.accept_name;
    
    
    self.phoneLable.text = [NSString stringWithFormat:@"%@",model.telphone];
    
    
    self.detailAdr.text = model.address;
    

    
    [self setNeedsLayout];
    
}

-(void)setUI{
    UILabel* nameLable = [[UILabel alloc]init];
    
    nameLable.font = [UIFont systemFontOfSize:16];
    UILabel* phoneLable= [[UILabel alloc]init];
    
     phoneLable.font = [UIFont systemFontOfSize:16];
    
    UILabel* detailAdr= [[UILabel alloc]init];
    
    detailAdr.font = [UIFont systemFontOfSize:14];
    detailAdr.textColor = [UIColor darkGrayColor];
    
//    UILabel* adr= [[UILabel alloc]init];
    
    
    
    UIButton* editBut = [[UIButton alloc]init];
    
    [editBut setImage:[UIImage imageNamed:@"v2_address_edit_normal"] forState:UIControlStateNormal];
    [editBut setImage:[UIImage imageNamed:@"v2_address_edit_highlighted"] forState:UIControlStateNormal];
    [editBut addTarget:self action:@selector(edit) forControlEvents:UIControlEventTouchUpInside];
    
    self.nameLable = nameLable;
     self.phoneLable = phoneLable;
     self.detailAdr = detailAdr;
//    self.adr = adr;
     self.editBut = editBut;
     [self.contentView addSubview:nameLable];
     [self.contentView addSubview:phoneLable];
     [self.contentView addSubview:detailAdr];
//     [self.contentView addSubview:adr];
     [self.contentView addSubview:editBut];
    
     [self.editBut sizeToFit];
    self.editBut.frame = CGRectMake(screemW -self.editBut.frame.size.width-30 , self.center.y, self.editBut.frame.size.width, self.editBut.frame.size.height);
    

}


-(void)layoutSubviews{
    [super layoutSubviews];
    [self.nameLable sizeToFit];
    [self.phoneLable sizeToFit];
    [self.detailAdr  sizeToFit];
//    [self.adr sizeToFit];
   
    self.nameLable.frame = CGRectMake(5, 5, self.nameLable.frame.size.width, self.nameLable.frame.size.height);
    
    
    self.phoneLable.frame = CGRectMake(CGRectGetMaxX(self.nameLable.frame)+15, 5, self.phoneLable.frame.size.width, self.phoneLable.frame.size.height);
    
    
    self.detailAdr.frame = CGRectMake(5,CGRectGetMaxY(self.nameLable.frame)+ 15, self.detailAdr.frame.size.width, self.detailAdr.frame.size.height);
    
//    self.adr.frame = CGRectMake(CGRectGetMaxX(self.nameLable.frame)+15, CGRectGetMaxY(self.nameLable.frame)+ 15, self.adr.frame.size.width, self.adr.frame.size.height);

    
}


-(void)edit{
    
    if (_callbackClick) {
        _callbackClick(self.model);
    }
    
    
}
@end
