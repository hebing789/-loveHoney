//
//  HMVerticalButton.m
//  loveHoney
//
//  Created by 黄凯 on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMVerticalButton.h"

@implementation HMVerticalButton




-(instancetype)initWithFrame:(CGRect)frame{
    
    if( self= [super initWithFrame:frame]){
        //
        
                self.titleLabel.font=[UIFont systemFontOfSize:15];
        //
                self.titleLabel.textAlignment = NSTextAlignmentCenter;
                self.titleLabel.textColor=[UIColor darkGrayColor];
        
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
    return CGRectMake(contentRect.size.width/2-35, 10, 70, 70);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    //    screemW/6-contentRect.size.width/2
    return CGRectMake(contentRect.size.width/2-35, CGRectGetMaxY(self.imageView.frame) ,contentRect.size.width ,20);
    
    //     return CGRectMake(0, CGRectGetMaxY(self.imageView.frame) ,contentRect.size.width ,30);
}



@end
