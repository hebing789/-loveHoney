//
//  DDParabolaAnimationTools.h
//  loveHoney
//
//  Created by deepindo on 2016/10/19.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^animationFinishedBlock)(BOOL finish);

@interface DDAnimationTools : NSObject

@property(nonatomic,copy)animationFinishedBlock animationFinishBlock;

@property(nonatomic,strong)CALayer *layer;

+ (instancetype)sharedTool;

- (void)startAnimationWithView:(UIView *)view startRect:(CGRect)startRect endRect:(CGPoint)endPoint finish:(animationFinishedBlock)completion;

+(void)shakeAnimation:(UIView *)shakeView;

- (void)leftBigImgStartAnimationWithView:(UIView *)view startRect:(CGRect)startRect endRect:(CGPoint)endPoint finish:(animationFinishedBlock)completion;
    


@end
