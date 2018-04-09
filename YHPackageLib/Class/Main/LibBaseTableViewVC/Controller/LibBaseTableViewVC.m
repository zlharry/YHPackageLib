//
//  PLMyPackagingVC.m
//  YHPackageLib
//
//  Created by harry on 2018/4/6.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "LibBaseTableViewVC.h"

#import "LibAppCell.h"
#import "LibAppHeadView.h"
//
//#import "LibAppModel.h"
//#import "LibAppGroupModel.h"

@interface LibBaseTableViewVC () <UITableViewDelegate, UITableViewDataSource>

/** table view */
@property (nonatomic, weak) UITableView *tableView;


@end

@implementation LibBaseTableViewVC

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"我的封装"; // 如果在 viewDidLoad 里面设置会出现Tab Bar按钮再次布局，导致出现两个按钮叠加。
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationItem.title = @"我的封装";
    
    [self setupGroups];
    
    [self.tableView reloadData];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.tableView.frame = self.view.bounds;
}

- (NSMutableArray<LibAppGroupModel *> *)groups
{
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    
    return _groups;
}

/** 初始化模型数据 */
- (void)setupGroups
{}


- (UITableView *)tableView
{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:tableView];
        _tableView = tableView;
        
        tableView.dataSource = self;
        tableView.delegate = self;
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.groups[section].models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LibAppCell *cell = [LibAppCell cellWithTableView:tableView];
    
    cell.model = self.groups[indexPath.section].models[indexPath.row];
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    LibAppHeadView *headerView = [LibAppHeadView headerViewWithTableView:tableView];
    
    headerView.groupMode = self.groups[section];
    return headerView;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    LibAppModel *model =self.groups[indexPath.section].models[indexPath.row];
    
    
    if (model.tarClass) {
        [self.navigationController pushViewController:[[model.tarClass alloc] init] animated:YES];
    }
}

@end
