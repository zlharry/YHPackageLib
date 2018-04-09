//
//  PLMyPackingVCHeaderView.h
//  YHPackageLib
//
//  Created by harry on 2018/4/7.
//  Copyright © 2018年 harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LibAppGroupModel;

@interface LibAppHeadView : UITableViewHeaderFooterView

/** 数据模型 */
@property (nonatomic, strong) LibAppGroupModel *groupMode;

+ (instancetype)headerViewWithTableView:(UITableView *)tableView;

@end
