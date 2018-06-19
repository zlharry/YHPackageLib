//
//  PLMyPackingVCModel.m
//  YHPackageLib
//
//  Created by harry on 2018/4/7.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "LibAppModel.h"

@implementation LibAppModel

- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle tarClass:(Class)tarClass block:(LibAppModelBlock)block {
    if (self = [super init]) {
        self.title = title;
        self.subTitle = subTitle;
        self.tarClass = tarClass;
        self.block = block;
    }
    return self;
}

+ (instancetype)modelWithTitle:(NSString *)title subTitle:(NSString *)subTitle tarClass:(Class)tarClass
{
    return [[self alloc] initWithTitle:title subTitle:subTitle tarClass:tarClass block:nil];
}
+ (instancetype)modelWithTitle:(NSString *)title subTitle:(NSString *)subTitle block:(LibAppModelBlock)block
{
    return [[self alloc] initWithTitle:title subTitle:subTitle tarClass:nil block:block];
}
@end
