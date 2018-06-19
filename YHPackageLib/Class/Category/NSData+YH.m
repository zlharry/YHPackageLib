//
//  NSData+YH.m
//  YHPackageLib
//
//  Created by sunshine on 2018/5/24.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "NSData+YH.h"
#import <CommonCrypto/CommonDigest.h>

#define CC_MD5_DIGEST_LENGTH 16

@implementation NSData (YH)


/** 对数据进行MD5加密 */
- (NSString *)md5String
{
    const char* original_str = (const char *)[self bytes];
    unsigned char digist[CC_MD5_DIGEST_LENGTH]; //CC_MD5_DIGEST_LENGTH = 16
    CC_MD5(original_str, (uint)strlen(original_str), digist);
    NSMutableString* outPutStr = [NSMutableString stringWithCapacity:10];
    for(int  i =0; i<CC_MD5_DIGEST_LENGTH;i++){
        [outPutStr appendFormat:@"%02x",digist[i]];//小写x表示输出的是小写MD5，大写X表示输出的是大写MD5
    }
    
    //也可以定义一个字节数组来接收计算得到的MD5值
    //    Byte byte[16];
    //    CC_MD5(original_str, strlen(original_str), byte);
    //    NSMutableString* outPutStr = [NSMutableString stringWithCapacity:10];
    //    for(int  i = 0; i<CC_MD5_DIGEST_LENGTH;i++){
    //        [outPutStr appendFormat:@"%02x",byte[i]];
    //    }
    //    [temp release];
    
    return [outPutStr lowercaseString];
}

@end
