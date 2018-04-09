//
//  PLTabBarController.m
//  YHPackageLib
//
//  Created by harry on 2018/4/3.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "PLTabBarController.h"

#import "PLNavigationController.h"

#import "PLHomeVC.h"
#import "PLMyPackagingVC.h"
#import "PLSDKIntergrationVC.h"
#import "PLThirdPartyLibsVC.h"
#import "PLMeVC.h"

@interface PLTabBarController ()

@end

@implementation PLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSArray<YHChildVCModel *> *)childViewControllerModels:(NSMutableArray<YHChildVCModel *> *)childVCs
{
    [childVCs addObject:[YHChildVCModel vcModelWithTitle:@"首页"
                                          normalIconName:@"tabBar_0"
                                        selectedIconName:@"tabBar_0HL"
                                               classType:[PLHomeVC class]
                                            navClassType:[PLNavigationController class]]];
    [childVCs addObject:[YHChildVCModel vcModelWithTitle:@"我的封装"
                                          normalIconName:@"tabBar_1"
                                        selectedIconName:@"tabBar_1HL"
                                               classType:[PLMyPackagingVC class]
                                            navClassType:[PLNavigationController class]]];
    [childVCs addObject:[YHChildVCModel vcModelWithTitle:@"SDK集成"
                                          normalIconName:@"tabBar_2"
                                        selectedIconName:@"tabBar_2HL"
                                               classType:[PLSDKIntergrationVC class]
                                            navClassType:[PLNavigationController class]]];
    [childVCs addObject:[YHChildVCModel vcModelWithTitle:@"第三方库"
                                          normalIconName:@"tabBar_3"
                                        selectedIconName:@"tabBar_3HL"
                                               classType:[PLThirdPartyLibsVC class]
                                            navClassType:[PLNavigationController class]]];
    [childVCs addObject:[YHChildVCModel vcModelWithTitle:@"我"
                                          normalIconName:@"tabBar_3"
                                        selectedIconName:@"tabBar_3HL"
                                               classType:[PLMeVC class]
                                            navClassType:[PLNavigationController class]]];
    
    return [childVCs copy];
}

- (void)setupTabBarConfiguration:(YHTabBarConfigurationModel *)tabBarConfiguration
{
    tabBarConfiguration.tabBarBackgroundColor = [UIColor whiteColor];
    tabBarConfiguration.btnNormalTitleColor = [UIColor colorWithRed:186/255.0 green:197/255.0 blue:209/255.0 alpha:1.0];
    tabBarConfiguration.btnSelectedTitleColor = [UIColor colorWithRed:36/255.0 green:145/255.0 blue:252/255.0 alpha:1.0];
    tabBarConfiguration.tabBarButtonFont = [UIFont boldSystemFontOfSize:10];
    tabBarConfiguration.defaultSelectedIndex = 0;
}

@end
