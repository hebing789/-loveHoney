//
//  DDProductTooBar.m
//  loveHoney
//
//  Created by deepindo on 2016/10/21.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DDProductToolBar.h"

@implementation DDProductToolBar

+(instancetype)productToolBar{
    
    return [[NSBundle mainBundle]loadNibNamed:@"DDProductToolBar" owner:nil options:nil].lastObject;
    
    
}

@end
