//
//  PLMyPackingVCCell.h
//  YHPackageLib
//
//  Created by harry on 2018/4/7.
//  Copyright © 2018年 harry. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LibAppModel;
@interface LibAppCell : UITableViewCell

/** 数据模型 */
@property (nonatomic, strong) LibAppModel *model;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
