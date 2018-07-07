//
//  YHSwitchControllerView.m
//  YHPackageLib
//
//  Created by harry on 2018/4/7.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "YHSwitchControllerView.h"

#import "YHSwitchControllerHeaderBar.h"
#import "YHSwitchControllerChangeVCView.h"

@interface YHSwitchControllerView () <YHSwitchControllerHeaderBarDelegate, YHSwitchControllerChangeVCViewDelegate>

/** 子控制器数组 */
@property (nonatomic, strong) NSMutableArray<UIViewController *> *childViewControllers;

/** <#text#> */
@property (nonatomic, weak) YHSwitchControllerHeaderBar *headerBar;
/** <#text#> */
@property (nonatomic, weak) YHSwitchControllerChangeVCView *changeVCView;

@end

@implementation YHSwitchControllerView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor yellowColor];
        
        // 默认基本配置
        /** 工具条高度 */
        self.headBarHeight = 30;
        /** 工具条按钮宽度 */
        self.headBarButtonWidth = 100;
        /** 工具条背景颜色 */
        self.headBarBackgroundColor = [UIColor grayColor];
        /** 工具条标记颜色 */
        self.headBarTagViewBackgroundColor = [UIColor orangeColor];
        /** 工具条按钮字体 */
        self.headBarFont = [UIFont systemFontOfSize:11];
        /** 工具条按钮正常文字颜色 */
        self.headBarButtonNormalTitleColor = [UIColor whiteColor];
        /** 工具条按钮选中文字颜色 */
        self.headBarButtonSelectedTitleColor = [UIColor orangeColor];
        /** 工具条按钮选中背景颜色 */
        self.headBarButtonSelectedBackgroundColor = [UIColor blueColor];
    }
    
    return self;
}



/** 工具条高度 */
- (void)setHeadBarHeight:(CGFloat)headBarHeight
{
    _headBarHeight = headBarHeight;
    
    [self setupFrams];
}
/** 工具条按钮宽度 */
- (void)setHeadBarButtonWidth:(CGFloat)headBarButtonWidth
{
    _headBarButtonWidth = headBarButtonWidth;
    self.headerBar.headBarButtonWidth = headBarButtonWidth;
    
}
/** 工具条背景颜色 */
- (void)setHeadBarBackgroundColor:(UIColor *)headBarBackgroundColor
{
    _headBarBackgroundColor = headBarBackgroundColor;
    self.headerBar.headBarBackgroundColor = headBarBackgroundColor;
}
/** 工具条标记颜色 */
- (void)setHeadBarTagViewBackgroundColor:(UIColor *)headBarTagViewBackgroundColor
{
    _headBarTagViewBackgroundColor = headBarTagViewBackgroundColor;
    self.headerBar.headBarTagViewBackgroundColor = headBarTagViewBackgroundColor;
}
/** 工具条按钮字体 */
- (void)setHeadBarFont:(UIFont *)headBarFont
{
    _headBarFont = headBarFont;
    self.headerBar.headBarFont = headBarFont;
}
/** 工具条按钮正常文字颜色 */
- (void)setHeadBarButtonNormalTitleColor:(UIColor *)headBarButtonNormalTitleColor
{
    _headBarButtonNormalTitleColor = headBarButtonNormalTitleColor;
    self.headerBar.headBarButtonNormalTitleColor = headBarButtonNormalTitleColor;
}
/** 工具条按钮选中文字颜色 */
- (void)setHeadBarButtonSelectedTitleColor:(UIColor *)headBarButtonSelectedTitleColor
{
    _headBarButtonSelectedTitleColor = headBarButtonSelectedTitleColor;
    self.headerBar.headBarButtonSelectedTitleColor = headBarButtonSelectedTitleColor;
}
/** 工具条按钮选中背景颜色 */
- (void)setHeadBarButtonSelectedBackgroundColor:(UIColor *)headBarButtonSelectedBackgroundColor
{
    _headBarButtonSelectedBackgroundColor = headBarButtonSelectedBackgroundColor;
    self.headerBar.headBarButtonSelectedBackgroundColor = headBarButtonSelectedBackgroundColor;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    _selectedIndex = selectedIndex;
    
    // 切换界面到对应的位置
    self.changeVCView.selectedIndex = selectedIndex;
    
    self.headerBar.selectedIndex = selectedIndex;
}


- (NSMutableArray<UIViewController *> *)childViewControllers
{
    if (!_childViewControllers) {
        _childViewControllers = [NSMutableArray array];
    }
    
    return _childViewControllers;
}

