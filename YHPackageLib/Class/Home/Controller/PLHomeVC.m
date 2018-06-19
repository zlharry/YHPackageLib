//
//  PLHomeVC.m
//  YHPackageLib
//
//  Created by harry on 2018/4/3.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "PLHomeVC.h"

#import "YHAFTool.h"
#import "NSData+YH.h"
@interface PLHomeVC ()

@end

@implementation PLHomeVC

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"首页"; // 如果在 viewDidLoad 里面设置会出现Tab Bar按钮再次布局，导致出现两个按钮叠加。
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"首页";
    
    NSData *ipaData = [NSData dataWithContentsOfFile:@"/Users/sunshine/Desktop/SmartClient.ipa"];
    NSLog(@"发布：%@", [ipaData md5String]);
    NSData *testIpaData = [NSData dataWithContentsOfFile:@"/Users/sunshine/Developer/Publish/SmartClientPublish/SmartClientV5.2.5 正式发布/测试版本/SmartClient 2018-05-24 16-35-52/SmartClient.ipa"];
    NSLog(@"测试：%@", [testIpaData md5String]);
    
    
    
    // 发送测试请求
    [YHAFTool GETData:@"http://cdn.cocimg.com/bbs/attachment/upload/03/1643031429686718.jpg"
       parameters:nil
          success:^(NSData *responseObject) {
              NSLog(@"%@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
              [responseObject writeToFile:@"/Users/sunshine/Desktop/test.jpg" atomically:YES];
        ;
          }
          failure:^(NSError *error) {
              NSLog(@"%@", error);
          }];
    
}

@end
