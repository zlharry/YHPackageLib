//
//  YHNavigationControllerConfigurationModel.h
//  YHPackageLib
//
//  Created by harry on 2018/4/6.
//  Copyright © 2018年 harry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//typedef NS_ENUM(NSInteger, YHNavigationBarBackButtonStyle) {
//    navigationBarBackButtonStyleSystem,             // 默认为系统原来的样式
//    navigationBarBackButtonStyleBackArrow,          // 只有一个返回箭头的样式
//    navigationBarBackButtonStyleBackArrowAndBackStr // 有返回箭头和“返回”的样式
//};

@interface YHNavigationControllerConfigurationModel : NSObject

/** 导航栏的背景颜色 */
@property (nonatomic, strong) UIColor *barTineColor;
/** 导航栏标题字体 */
@property (nonatomic, strong) UIFont *titleTextFont;
/** 导航栏标题文字颜色 */
@property (nonatomic, strong) UIColor *titleTextColor;
/** 导航栏其他按钮的主题颜色 */
@property (nonatomic, strong) UIColor *tineColor;

@end
