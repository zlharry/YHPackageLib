//
//  PLMyPackingVCModel.m
//  YHPackageLib
//
//  Created by harry on 2018/4/7.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "LibAppModel.h"

@implementation LibAppModel

+ (instancetype)modelWithTitle:(NSString *)title subTitle:(NSString *)subTitle tarClass:(Class)tarClass
{
    LibAppModel *model = [[LibAppModel alloc] init];
    model.title = title;
    model.subTitle = subTitle;
    model.tarClass = tarClass;
    
    return model;
}
@end
