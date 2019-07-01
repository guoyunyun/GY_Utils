//
//  NSArray+GYSafeType.m
//  GY_Utils
//
//  Created by shuidi_iMac on 2019/3/5.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import "NSArray+GYSafeType.h"
#import <objc/runtime.h>

@implementation NSArray (GYSafeType)

+ (instancetype)gySafeArrayWithObjects:(const id _Nonnull [_Nonnull])objects count:(NSUInteger)cnt {
    
    id instance = nil;
    id safeObjs[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i ++) {
        if (!objects[i]) {
            continue;
        }
        safeObjs[j++] = objects[i];
    }
    instance = [self gySafeArrayWithObjects:safeObjs count:j];
    return instance;
}

- (id)gySafeArr0ObjectAtIndex:(NSUInteger)index {
    
    if (index >= [self count]) {
        return nil;
    }
    return [self gySafeArr0ObjectAtIndex:index];
}

- (id)gySafeArrIObjAtIndexedSubscript:(NSUInteger)index {
    if (index >= [self count]) {
        return nil;
    }
    return [self gySafeArrIObjAtIndexedSubscript:index];
}

- (id)gySafeSingleObjArrIObjectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        return nil;
    }
    return [self gySafeSingleObjArrIObjectAtIndex:index];
}

+ (void)load {
    
    Method originMethod = class_getClassMethod([NSArray class], @selector(arrayWithObjects:count:));
    Method alterMethod = class_getClassMethod([NSArray class], @selector(gySafeArrayWithObjects:count:));
    method_exchangeImplementations(originMethod, alterMethod);
    
    // __NSArray0
    Method originArr0ObjectAtIndexMethod = class_getInstanceMethod(NSClassFromString(@"__NSArray0"), @selector(objectAtIndex:));
    Method alterArr0ObjectAtIndexMethod = class_getInstanceMethod(NSClassFromString(@"__NSArray0"), @selector(gySafeArr0ObjectAtIndex:));
    method_exchangeImplementations(originArr0ObjectAtIndexMethod, alterArr0ObjectAtIndexMethod);
    
    // __NSSingleObjectArrayI
    Method originSingleObjArrIObjectAtIndexMethod = class_getInstanceMethod(NSClassFromString(@"__NSSingleObjectArrayI"), @selector(objectAtIndex:));
    Method alterSingleObjArrIObjectAtIndexMethod = class_getInstanceMethod(NSClassFromString(@"__NSSingleObjectArrayI"), @selector(gySafeSingleObjArrIObjectAtIndex:));
    method_exchangeImplementations(originSingleObjArrIObjectAtIndexMethod, alterSingleObjArrIObjectAtIndexMethod);
    
    // __NSArrayI
    Method originArrIObjAtIndexedSubMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(objectAtIndexedSubscript:));
    Method alterArrIObjAtIndexedSubMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(gySafeArrIObjAtIndexedSubscript:));
    method_exchangeImplementations(originArrIObjAtIndexedSubMethod, alterArrIObjAtIndexedSubMethod);
}


@end



NS_ASSUME_NONNULL_BEGIN

@implementation NSMutableArray (GYSafeType)

- (void)gySafeInsertObject:(id)obj atIndex:(NSUInteger)index {
    
    if (!obj) {
        return;
    }
    [self gySafeInsertObject:obj atIndex:index];
}

- (id)gySafeArrMObjAtIndexedSubscript:(NSUInteger)index {
    
    if (index >= self.count) {
        return nil;
    }
    return [self gySafeArrMObjAtIndexedSubscript:index];
}

+ (void)load {
    
    Class __NSArrayMClass = NSClassFromString(@"__NSArrayM");
    
    Method originInsertObjAtIndexMethod = class_getInstanceMethod(__NSArrayMClass, @selector(insertObject:atIndex:));
    Method alterInsertObjAtIndexMethod = class_getInstanceMethod(__NSArrayMClass, @selector(gySafeInsertObject:atIndex:));
    method_exchangeImplementations(originInsertObjAtIndexMethod, alterInsertObjAtIndexMethod);
    
    Method originObjAtIndexedSubMethod = class_getInstanceMethod(__NSArrayMClass, @selector(objectAtIndexedSubscript:));
    Method alterObjAtIndexedSubMethod = class_getInstanceMethod(__NSArrayMClass, @selector(gySafeArrMObjAtIndexedSubscript:));
    method_exchangeImplementations(originObjAtIndexedSubMethod, alterObjAtIndexedSubMethod);
    
    /**
     Method method1 = class_getInstanceMethod(__NSArrayMClass, originSel);
     method1 = class_getInstanceMethod([[NSMutableArray array] class], originSel);
     Printing description of method1:
     (Method) method1 = 0x00000001050870d8
     Printing description of method1:
     (Method) method1 = 0x00000001050870d8
     */
}

@end

NS_ASSUME_NONNULL_END
