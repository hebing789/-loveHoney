//
//  DDParabolaAnimationTools.m
//  loveHoney
//
//  Created by deepindo on 2016/10/19.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DDAnimationTools.h"

@implementation DDAnimationTools

+ (instancetype)sharedTool{
    
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}


- (void)startAnimationWithView:(UIView *)view startRect:(CGRect)startRect endRect:(CGPoint)endPoint finish:(animationFinishedBlock)completion{
    
    self.layer = [CALayer layer];
    _layer.contents = view.layer.contents;
    _layer.contentsGravity = kCAGravityResizeAspectFill;
    //重置大小
    startRect.size.height = 60;
    startRect.size.width = 60;
    _layer.bounds = startRect;
    
    [[[UIApplication sharedApplication].delegate window].layer addSublayer:_layer];
    
    _layer.position = CGPointMake(startRect.origin.x+view.frame.size.width/2, CGRectGetMidY(startRect));
    
    //bezi路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:_layer.position];
    [path addQuadCurveToPoint:endPoint controlPoint:CGPointMake(SCREEN_WIDTH/2, startRect.origin.y-60)];
    
    //动画
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.path = path.CGPath;
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    basicAnimation.removedOnCompletion = YES;
    basicAnimation.fromValue = [NSNumber numberWithFloat:1.2];
    basicAnimation.toValue = [NSNumber numberWithFloat:0.0];
    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    //组合
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[pathAnimation,basicAnimation];
    group.duration = 0.8f;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    group.delegate = self;
    [_layer addAnimation:group forKey:@"group"];
    
    //回调
    if (completion) {
        
        self.animationFinishBlock = completion;
    }
    
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    if (anim == [_layer animationForKey:@"group"]) {
        [_layer removeFromSuperlayer];
        _layer = nil;
        if (self.animationFinishBlock) {
            self.animationFinishBlock(YES);
        }
    }
}

+(void)shakeAnimation:(UIView *)shakeView{
    CABasicAnimation *shakeAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    shakeAnimation.duration = 0.25f;
    shakeAnimation.fromValue = [NSNumber numberWithFloat:-5];
    shakeAnimation.toValue = [NSNumber numberWithFloat:5];
    shakeAnimation.autoreverses = YES;
    [shakeView.layer addAnimation:shakeAnimation forKey:nil];
    
    if ([shakeView isKindOfClass:NSClassFromString(@"UITabBarItem")]) {
        
        UITabBarItem *tabbar = (UITabBarItem *)shakeView;
        [tabbar setBadgeValue:[NSString stringWithFormat:@"%d",10]];
    }
    
}

- (void)leftBigImgStartAnimationWithView:(UIView *)view startRect:(CGRect)startRect endRect:(CGPoint)endPoint finish:(animationFinishedBlock)completion{
    
    self.layer = [CALayer layer];
    _layer.contents = view.layer.contents;
    _layer.contentsGravity = kCAGravityResizeAspectFill;
    //重置大小
    startRect.size.height = 150;
    startRect.size.width = 150;
    _layer.bounds = startRect;
    
    [[[UIApplication sharedApplication].delegate window].layer addSublayer:_layer];
    
    _layer.position = CGPointMake(startRect.origin.x+view.frame.size.width/2, CGRectGetMidY(startRect));
    
    //bezi路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:_layer.position];
    [path addQuadCurveToPoint:endPoint controlPoint:CGPointMake(SCREEN_WIDTH/2, startRect.origin.y-60)];
    
    //动画
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.path = path.CGPath;
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    basicAnimation.removedOnCompletion = YES;
    basicAnimation.fromValue = [NSNumber numberWithFloat:1.2];
    basicAnimation.toValue = [NSNumber numberWithFloat:0.0];
    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    //组合
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[pathAnimation,basicAnimation];
    group.duration = 1.0f;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    group.delegate = self;
    [_layer addAnimation:group forKey:@"group"];
    
    //回调
    if (completion) {
        
        self.animationFinishBlock = completion;
    }
    
    
}


@end
