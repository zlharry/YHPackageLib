//
//  PLSDKIntergrationVC.m
//  YHPackageLib
//
//  Created by harry on 2018/4/6.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "PLSDKIntergrationVC.h"

@interface PLSDKIntergrationVC ()

@end

@implementation PLSDKIntergrationVC

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"SDK集成"; // 如果在 viewDidLoad 里面设置会出现Tab Bar按钮再次布局，导致出现两个按钮叠加。
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
