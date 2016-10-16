//
//  DDcategoriesModel.h
//  loveHoney
//
//  Created by deepindo on 2016/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDCategoriesModel : NSObject

//顺序
@property(nonatomic,assign)NSInteger sort;

//pcid
@property(nonatomic,assign)NSInteger pcid;

//id
@property(nonatomic,copy)NSString *id;

//disabled_show
@property(nonatomic,assign)BOOL disabled_show;

//name
@property(nonatomic,copy)NSString *name;

//icon
@property(nonatomic,copy)NSString *icon;

/**
 *  快速构造方法--对象方法
 *
 *  @param dict 传入的字典数据
 *
 *  @return 返回的当前对象
 */
-(instancetype)initWithDict:(NSDictionary *)dict;


/**
 *  快速创建对象的类方法
 *
 *  @param dict 传入的字典数据
 *
 *  @return 返回类
 */
+(instancetype)categoriesWithDict:(NSDictionary *)dict;





@end
