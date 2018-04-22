//
//  YHDropDownListModel.h
//  YHPackageLib
//
//  Created by harry on 2018/4/22.
//  Copyright © 2018年 harry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHDropDownListModel : NSObject

/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 图标资源名 */
@property (nonatomic, copy) NSString *iconName;

- (instancetype)initWithTitle:(NSString *)title;
+ (instancetype)modelWithTitle:(NSString *)title;

@end
