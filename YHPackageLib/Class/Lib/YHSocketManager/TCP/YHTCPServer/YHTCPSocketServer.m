//
//  YHTCPSocketServer.m
//  YHPackageLib
//
//  Created by harry on 2018/4/14.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "YHTCPSocketServer.h"

#import "GCDAsyncSocket.h"

@interface YHTCPSocketServer ()

/** TCP socket 服务器 */
@property (nonatomic, strong) GCDAsyncSocket *tcpSocketServer;
/** socket  队列 */
@property (nonatomic, strong) dispatch_queue_t socketQueue;
/** 代理 队列 */
@property (nonatomic, strong) dispatch_queue_t delegateQueue;

@end

@implementation YHTCPSocketServer

@end
