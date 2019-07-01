//
//  NSObject+GYSafeType.h
//  GY_Utils
//
//  Created by shuidi_iMac on 2019/3/5.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (GYSafeType)

- (NSInteger)gySafeIntegerValue;
- (id)gySafeArrayObjectAtIndex:(NSUInteger)index;
- (void)gySafeMutableArrayAddObject:(id)obj;
- (id)gySafeDictionaryValueForkey:(NSString *)key;

@end
NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

@interface NSString (GYSafeType)

+ (NSString *)gySafeNilStringSourceString:(NSString *)sourceStr DestinationDefaultString:(NSString *)destinationDefaultStr;
+ (NSString *)gySafeFormat:(NSString *)format;


@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

@interface NSArray (GYSafeType)

- (id)gySafeObjectAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (GYSafeType)

- (void)gySafeAddObject:(id)obj;

@end

NS_ASSUME_NONNULL_END



NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (GYSafeType)

- (id)gySafeValueForkey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END





