//
//  NSDictionary+GYSafeType.h
//  GY_Utils
//
//  Created by shuidi_iMac on 2019/3/5.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (GYSafeType)

+ (void)swapMethod;

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (GYSafeType)

+ (void)swapMethod;

@end

NS_ASSUME_NONNULL_END
