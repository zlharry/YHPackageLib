//
//  YHTabBarControler.m
//  YHPackageLib
//
//  Created by harry on 2018/4/3.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "YHTabBarControler.h"
#import "YHTabBar.h"
#import "YHTabBarConfigurationModel.h"

@interface YHTabBarControler () <YHTabBarDelegate, UITabBarDelegate>

/** 子控制器模型数组 */
@property (nonatomic, strong) NSArray<YHChildVCModel *> *childVCModels;
/** tabBar配置模型 */
@property (nonatomic, strong) YHTabBarConfigurationModel *tabBarConfiguration;

/** 当自身选择的控制器改变时，是否需要通知tabBar */
@property (nonatomic, assign) BOOL needTelTabBar;
/** 新的TabBar */
@property (nonatomic, weak) YHTabBar *nTabBar;

@end

@implementation YHTabBarControler

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 获取Tabbar的配置
    [self setupTabBarConfiguration:self.tabBarConfiguration];
    
    // 初始化子控制器
    [self initChildViewControllerWithChildVCModels:[self childViewControllerModels:[NSMutableArray array]]];
    
}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 初始化TabBar
    YHTabBar *tabBar = [YHTabBar tabBarWithDelegate:self
                                tabBarConfiguration:self.tabBarConfiguration
                               childViewControllers:self.childViewControllers
                                      childVCModels:self.childVCModels];

    [self.tabBar addSubview:tabBar];
    self.nTabBar = tabBar;
    tabBar.frame = self.tabBar.bounds;
    self.needTelTabBar = YES;
    
    //
    for (UIView *view in self.tabBar.subviews) {
        if ([view isKindOfClass:[UIBarButtonItem class]]) {
            view.hidden = YES;
        }
    }
}

- (YHTabBarConfigurationModel *)tabBarConfiguration
{
    if (!_tabBarConfiguration) {
        _tabBarConfiguration = [[YHTabBarConfigurationModel alloc] init];
    }
    return _tabBarConfiguration;
}
- (void)setTabBarItem:(UITabBarItem *)tabBarItem
{
    [super setTabBarItem:tabBarItem];
    
    NSLog(@"%@", @"dfadsfd");
}

/** 初始化子控制器 */
- (void)initChildViewControllerWithChildVCModels:(NSArray<YHChildVCModel *> *)childVCModels
{
    self.childVCModels = childVCModels;
    
    // 添加子控制器
    for (NSInteger index = 0; index < childVCModels.count; index++) {
        YHChildVCModel *childVCModel = childVCModels[index];
        if (childVCModel.navClassType != NULL) {
            UIViewController *vc = [[childVCModel.classType alloc] init];
            UINavigationController *nav = [[childVCModel.navClassType alloc] initWithRootViewController:vc];
            [self addChildViewController:nav];
        } else {
            [self addChildViewController:[[childVCModel.classType alloc] init]];
        }
        
    }
    
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    if (self.needTelTabBar) {
        [self.nTabBar tabBarControllerSelectFrom:self.selectedIndex to:selectedIndex];
    }
    
    [super setSelectedIndex:selectedIndex];
    
    
    
}

#pragma mark - YHTabBarDelegate
- (void)tabBarSelectFrom:(NSInteger)from to:(NSInteger)to
{
    self.needTelTabBar = NO;
    [self setSelectedIndex:to];
    self.needTelTabBar = YES;
}


@end
