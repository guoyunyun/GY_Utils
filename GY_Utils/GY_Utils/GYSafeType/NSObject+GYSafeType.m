//
//  NSObject+GYSafeType.m
//  GY_Utils
//
//  Created by shuidi_iMac on 2019/3/5.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import "NSObject+GYSafeType.h"

//! 服务端返回数值类型有误
static NSInteger const kCustomErrorCode = 1000;

#if DEBUG

@implementation NSObject (GYSafeType)

- (NSInteger)gySafeIntegerValue {
    
    if ([self isKindOfClass:[NSNumber class]]) {
        return [((NSNumber *)self) integerValue];
    } else if([self isKindOfClass:[NSString class]]) {
        return [((NSString *)self) integerValue];
    } else {
        return kCustomErrorCode;
    }
}

- (id)gySafeArrayObjectAtIndex:(NSUInteger)index {
    
    if (![self isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    if (index < 0 || index >= ((NSArray *)self).count) {
        return nil;
    }
    
    return [(NSArray *)self objectAtIndex:index];
}

- (void)gySafeMutableArrayAddObject:(id)obj {
    
    if (!obj) {
        return;
    }
    if (![self isKindOfClass:[NSMutableArray class]]) {
        return;
    }
    [(NSMutableArray *)self addObject:obj];
}

- (id)gySafeDictionaryValueForkey:(NSString *)key {
    
    if (![self isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    if (![key isKindOfClass:[NSString class]]) {
        return nil;
    }
    return [(NSDictionary *)self valueForKey:key];
}

@end


@implementation NSString (GYSafeType)

+ (NSString *)gySafeNilStringSourceString:(NSString *)sourceStr DestinationDefaultString:(NSString *)destinationDefaultStr {
    
    if (!sourceStr) {
        return destinationDefaultStr;
    }
    if ([sourceStr isKindOfClass:[NSString class]]) {
        if (sourceStr.length == 0) {
            if (destinationDefaultStr) {
                return destinationDefaultStr;
            }
        } else {
            return sourceStr;
        }
    }
    return @"";
}

+ (NSString *)gySafeFormat:(NSString *)format {
    
    if (![format isKindOfClass:[NSString class]]) {
        return @"";
    }
    if (format) {
        return format;
    }
    return @"";
}

@end



@implementation NSArray (GYSafeType)

- (id)gySafeObjectAtIndex:(NSUInteger)index {
    
    if (index < 0) {
        return nil;
    }
    
    if (index >= self.count) {
        return nil;
    }
    
    return [self objectAtIndex:index];
}

@end


@implementation NSMutableArray (GYSafeType)

- (void)gySafeAddObject:(id)obj {
    
    if (!obj) {
        return;
    }
    [self addObject:obj];
}

@end


@implementation NSDictionary (GYSafeType)

- (id)gySafeValueForkey:(NSString *)key {
    
    if (![key isKindOfClass:[NSString class]]) {
        return nil;
    }
    return [self valueForKey:key];
}

@end





#endif
