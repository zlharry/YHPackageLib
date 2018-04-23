//
//  PLMyPackagingVC.m
//  YHPackageLib
//
//  Created by harry on 2018/4/6.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "PLMyPackagingVC.h"


#import "PLSwitchVC.h"
#import "DropDownListVC.h"


@interface PLMyPackagingVC ()

@end

@implementation PLMyPackagingVC

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"我的封装"; // 如果在 viewDidLoad 里面设置会出现Tab Bar按钮再次布局，导致出现两个按钮叠加。
    }
    return self;
    
}

/** 初始化模型数据 */
- (void)setupGroups
{
    // 第一组
    LibAppGroupModel *group0 = [[LibAppGroupModel alloc] init];
    [self.groups addObject:group0];
    group0.title = @"普通UI控件";
    [group0 addModel:[LibAppModel modelWithTitle:@"YHSwitchController"
                                        subTitle:@"在顶部有一个工具条，可以在多个控制器之间切换"
                                        tarClass:[PLSwitchVC class]]];
    [group0 addModel:[LibAppModel modelWithTitle:@"DropDownListVC"
                                        subTitle:@"一个下拉列表的封装"
                                        tarClass:[DropDownListVC class]]];
   
    
//    // 第二组
//    LibAppGroupModel *group1 = [[LibAppGroupModel alloc] init];
//    [self.groups addObject:group1];
//    group1.title = @"地图、定位";
//    [group1 addModel:[LibAppModel modelWithTitle:@"定位"
//                                        subTitle:@"定位开发练习"
//                                        tarClass:[UIViewController class]]];
//
    
}

@end
