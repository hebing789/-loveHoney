//
//  HMTabBar.m
//  loveHoney
//
//  Created by hebing on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMTabBar.h"
#import "HMTabbarButton.h"

@interface HMTabBar()
@property(nonatomic,weak)HMTabbarButton * but;

@end

@implementation HMTabBar


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    
    return  self;
    
}


-(void)setUI{
    HMTabbarButton * but = [[HMTabbarButton alloc]init];
    self.but = but;
    [but setImage:[UIImage imageNamed:@"shopCart" ] forState:UIControlStateNormal];
    
    [but setImage:[UIImage imageNamed:@"shopCart_r"] forState:UIControlStateSelected];

//    but.titleLabel.text=@"购物车";
//    but.titleLabel.textColor = [UIColor darkGrayColor];
    [but setTitle:@"购物车" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    [but addTarget:self action:@selector(butClick) forControlEvents:UIControlEventTouchUpInside];
    
//    UIBarButtonItem* btnItem = [[UIBarButtonItem alloc]initWithCustomView:but];
    [self addSubview:but];
    
 
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat butW = self.bounds.size.width/4;
    CGFloat butH = self.bounds.size.height;
    //定义递增的索引
    NSInteger index = 0;
    for (UIView* subview in self.subviews) {
        
        if ([subview isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            subview.frame = CGRectMake(index*butW, 0, butW, butH);
            index += ((index == 1 )? 2:1);
        }
        
        
    }
    
    self.but.frame =CGRectMake(butW*2, 0, butW, butH);
    
    
    
}

-(void)butClick{

    if (_butClickCallback) {
        _butClickCallback();
    }
}

@end
