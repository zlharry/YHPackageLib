//
//  DropDownListVC.m
//  YHPackageLib
//
//  Created by harry on 2018/4/22.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "DropDownListVC.h"
#import "YHDropDownListView.h"

@interface DropDownListVC ()

@end

@implementation DropDownListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton *btn  = [[UIButton alloc] init];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(50, 200, 100, 40);
    
    btn.backgroundColor = [UIColor blueColor];
    
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClicked:(UIButton *)btn
{
    NSMutableArray *models = [NSMutableArray array];
    [models addObject:[YHDropDownListModel modelWithTitle:@"第一"]];
    [models addObject:[YHDropDownListModel modelWithTitle:@"第二"]];
    [models addObject:[YHDropDownListModel modelWithTitle:@"第三"]];
    [models addObject:[YHDropDownListModel modelWithTitle:@"第一"]];
    [models addObject:[YHDropDownListModel modelWithTitle:@"第二"]];
    [models addObject:[YHDropDownListModel modelWithTitle:@"第三"]];
    [models addObject:[YHDropDownListModel modelWithTitle:@"第一"]];
    [models addObject:[YHDropDownListModel modelWithTitle:@"第二"]];
    [models addObject:[YHDropDownListModel modelWithTitle:@"第三"]];
    
    [YHDropDownListView showInView:self.view
                        actionView:btn
                          listSize:CGSizeMake(200, 200)
                            models:models
                didClickedRowBlock:^(NSInteger row, YHDropDownListModel *model) {
                    NSLog(@"%ld -- %@", row, model.title);
                }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
