//
//  YHTCPSocket.m
//  YHPackageLib
//
//  Created by harry on 2018/4/12.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "YHTCPSocket.h"

#import "GCDAsyncSocket.h"

@interface YHTCPSocket ()

/** TCP客户端 */
@property (nonatomic, strong) GCDAsyncSocket *socketClient;

@end

@implementation YHTCPSocket
#pragma mark - 延迟加载 begin
/** TCP客户端 */
- (GCDAsyncSocket *)socketClient
{
    if (!_socketClient) {
        _socketClient = [[GCDAsyncSocket alloc] init];
    }
    return _socketClient;
    
}


@end
