//
//  UIBarButtonItem+DDBarButtonItem.m
//  loveHoney
//
//  Created by deepindo on 2016/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "UIBarButtonItem+DDBarButtonItem.h"

@implementation UIBarButtonItem (DDBarButtonItem)

-(instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName target:(id) target action:(SEL)action{

    if (self = [self init]) {
        
        //实例化按钮
        UIButton *btn = [[UIButton alloc]init];
        
        //图片
        if (imageName != nil) {
        
            [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
            NSString *highlighImage = [imageName stringByAppendingString:@"highlighted"];
            [btn setImage:[UIImage imageNamed:highlighImage] forState:UIControlStateHighlighted];
        }
        //文字
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitle:title forState:UIControlStateHighlighted];
        //字号
        [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        //颜色
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:kThemeColor forState:UIControlStateHighlighted];
        //自适应
        [btn sizeToFit];
        
        //添加点击事件
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        //赋值
        self.customView = btn;
        
    }

    return self;
}



@end
