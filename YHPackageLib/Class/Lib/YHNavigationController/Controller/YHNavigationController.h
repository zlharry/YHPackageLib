//
//  YHNavigationController.h
//  YHPackageLib
//
//  Created by harry on 2018/4/6.
//  Copyright © 2018年 harry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHNavigationControllerConfigurationModel.h"


@protocol YHNavigationControllerProtocol <NSObject>
@optional
// 配导航控制器统一样式置统一样式
- (void)configurationNavigationControllerWithConfigurationmodel:(YHNavigationControllerConfigurationModel *)configurationModel;
@end

@interface YHNavigationController : UINavigationController <YHNavigationControllerProtocol>

@end
