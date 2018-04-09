//
//  LibBaseTableViewVC.h
//  YHPackageLib
//
//  Created by harry on 2018/4/6.
//  Copyright © 2018年 harry. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "LibAppModel.h"
#import "LibAppGroupModel.h"

@class LibAppGroupModel;
@interface LibBaseTableViewVC : UIViewController

/** 组数据模型 */
@property (nonatomic, strong) NSMutableArray<LibAppGroupModel *> *groups;

/** 初始化模型数据(子类需要重写该方法) */
- (void)setupGroups;

@end
