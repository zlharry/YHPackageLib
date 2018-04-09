//
//  YHTabBar.h
//  YHPackageLib
//
//  Created by harry on 2018/4/3.
//  Copyright © 2018年 harry. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHChildVCModel, YHTabBarConfigurationModel;

@protocol YHTabBarDelegate <NSObject>

@optional
// 当TabBar上的按钮被点击了
- (void)tabBarSelectFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface YHTabBar : UIView

/** 子控制器数组 */
@property (nonatomic, weak) NSArray<UIViewController *> *childViewControllers;
/** 子控制器模型数组 */
@property (nonatomic, weak) NSArray<YHChildVCModel *> *childVCModels;
/** 代理 */
@property (nonatomic, weak) id<YHTabBarDelegate> delegate;

///** 正常状态字体颜色 */
//@property (nonatomic, strong) UIColor *normalTextColor;
///** 选择状态字体颜色 */
//@property (nonatomic, strong) UIColor *selectedTextColor;
///** 按钮字体 */
//@property (nonatomic, strong) UIFont *btnFont;

/** tabBar的配置模型 */
@property (nonatomic, strong) YHTabBarConfigurationModel *configuration;


/** 控制器从第几个控制器到第几个控制器 */
- (void)tabBarControllerSelectFrom:(NSInteger)from to:(NSInteger)to;


/** 快速创建一个TabBar
 *
 */
- (instancetype)initWithDelegate:(id<YHTabBarDelegate>)delegate
             tabBarConfiguration:(YHTabBarConfigurationModel *)tabBarConfiguration
            childViewControllers:(NSArray<UIViewController *> *)childViewControllers
                   childVCModels:(NSArray<YHChildVCModel *> *)childVCModels;
/** 快速创建一个TabBar
 *
 */
+ (instancetype)tabBarWithDelegate:(id<YHTabBarDelegate>)delegate
               tabBarConfiguration:(YHTabBarConfigurationModel *)tabBarConfiguration
              childViewControllers:(NSArray<UIViewController *> *)childViewControllers
                     childVCModels:(NSArray<YHChildVCModel *> *)childVCModels;




@end
