//
//  YHTabBar.m
//  YHPackageLib
//
//  Created by harry on 2018/4/3.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "YHTabBar.h"
#import "YHTabBarButton.h"
#import "YHChildVCModel.h"
#import "YHTabBarConfigurationModel.h"

@interface YHTabBar ()
/** 所有按钮数组 */
@property (nonatomic, strong) NSMutableArray<YHTabBarButton *> *tabBarButtons;
/** 当前选择的按钮 */
@property (nonatomic, weak) YHTabBarButton *currentSelectedBtn;

@end

@implementation YHTabBar

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}
/** 快速创建一个TabBar
 *
 */
- (instancetype)initWithDelegate:(id<YHTabBarDelegate>)delegate
             tabBarConfiguration:(YHTabBarConfigurationModel *)tabBarConfiguration
            childViewControllers:(NSArray<UIViewController *> *)childViewControllers
                   childVCModels:(NSArray<YHChildVCModel *> *)childVCModels
{
    if (self = [super init]) {
        self.delegate = delegate;
        self.configuration = tabBarConfiguration;
        self.childVCModels = childVCModels;
        self.childViewControllers = childViewControllers;
//        self.childVCModels = childVCModels;
    }
    return self;
}
/** 快速创建一个TabBar
 *
 */
+ (instancetype)tabBarWithDelegate:(id<YHTabBarDelegate>)delegate
               tabBarConfiguration:(YHTabBarConfigurationModel *)tabBarConfiguration
              childViewControllers:(NSArray<UIViewController *> *)childViewControllers
                     childVCModels:(NSArray<YHChildVCModel *> *)childVCModels
{
    return [[self alloc] initWithDelegate:delegate
                      tabBarConfiguration:tabBarConfiguration
                     childViewControllers:childViewControllers
                            childVCModels:childVCModels];
}

- (NSMutableArray<YHTabBarButton *> *)tabBarButtons
{
    if (!_tabBarButtons) {
        _tabBarButtons = [NSMutableArray array];
    }
    
    return _tabBarButtons;
}


- (void)setChildViewControllers:(NSArray<UIViewController *> *)childViewControllers
{
    _childViewControllers = childViewControllers;
    
    // 添加观察者
    for (NSInteger index = 0; index < childViewControllers.count; index++) {
        UIViewController *vc = childViewControllers[index];
        UIViewController *tarVC = nil;
        if ([vc isKindOfClass:[UINavigationController class]]) {
            tarVC = [vc.childViewControllers firstObject];
        } else {
            tarVC = vc;
        }
        
        [tarVC addObserver:self.tabBarButtons[index]
                forKeyPath:@"tabBarItem.badgeValue"
                   options:1 | 2
                   context:nil];
        [tarVC addObserver:self.tabBarButtons[index]
                forKeyPath:@"tabBarItem.title"
                   options:1 | 2
                   context:nil];
    }
}

- (void)setConfiguration:(YHTabBarConfigurationModel *)configuration
{
    _configuration = configuration;
    
    self.backgroundColor = configuration.tabBarBackgroundColor;
    for (YHTabBarButton *btn in self.tabBarButtons) {
        [btn.titleLabel setFont:configuration.tabBarButtonFont];
        [btn setTitleColor:configuration.btnNormalTitleColor forState:UIControlStateNormal];
        [btn setTitleColor:configuration.btnSelectedTitleColor forState:UIControlStateSelected];
    }
}

- (void)setChildVCModels:(NSArray<YHChildVCModel *> *)childVCModels
{
    _childVCModels = childVCModels;
    
    // 生成对应个数的按钮
    for (NSInteger index = 0; index < childVCModels.count; index++) {
        YHTabBarButton *btn = [[YHTabBarButton alloc] init];
        [self addSubview:btn];
        [self.tabBarButtons addObject:btn];
        btn.tag = index;
        
        [btn.titleLabel setFont:self.configuration.tabBarButtonFont];
        [btn setTitleColor:self.configuration.btnNormalTitleColor forState:UIControlStateNormal];
        [btn setTitleColor:self.configuration.btnSelectedTitleColor forState:UIControlStateSelected];
        
        YHChildVCModel *childVCModel = childVCModels[index];
        [btn setTitle:childVCModel.title forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:childVCModel.normalIconName]
             forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:childVCModel.selectedIconName]
             forState:UIControlStateSelected];
        
        [btn addTarget:self
                action:@selector(btnClicked:)
      forControlEvents:UIControlEventTouchDown];
        if (self.configuration.defaultSelectedIndex >= 0 && self.configuration.defaultSelectedIndex < childVCModels.count) {
            if (index == self.configuration.defaultSelectedIndex) {
                [self btnClicked:btn];
            }
        } else {
            if (index == 0) {
                [self btnClicked:btn];
            }
        }
        
    }
}

/** 点击了某一个按钮 */
- (void)btnClicked:(YHTabBarButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(tabBarSelectFrom:to:)]) {
        [self.delegate tabBarSelectFrom:self.currentSelectedBtn.tag to:btn.tag];
    }
    
    self.currentSelectedBtn.selected = NO;
    btn.selected = YES;
    self.currentSelectedBtn = btn;
}

/** 控制器从第几个控制器到第几个控制器 */
- (void)tabBarControllerSelectFrom:(NSInteger)from to:(NSInteger)to
{
    //
    YHTabBarButton *btn = self.tabBarButtons[to];
    self.currentSelectedBtn.selected = NO;
    btn.selected = YES;
    self.currentSelectedBtn = btn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = self.frame.size.width / self.tabBarButtons.count;
    CGFloat btnH = self.frame.size.height;
    for (NSInteger index = 0; index < self.tabBarButtons.count; index++) {
        YHTabBarButton *btn = self.tabBarButtons[index];
        btnX = btnW * index;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}

@end
