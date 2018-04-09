//
//  YHTabBarConfigurationModel.h
//  YHPackageLib
//
//  Created by harry on 2018/4/5.
//  Copyright © 2018年 harry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YHTabBarConfigurationModel : NSObject

/** 开始默认选择第几个控制器 */
@property (nonatomic, assign) NSInteger defaultSelectedIndex;
/** tabBarButton的字体 */
@property (nonatomic, strong) UIFont *tabBarButtonFont;
/** 选中时按钮文字颜色 */
@property (nonatomic, strong) UIColor *btnSelectedTitleColor;
/** 正常时按钮文字颜色  */
@property (nonatomic, strong) UIColor *btnNormalTitleColor;
/** tabBar背景颜色 */
@property (nonatomic, strong) UIColor *tabBarBackgroundColor;

@end
