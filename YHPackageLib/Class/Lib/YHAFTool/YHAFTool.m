//
//  YHAFTool.m
//  YHPackageLib
//
//  Created by harry on 2018/4/10.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "YHAFTool.h"

#import "AFNetworking.h"

@implementation YHAFTool


/** 异步发送一个GET请求 */
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(nullable NSDictionary *)parameters
                      success:(nullable void (^)(NSDictionary *responseObject))success
                      failure:(nullable void (^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes= [NSSet setWithObjects:@"text/html", nil];
    return [manager GET:URLString
             parameters:parameters
               progress:^(NSProgress * _Nonnull downloadProgress) {}
                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    if (success) success(responseObject);
                }
                failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    if (failure) failure(error);
                }];
}

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
                          failure:(nullable void (^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return [manager GET:URLString
             parameters:parameters
               progress:^(NSProgress * _Nonnull downloadProgress) {}
                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    if (success) success(responseObject);
                }
                failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    if (failure) failure(error);
                }];
}

@end
