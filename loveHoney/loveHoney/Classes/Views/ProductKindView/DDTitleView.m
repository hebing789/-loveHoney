//
//  DDTitleView.m
//  loveHoney
//
//  Created by deepindo on 2016/10/15.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DDTitleView.h"

@interface DDTitleView ()

@property (weak, nonatomic) IBOutlet UILabel *deliveryLabel;


@end

@implementation DDTitleView

-(void)awakeFromNib{

    
}


+(instancetype)ddTitleView{
    
    

    return [[NSBundle mainBundle]loadNibNamed:@"DDTitleView" owner:self options:nil].lastObject;
}

@end
