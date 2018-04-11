//
//  YHAFTool.h
//  YHPackageLib
//
//  Created by harry on 2018/4/10.
//  Copyright © 2018年 harry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHAFTool : NSObject

#pragma mark - GET 请求 begin
/** 异步发送一个GET请求，返回下载的数据
 *  URLString   : 请求的URL路径
 *  parameters  : 请求参数，字典形式
 *  success     : 请求成功后调用的block
 *  failure     : 请求失败后调用的block
 *  return      : 返回一个 NSURLSessionDataTask 以以便于可以取消该次请求等操作
 */
+ (NSURLSessionDataTask *)GETData:(NSString *)URLString
                       parameters:(nullable NSDictionary *)parameters
                          success:(nullable void (^)(NSData *responseObject))success
                          failure:(nullable void (^)(NSError *error))failure;


/** 异步发送一个GET请求,用于请求返回 Json 的请求。
 *  URLString   : 请求的URL路径
 *  parameters  : 请求参数，字典形式
 *  success     : 请求成功后调用的block
 *  failure     : 请求失败后调用的block
 *  return      : 返回一个 NSURLSessionDataTask 以以便于可以取消该次请求等操作
*/
+ (NSURLSessionDataTask *)GETJson:(NSString *)URLString
                       parameters:(nullable NSDictionary *)parameters
                          success:(nullable void (^)(NSDictionary *responseObject))success
                          failure:(nullable void (^)(NSError *error))failure;

#pragma mark - GET 请求 end

#pragma mark - Post 请求 begin
#pragma mark - Post 请求 end

#pragma mark - 其他工具 begin
/** 取消某一个正在进行的请求
 */


/** 暂停某一个正在进行的请求
 */

/** 恢复某一个已经暂停的请求
 */

/** 将多个请求添加到一个队列中逐个请求
 */

#pragma mark - 其他工具 end





@end
