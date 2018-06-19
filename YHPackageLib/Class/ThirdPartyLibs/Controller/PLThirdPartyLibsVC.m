//
//  PLThirdPartyLibsVC.m
//  YHPackageLib
//
//  Created by harry on 2018/4/6.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "PLThirdPartyLibsVC.h"

#import "PLHUDVC.h"

@interface PLThirdPartyLibsVC ()

@end

@implementation PLThirdPartyLibsVC

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"第三方库"; // 如果在 viewDidLoad 里面设置会出现Tab Bar按钮再次布局，导致出现两个按钮叠加。
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


/** 初始化模型数据 */
- (void)setupGroups
{
    // 第一组
    LibAppGroupModel *group0 = [[LibAppGroupModel alloc] init];
    [self.groups addObject:group0];
    group0.title = @"UI控件";
    [group0 addModel:[LibAppModel modelWithTitle:@"MBProgressHUD"
                                        subTitle:@"一个用户提示的第三方库"
                                        tarClass:[PLHUDVC class]]];
    
    
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
