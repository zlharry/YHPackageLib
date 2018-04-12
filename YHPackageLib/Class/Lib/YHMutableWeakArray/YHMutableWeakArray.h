//
//  YHMutableWeakArray.h
//  YHPackageLib
//
//  Created by harry on 2018/4/12.
//  Copyright © 2018年 harry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHMutableWeakArray : NSObject


/** 对象个数 */
@property (nonatomic, assign, readonly) NSInteger count;


/** 添加一个对象 */
- (void)addObject:(id)object;
/** 获取某一位置的对象 */
- (id)objectAtIndex:(NSInteger)index;
/** 移除某一位置的对象 */
- (void)removeObjectAtIndex:(NSInteger)index;
/** 移除某一个对象 */
- (void)removeObject:(id)object;
/** 移除所有对像 */
- (void)removeAllObjects;
@end
