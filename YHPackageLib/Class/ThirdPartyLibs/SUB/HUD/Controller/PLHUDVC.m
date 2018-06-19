//
//  PLHUDVC.m
//  YHPackageLib
//
//  Created by harry on 2018/5/5.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "PLHUDVC.h"

@interface PLHUDVC ()

@end

@implementation PLHUDVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/** 初始化模型数据 */
- (void)setupGroups
{
    // 第一组
    LibAppGroupModel *group0 = [[LibAppGroupModel alloc] init];
    [self.groups addObject:group0];
    group0.title = @"仅提示";
    [group0 addModel:[LibAppModel modelWithTitle:@"MBProgressHUD"
                                        subTitle:@""
                                           block:^{
                                               NSLog(@"gfkgfg jgj hg h khgk h jh jhhg");
                                           }]];
    
    
    // 第二组
    LibAppGroupModel *group1 = [[LibAppGroupModel alloc] init];
    [self.groups addObject:group1];
    group1.title = @"提示后执行一段代码";
    [group1 addModel:[LibAppModel modelWithTitle:@"定位"
                                        subTitle:@"定位开发练习"
                                           block:^{
                                               NSLog(@"哈哈哈哈哈哈哈哈哈哈");
                                           }]];
    
    
}

@end
