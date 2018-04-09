//
//  YHNavigationController.m
//  YHPackageLib
//
//  Created by harry on 2018/4/6.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "YHNavigationController.h"

@interface YHNavigationController ()

/** 配置导航控制器的配置模型 */
@property (nonatomic, strong) YHNavigationControllerConfigurationModel *configuration;

@end

@implementation YHNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 从协议方法中获取配置信息
    if ([self respondsToSelector:@selector(configurationNavigationControllerWithConfigurationmodel:)]) {
        [self configurationNavigationControllerWithConfigurationmodel:self.configuration];
    }
    
    // 其他按钮的渲染颜色
    self.navigationBar.tintColor = self.configuration.tineColor;
    
    // 标题字体
    NSMutableDictionary *titleTextAttributes = [NSMutableDictionary dictionary];
    titleTextAttributes[NSFontAttributeName] = self.configuration.titleTextFont; // 标题字体
    titleTextAttributes[NSForegroundColorAttributeName] = self.configuration.titleTextColor;// 标题文字颜色
    [self.navigationBar setTitleTextAttributes:titleTextAttributes];
    
    // 背景颜色
    self.navigationBar.barTintColor = self.configuration.barTineColor;
    
    
}

- (YHNavigationControllerConfigurationModel *)configuration
{
    if (!_configuration) {
        _configuration = [[YHNavigationControllerConfigurationModel alloc] init];
    }
    return _configuration;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//     //自定义统一返回按钮
//    NSString *backStr = @"";
//    switch (self.configuration.backButtonStyle) {
//        case navigationBarBackButtonStyleSystem: // 跟随系统返回样式
//        {
//            backStr = [[self topViewController] title];
//            break;
//        }
//
//        case navigationBarBackButtonStyleBackArrow: // 只用一个箭头的返回样式
//        {
//            backStr = @"9090";
//            break;
//        }
//
//        case navigationBarBackButtonStyleBackArrowAndBackStr: // 有箭头和返回按钮的样式
//        {
//            backStr = @"返回";
//            break;
//        }
//    }
//
    viewController.navigationItem.backBarButtonItem  = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]; // 使返回按钮只有一个箭头
    
    // 从第二个控制器开始push的时候就隐藏 tabBar
    if (self.childViewControllers.count == 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    [super prepareForSegue:segue sender:sender];
//
//}



@end