- (void)setChildVCs:(NSArray<UIViewController *> *)childVCs
{
    // 1.移除原来的所有控制器
    [self removeAllControllers];
    
    // 2.添加新的控制器
    for (UIViewController *vc in childVCs) {
        [self addChildViewController:vc];
    }
    
    // 3.默认选中第一个
    self.selectedIndex = 0;
}

- (NSArray<UIViewController *> *)childVCs
{
    return _childViewControllers;
}

- (void)addChildViewController:(UIViewController *)childController
{
    // 添加到子控制器数组中
    [self.childViewControllers addObject:childController];
    
    // 添加导航控制器
    if (self.navigationController != nil) {
//        childController.navigationController = self.navigationController;
    }
    
    // 其他操作
    // 1.通知工具条添加了一个控制器
    [self.headerBar addChildViewController:childController];
    
    // 2.通知控制器切换界面添加了控制器
    [self.changeVCView addChildViewController:childController];
}


- (YHSwitchControllerHeaderBar *)headerBar
{
    if (!_headerBar) {
        YHSwitchControllerHeaderBar *headerBar = [[YHSwitchControllerHeaderBar alloc] init];
        [self addSubview:headerBar];
        _headerBar = headerBar;
        
        headerBar.delegate = self;
        
//        headerBar.childViewControllers = self.childViewControllers;
    }
    
    return _headerBar;
}
- (YHSwitchControllerChangeVCView *)changeVCView
{
    if (!_changeVCView) {
        YHSwitchControllerChangeVCView *changeVCView = [[YHSwitchControllerChangeVCView alloc] init];
        [self addSubview:changeVCView];
        _changeVCView = changeVCView;
        
        changeVCView.delegate = self;
    }
    return _changeVCView;
}

- (void)setupFrams
{
    // 顶部工具条布局
    CGFloat headX = 0;
    CGFloat headY = 0;
    CGFloat headW = self.frame.size.width;
    CGFloat headH = self.headBarHeight;
    self.headerBar.frame = CGRectMake(headX, headY, headW, headH);
    
    // 所以控制器View的滚动视图布局
    CGFloat chX = headX;
    CGFloat chY = headY + headH;
    CGFloat chW = headW;
    CGFloat chH = self.frame.size.height - chY;
    self.changeVCView.frame = CGRectMake(chX, chY, chW, chH);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setupFrams];
}


/** 移除了某一个控制器 */
- (void)removeChildViewControllerAtIndexe:(NSInteger)index
{
    if (index < 0 || index >= self.childViewControllers.count) { return ; }
    
    // 通知工具条移除对应按钮
    [self.headerBar removeChildViewControllerAtIndexe:index];
    
    // 通知移除对应的View
    [self.changeVCView removeChildViewControllerAtIndexe:index];
    
    [self.childViewControllers removeObjectAtIndex:index];
}
/** 移除了某一个控制器 */
- (void)removeChildViewController:(UIViewController *)viewController
{
    // 找出对应位置
    NSInteger index = [self.childViewControllers indexOfObject:viewController];
    [self removeChildViewControllerAtIndexe:index];
}

/** 移除所有控制器 */
- (void)removeAllControllers
{
    // 1.移除所有按钮
    [self.headerBar removeAllButtons];
    // 2.移除所有控制器View
    [self.changeVCView removeAllChildViewController];
    // 3.移除所有控制器
    [self.childViewControllers removeAllObjects];
}

#pragma mark - YHSwitchControllerHeaderBarDelegate
- (void)switchControllerHeaderBar:(YHSwitchControllerHeaderBar *)switchControllerHeaderBar didScrollAtScale:(CGFloat)scale
{
    
}

/** 工具条选择了按钮 */
- (void)switchControllerHeaderBar:(YHSwitchControllerHeaderBar *)switchControllerHeaderBar didselectedButtonFrom:(NSInteger)from to:(NSInteger)to
{
    self.changeVCView.selectedIndex = to;
}
#pragma mark - YHSwitchControllerChangeVCViewDelegate
/** 控制器View滑动到了某个比例位置 */
- (void)switchControllerView:(YHSwitchControllerChangeVCView *)switchControllerView didScrollAtScale:(CGFloat)scale
{
    self.headerBar.tagViewXScale = scale;
}
/** 滑动到了某个位置 */
- (void)switchControllerView:(YHSwitchControllerChangeVCView *)switchControllerView didScrollToIndex:(NSInteger)index
{
    if ([self.delegate respondsToSelector:@selector(switchControllerView:didChangeFrom:to:)]) {
        if (self.selectedIndex != index) {
            [self.delegate switchControllerView:self didChangeFrom:self.selectedIndex to:index];
        }
    }
    self.selectedIndex = index; // 更新选择的控制器位置
}


@end
