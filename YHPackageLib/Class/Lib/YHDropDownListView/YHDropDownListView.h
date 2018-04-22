//
//  YHDropDownListView.h
//  YHPackageLib
//
//  Created by harry on 2018/4/22.
//  Copyright © 2018年 harry. All rights reserved.
//  一个下拉列表的控件

#import <UIKit/UIKit.h>
#import "YHDropDownListModel.h"


typedef void (^YHDropDownListViewDidClickedRowBlock) (NSInteger row, YHDropDownListModel *model);

@interface YHDropDownListView : UIView

/** 列表数据模型数组 */
@property (nonatomic, strong) NSArray<YHDropDownListModel *> *models;
/** 点击了某一行的操作 */
@property (nonatomic, copy) YHDropDownListViewDidClickedRowBlock didClickedRowBlock;

+ (instancetype)showInView:(UIView *)view
                actionView:(UIView *)actionView // 触发显示的View
                  listSize:(CGSize)listSize
                    models:(NSArray *)models
        didClickedRowBlock:(YHDropDownListViewDidClickedRowBlock)didClickedRowBlock;

@end
