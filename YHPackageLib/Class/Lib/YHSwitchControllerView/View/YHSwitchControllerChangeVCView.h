//
//  YHSwitchControllerChangeVCView.h
//  YHPackageLib
//
//  Created by harry on 2018/4/7.
//  Copyright © 2018年 harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YHSwitchControllerChangeVCView;

@protocol YHSwitchControllerChangeVCViewDelegate <NSObject>
@optional
/** 滑动到了某个比例 */
- (void)switchControllerView:(YHSwitchControllerChangeVCView *)switchControllerView didScrollAtScale:(CGFloat)scale;
/**  */
- (void)switchControllerView:(YHSwitchControllerChangeVCView *)switchControllerView didScrollToIndex:(NSInteger)index;

@end

@interface YHSwitchControllerChangeVCView : UIView


/** 切换到特定的控制器 */
@property (nonatomic, assign) NSInteger selectedIndex;

/** 代理对象 */
@property (nonatomic, weak) id<YHSwitchControllerChangeVCViewDelegate> delegate;

/** 添加了一个控制器 */
- (void)addChildViewController:(UIViewController *)viewController;

/** 移除了某一个控制器 */
- (void)removeChildViewControllerAtIndexe:(NSInteger)indexe;

/** 移除所有控制器 */
- (void)removeAllChildViewController;
@end
