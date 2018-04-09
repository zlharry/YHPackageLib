//
//  PLSwitchVC.m
//  YHPackageLib
//
//  Created by harry on 2018/4/7.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "PLSwitchVC.h"

#import "YHSwitchControllerView.h"

@interface PLSwitchVC ()

/** <#text#> */
@property (nonatomic, weak) YHSwitchControllerView *switchVCView;

@end

@implementation PLSwitchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"切换多个控制器";
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat svcX = 0;
    CGFloat svcY = 64;
    CGFloat svcW = self.view.frame.size.width;
    CGFloat svcH = self.view.frame.size.height - svcY;
    self.switchVCView.frame = CGRectMake(svcX, svcY, svcW, svcH);
    self.switchVCView.headBarButtonWidth = 50;
//    self.switchVCView.headBarButtonSelectedBackgroundColor = [UIColor redColor];
    
    // 测试添加控制器
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.title = @"第一个";
    vc1.view.backgroundColor = [UIColor redColor];
    //    [self.switchVCView addChildViewController:vc1];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.title = @"第二个";
    vc2.view.backgroundColor = [UIColor greenColor];
    //    [self.switchVCView addChildViewController:vc2];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.title = @"第三个";
    vc3.view.backgroundColor = [UIColor blueColor];
    //    [self.switchVCView addChildViewController:vc3];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.title = @"第四个";
    vc4.view.backgroundColor = [UIColor redColor];
    //    [self.switchVCView addChildViewController:vc1];
    
    UIViewController *vc5 = [[UIViewController alloc] init];
    vc5.title = @"第五个";
    vc5.view.backgroundColor = [UIColor greenColor];
    //    [self.switchVCView addChildViewController:vc2];
    
    UIViewController *vc6 = [[UIViewController alloc] init];
    vc6.title = @"第六个";
    vc6.view.backgroundColor = [UIColor blueColor];
    //    [self.switchVCView addChildViewController:vc3];
    
    self.switchVCView.childVCs = @[vc1, vc2, vc3, vc4, vc5, vc6];
    
//    __weak typeof(self) weakSelf = self;
//    dispatch_async(dispatch_queue_create("djhfka", DISPATCH_QUEUE_CONCURRENT), ^{
//        sleep(5);
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [weakSelf.switchVCView removeChildViewControllerAtIndexe:1];
//        });
//    });
}

- (YHSwitchControllerView *)switchVCView
{
    if (!_switchVCView) {
        YHSwitchControllerView *switchVCView = [[YHSwitchControllerView alloc] init];
        [self.view addSubview:switchVCView];
        _switchVCView = switchVCView;
    }
    return _switchVCView;
}

@end
