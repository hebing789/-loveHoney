//
//  DDQRCodeViewController.h
//  扫描二维码
//
//  Created by deepindo on 2016/10/19.
//  Copyright © 2016年 deepindo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDQRCodeViewController;

@protocol DDQRCodeViewControllerDelegate <NSObject>

/**
 *  读取到结果时会调用下面的代理方法
 *
 *  @param reader 扫描二维码控制器
 *  @param result 扫描结果
 */
- (void)reader:(DDQRCodeViewController *)reader didScanResult:(NSString *)result;

@end


@interface DDQRCodeViewController : UIViewController

@property (nonatomic, weak) id<DDQRCodeViewControllerDelegate> delegate;

/**
 *  设置扫描二维码完成后回调的block
 *
 *  @param completionBlock 完成block
 */
- (void)setCompletionWithBlock:(void (^) (NSString *resultAsString))completionBlock;

@end
