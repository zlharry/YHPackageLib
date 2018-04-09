//
//  YHChildVCModel.m
//  YHPackageLib
//
//  Created by harry on 2018/4/3.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "YHChildVCModel.h"

@implementation YHChildVCModel

- (instancetype)initWithTitle:(NSString *)title
               normalIconName:(NSString *)normalIconName
             selectedIconName:(NSString *)selectedIconName
                    classType:(Class)classType
                 navClassType:(Class)navClassType
{
    if (self = [super init]) {
        self.title = title;
        self.normalIconName = normalIconName;
        self.selectedIconName = selectedIconName;
        self.classType = classType;
        self.navClassType = navClassType;
    }
    return self;
}

+ (instancetype)vcModelWithTitle:(NSString *)title
                  normalIconName:(NSString *)normalIconName
                selectedIconName:(NSString *)selectedIconName
                       classType:(Class)classType
{
    return [[self alloc] initWithTitle:title
                        normalIconName:normalIconName
                      selectedIconName:selectedIconName
                             classType:classType
                          navClassType:NULL];
}


/** 快速创建一个实例对象 */
+ (instancetype)vcModelWithTitle:(NSString *)title normalIconName:(NSString *)normalIconName selectedIconName:(NSString *)selectedIconName classType:(Class)classType navClassType:(Class)navClassType
{
    
    return [[self alloc] initWithTitle:title
                        normalIconName:normalIconName
                      selectedIconName:selectedIconName
                             classType:classType
                          navClassType:navClassType];
}

@end
