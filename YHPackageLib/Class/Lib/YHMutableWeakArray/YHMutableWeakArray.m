//
//  YHMutableWeakArray.m
//  YHPackageLib
//
//  Created by harry on 2018/4/12.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "YHMutableWeakArray.h"



@interface YHMutableWeakArray ()

/** 存放weak对象的数组 */
@property (nonatomic, strong) NSPointerArray *pointerArray;

@end

@implementation YHMutableWeakArray

- (NSPointerArray *)pointerArray
{
    if (!_pointerArray){
        _pointerArray = [NSPointerArray weakObjectsPointerArray];
    }
    return _pointerArray;
}

/** 添加一个对象 */
- (void)addObject:(id)object {
    
    // 不可添加重复元素
    for (NSInteger  index = 0; index < self.pointerArray.count; index++) {
        id obj = [self objectAtIndex:index];
        if (obj == object) {
            return ;
        }
    }
    [self.pointerArray addPointer:(__bridge void * _Nullable)(object)];
}
/** 获取某一位置的对象 */
- (id)objectAtIndex:(NSInteger)index {
    return [self.pointerArray pointerAtIndex:index];
}

/** 移除某一位置的对象 */
- (void)removeObjectAtIndex:(NSInteger)index {
    [self.pointerArray removePointerAtIndex:index];
}

/** 移除某一个对象 */
- (void)removeObject:(id)object {
    for (NSInteger  index = 0; index < self.pointerArray.count; index++) {
        id obj = [self objectAtIndex:index];
        if (obj == object) {
            [self removeObjectAtIndex:index];
            break;
        }
    }
}
/** 移除所有对像 */
- (void)removeAllObjects
{
    for (NSInteger  index = 0; index < self.pointerArray.count; index++) {
        [self removeObjectAtIndex:index];
            
    }
}

- (NSInteger)count {return self.pointerArray.count;};

@end
