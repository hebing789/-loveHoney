//
//  HBSQLiteTools.h
//  loveHoney
//
//  Created by hebing on 16/10/20.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <Foundation/Foundation.h>
#define pathShopping [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"shopping.db"]

@interface HBSQLiteTools : NSObject


+(instancetype)sharedTools;




@end
