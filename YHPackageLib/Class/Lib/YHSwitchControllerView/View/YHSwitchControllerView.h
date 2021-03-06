//
//  YHSwitchControllerView.h
//  YHPackageLib
//
//  Created by harry on 2018/4/7.
//  Copyright © 2018年 harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YHSwitchControllerView;

@protocol YHSwitchControllerViewDelegate <NSObject>
/** 用户从某个控制器切换到某个控制器 */
- (void)switchControllerView:(YHSwitchControllerView *)switchControllerView didChangeFrom:(NSInteger)from to:(NSInteger)to;
@end

@interface YHSwitchControllerView : UIView

/** 当前显示的是哪个控制器 默认是 0 */
@property (nonatomic, assign) NSInteger selectedIndex;


/** 工具条高度 */
@property (nonatomic, assign) CGFloat headBarHeight;
/** 工具条按钮宽度 */
@property (nonatomic, assign) CGFloat headBarButtonWidth;
/** 工具条背景颜色 */
@property (nonatomic, strong) UIColor *headBarBackgroundColor;
/** 工具条标记颜色 */
@property (nonatomic, strong) UIColor *headBarTagViewBackgroundColor;
/** 工具条按钮字体 */
@property (nonatomic, strong) UIFont *headBarFont;
/** 工具条按钮正常文字颜色 */
@property (nonatomic, strong) UIColor *headBarButtonNormalTitleColor;
/** 工具条按钮选中文字颜色 */
@property (nonatomic, strong) UIColor *headBarButtonSelectedTitleColor;
/** 工具条按钮选中背景颜色 */
@property (nonatomic, strong) UIColor *headBarButtonSelectedBackgroundColor;


/** 外部的导航控制器 */
@property (nonatomic, weak) UINavigationController *navigationController;

/** 子控制器数组 */
@property (nonatomic, strong) NSArray<UIViewController *> *childVCs;

/** 代理对象 */
@property (nonatomic, weak) id<YHSwitchControllerViewDelegate> delegate;

/** 添加子控制器 */
- (void)addChildViewController:(UIViewController *)childController;


/** 移除了某一个控制器 */
- (void)removeChildViewControllerAtIndexe:(NSInteger)index;
/** 移除了某一个控制器 */
- (void)removeChildViewController:(UIViewController *)viewController;

/** 移除所有控制器 */
- (void)removeAllControllers;

@end
