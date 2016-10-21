//
//  HMVerticalButton.m
//  loveHoney
//
//  Created by 黄凯 on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMVerticalButton.h"

@implementation HMVerticalButton

//没有实现效果
-(void)initButton:(UIButton*)btn{
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.imageView.frame.size.height ,-btn.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0,0.0, -btn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
}


-(instancetype)initWithFrame:(CGRect)frame{
    
    if( self= [super initWithFrame:frame]){
        //
        
                self.titleLabel.font=[UIFont systemFontOfSize:15];
        //
                self.titleLabel.textAlignment = NSTextAlignmentCenter;
                self.titleLabel.textColor=[UIColor darkGrayColor];
        
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
//        [self initButton:self];
        
        
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
    
       return CGRectMake(contentRect.size.width/2-25, 15, 50, 34);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{

    return CGRectMake(0, CGRectGetMaxY(self.imageView.frame)+15 ,contentRect.size.width ,20);
    

}



@end
