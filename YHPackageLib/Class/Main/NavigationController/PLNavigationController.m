//
//  PLNavigationController.m
//  YHPackageLib
//
//  Created by harry on 2018/4/6.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "PLNavigationController.h"

@interface PLNavigationController ()

@end

@implementation PLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configurationNavigationControllerWithConfigurationmodel:(YHNavigationControllerConfigurationModel *)configurationModel
{
    configurationModel.barTineColor = [UIColor colorWithRed:36/255.0 green:145/255.0 blue:252/255.0 alpha:1.0];
    configurationModel.titleTextColor = [UIColor whiteColor];
    configurationModel.titleTextFont = [UIFont boldSystemFontOfSize:20];
    configurationModel.tineColor = [UIColor whiteColor];
}



@end
