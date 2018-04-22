//
//  YHDropDownListView.m
//  YHPackageLib
//
//  Created by harry on 2018/4/22.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "YHDropDownListView.h"

static NSString *cellID = @"cell_IDID";
static NSTimeInterval animationTime = 0.3;


@interface YHDropDownListView () <UITableViewDelegate, UITableViewDataSource>
/** <#text#> */
@property (nonatomic, weak) UITableView *tableView;
/** <#text#> */
@property (nonatomic, weak) UIView *actionView;

/** 列表的大小 */
@property (nonatomic, assign) CGSize listSize;
@end


@implementation YHDropDownListView
- (UITableView *)tableView
{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self addSubview:tableView];
        _tableView = tableView;
        
        tableView.dataSource = self;
        tableView.delegate = self;
        
        tableView.contentInset = UIEdgeInsetsMake(-35,// 上
                                                  0,// 左
                                                  -37,// 下
                                                  0); //右
        
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    }
    return _tableView;
}

- (void)setModels:(NSArray<YHDropDownListModel *> *)models
{
    _models = models;
    
    [self.tableView reloadData]; // 刷新列表
}


+ (instancetype)showInView:(UIView *)view //
                actionView:(UIView *)actionView // 触发显示的View
                  listSize:(CGSize)listSize
                    models:(NSArray *)models
        didClickedRowBlock:(YHDropDownListViewDidClickedRowBlock)didClickedRowBlock
{
    YHDropDownListView *dropdownView = [[YHDropDownListView alloc] init];
    dropdownView.backgroundColor = [UIColor clearColor];
    dropdownView.actionView = actionView;
    dropdownView.listSize = listSize;
    dropdownView.models = models;
    dropdownView.didClickedRowBlock = didClickedRowBlock;
    
    [view addSubview:dropdownView];
    
    
    dropdownView.frame = view.bounds;
    
    // 动画显示
    CGFloat beginW = listSize.width;
    CGFloat beginH = 0;
    CGFloat beginX = actionView.frame.origin.x + (actionView.frame.size.width - beginW) * 0.5;
    CGFloat beginY = CGRectGetMaxY(actionView.frame);
    dropdownView.tableView.frame = CGRectMake(beginX, beginY, beginW, beginH);
    
    [UIView animateWithDuration:animationTime
                     animations:^{
                         CGFloat endX = beginX;
                         CGFloat endY = beginY;
                         CGFloat endW = beginW;
                         CGFloat endH = listSize.height;
                         dropdownView.tableView.frame = CGRectMake(endX, endY, endW, endH);
                     }];
    
    
    [dropdownView.tableView reloadData];
    
    return dropdownView;
}

/** 退出下拉列表 */
- (void)exit
{
    // 退出下拉列表
    CGRect endFrame = self.tableView.frame;
    endFrame.size.height = 0;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:animationTime
                     animations:^{
                         weakSelf.tableView.frame = endFrame;
                     } completion:^(BOOL finished) {
                         
                         [weakSelf removeFromSuperview];
                     }];
}

#pragma mark - UITableViewDataSource begin
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    YHDropDownListModel *model = self.models[indexPath.row];
    
    cell.textLabel.text = model.title;
    
    return cell;
}
#pragma mark - UITableViewDataSource end

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.didClickedRowBlock) {
        self.didClickedRowBlock(indexPath.row, self.models[indexPath.row]);
    }
    
    // 退出下拉列表
    [self exit];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self exit]; // 退出
}

@end
