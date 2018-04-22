//
//  YHTCPSocketServer.h
//  YHPackageLib
//
//  Created by harry on 2018/4/14.
//  Copyright © 2018年 harry. All rights reserved.
//  一个 tcp socket服务器对象

#import <Foundation/Foundation.h>

@protocol YHTCPSocketServerDelegate <NSObject>

@optional
/** 当有客户端连接到服务器时调用 */
/** 当某一客户端端开链接时调用 */
/** 当接收到客户端发送的数据时调用 */
/** 当向客户端发送数据成功时调用 */

@end

@interface YHTCPSocketServer : NSObject

/** 创建一个服务器对象，同时绑定端口号 */
- (instancetype)initWithPort:(UInt16)port;

/** 开始监听，等待客户端连接 */
- (void)startListening;

@end
