//
//  YHTabBarControler.h
//  YHPackageLib
//
//  Created by harry on 2018/4/3.
//  Copyright © 2018年 harry. All rights reserved.
//

// 使用时继承该类，创建TabBarController
// 注意以后修改badgeValue的时候要获得对应的子控制器的第一个控制器来修改，不然不会出现红色标记

#import <UIKit/UIKit.h>
#import "YHChildVCModel.h"
#import "YHTabBarConfigurationModel.h"


@protocol YHTabBarControllerProtocol <NSObject>

// 必须要实现的协议方法
@required
/** 初始化所有的子控制器 */
- (NSArray<YHChildVCModel *> *)childViewControllerModels:(NSMutableArray<YHChildVCModel *> *)childVCs;
/** 设置TabBar的背景色、高亮文字颜色、文字字体 */
- (void)setupTabBarConfiguration:(YHTabBarConfigurationModel *)tabBarConfiguration;

@end

@interface YHTabBarControler : UITabBarController <YHTabBarControllerProtocol>

@end
