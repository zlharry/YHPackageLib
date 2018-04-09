//
//  LibAppModel.h
//  YHPackageLib
//
//  Created by harry on 2018/4/7.
//  Copyright © 2018年 harry. All rights reserved.
//  每一行的数据模型

#import <Foundation/Foundation.h>

@interface LibAppModel : NSObject

/** <#text#> */
@property (nonatomic, copy) NSString *title;
/** <#text#> */
@property (nonatomic, copy) NSString *subTitle;

/** <#text#> */
@property (nonatomic, assign) Class tarClass;


+ (instancetype)modelWithTitle:(NSString *)title subTitle:(NSString *)subTitle tarClass:(Class)tarClass;

@end
