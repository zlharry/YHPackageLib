//
//  PLPackingVCGroupModel.m
//  YHPackageLib
//
//  Created by harry on 2018/4/7.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "LibAppGroupModel.h"
#import "LibAppModel.h"

@implementation LibAppGroupModel

- (NSMutableArray<LibAppModel *> *)models
{
    if (!_models) {
        _models = [NSMutableArray array];
    }
    return _models;
}

- (void)addModel:(LibAppModel *)model
{
    [self.models addObject:model];
}

@end
