//
//  PLPackingVCGroupModel.h
//  YHPackageLib
//
//  Created by harry on 2018/4/7.
//  Copyright © 2018年 harry. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LibAppModel;

@interface LibAppGroupModel : NSObject

/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 模型数组 */
@property (nonatomic, strong) NSMutableArray<LibAppModel *> *models;

- (void)addModel:(LibAppModel *)model;

@end
