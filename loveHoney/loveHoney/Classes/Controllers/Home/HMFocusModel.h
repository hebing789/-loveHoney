//
//  HMFocusModel.h
//  loveHoney
//
//  Created by 黄凯 on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMFocusModel : NSObject

+(void)focusModelWithSuccess:(void(^)(NSArray<HMFocusModel *> *))successBlock error:(void(^)())errorBlock;
 
@end
