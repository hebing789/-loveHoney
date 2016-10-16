//
//  HMVerticalTitleButton.m
//  loveHoney
//
//  Created by hebing on 16/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMVerticalTitleButton.h"
@interface HMVerticalTitleButton()

@property(nonatomic,assign)CGFloat imgY;


@end
@implementation HMVerticalTitleButton



-(instancetype)initWithFrame:(CGRect)frame{
    
    if( self= [super initWithFrame:frame]){
//
        
//        self.titleLabel.font=[UIFont systemFontOfSize:15];
//        
//        self.titleLabel.textAlignment = NSTextAlignmentCenter;
//        self.titleLabel.textColor=[UIColor darkGrayColor];
        
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        
        
        
    }
    
    
    return  self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
//    self.titleLabel.hidden= YES;
    
    //这个写了会有重影,原因/
//    self.titleLabel.font=[UIFont systemFontOfSize:15];
////    
//    self.titleLabel.textAlignment = NSTextAlignmentCenter;
//    self.titleLabel.textColor=[UIColor darkGrayColor];
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
//    self.imgY=contentRect.size.height-self.titleLabel.height;
    return CGRectMake(contentRect.size.width/2-15, 20, 40, 30);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
//    screemW/6-contentRect.size.width/2
    return CGRectMake(contentRect.size.width/2-25, CGRectGetMaxY(self.imageView.frame) ,contentRect.size.width ,30);
    
//     return CGRectMake(0, CGRectGetMaxY(self.imageView.frame) ,contentRect.size.width ,30);
}

@end
