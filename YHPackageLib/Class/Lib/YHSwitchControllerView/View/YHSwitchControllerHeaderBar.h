//
//  YHSwitchControllerHeaderBar.h
//  YHPackageLib
//
//  Created by harry on 2018/4/7.
//  Copyright © 2018年 harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YHSwitchControllerHeaderBar;

@protocol YHSwitchControllerHeaderBarDelegate <NSObject>
@optional
//
- (void)switchControllerHeaderBar:(YHSwitchControllerHeaderBar *)switchControllerHeaderBar didScrollAtScale:(CGFloat)scale;
- (void)switchControllerHeaderBar:(YHSwitchControllerHeaderBar *)switchControllerHeaderBar  didselectedButtonFrom:(NSInteger)from to:(NSInteger)to;
@end

@interface YHSwitchControllerHeaderBar : UIView

/** <#text#> */
@property (nonatomic, weak) id<YHSwitchControllerHeaderBarDelegate> delegate;


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

/** 标记View的X所在的比例 */
@property (nonatomic, assign) CGFloat tagViewXScale;



/** 添加了一个控制器 */
- (void)addChildViewController:(UIViewController *)viewController;

/** 移除了某一个控制器 */
- (void)removeChildViewControllerAtIndexe:(NSInteger)indexe;

@end
