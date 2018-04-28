//
//  YHDropDownListModel.m
//  YHPackageLib
//
//  Created by harry on 2018/4/22.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "YHDropDownListModel.h"

@implementation YHDropDownListModel

- (instancetype)initWithTitle:(NSString *)title
{
    if (self = [super init]) {
        self.title = title;
    }
    return self;
}

+ (instancetype)modelWithTitle:(NSString *)title {return [[self alloc] initWithTitle:title];}

@end
